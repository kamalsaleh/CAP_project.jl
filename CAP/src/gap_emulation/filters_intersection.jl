
# Intersection filter macro

macro FilterIntersection(filters...)
	length(filters) < 2 && error("@FilterIntersection expects at least two filters")
	all(f -> f isa Symbol, filters) || error("@FilterIntersection expects filter names (Symbols) as arguments")
	
	# Create a runtime expression to compute the filter name from actual filter.name properties
	filter_name_expr = :(join([$([:($f.name) for f in filters]...)], "_and_"))
	
	# For type names (computed at macro expansion time), use symbol strings as placeholder
	filter_name = join(string.(filters), "_and_")
	abstract_type_name = Symbol("TheJuliaAbstractType", filter_name)
	concrete_type_name = Symbol("TheJuliaConcreteType", filter_name)
	abstract_type_qn = QuoteNode(abstract_type_name)
	concrete_type_qn = QuoteNode(concrete_type_name)
	
	# In Julia, intersection types do not have a direct representation as a type.
	# Instead, we choose the first filter's abstract type as the base type for the intersection.
	first_filter = filters[1]
	
	# Build predicate: obj -> filter1.additional_predicate(obj) && filter2.additional_predicate(obj) && ...
	predicate_checks = Expr(:&&, :($first_filter.additional_predicate(obj)))
	for f in filters[2:end]
		push!(predicate_checks.args, :($f.additional_predicate(obj)))
	end
	additional_predicate = :(obj -> $predicate_checks)
	
	# Collect all filters and their implied filters
	implied_filters_expr = Expr(:vcat, Expr(:vect, filters...))
	for f in filters
		push!(implied_filters_expr.args, :($f.implied_filters))
	end
	implied_filters = :(unique($implied_filters_expr))
	
	esc(quote
		# Validate that all arguments are Filters
		$([:(isa($(f), Filter) || error("@FilterIntersection: argument ", $(string(f)), " is not a Filter")) for f in filters]...)
		
		# Define types once per caller module.
		if !isdefined(@__MODULE__, $abstract_type_qn)
			abstract type $abstract_type_name <: $(first_filter).abstract_type end
		end
		if !isdefined(@__MODULE__, $concrete_type_qn)
			struct $concrete_type_name{T} <: $abstract_type_name
				dict::Dict{Symbol, Any}
			end
		end
		
		# Create the FilterIntersection
		local new_filter = Filter($filter_name_expr, $abstract_type_name, $concrete_type_name, true, $additional_predicate, $implied_filters, false)
		
		# Create variable with symbol-based name (predictable from macro call)
		global const $(Symbol(filter_name)) = new_filter
		
		# Also create variable with actual filter name (for GAP compatibility)
		# Must be done at runtime since filter_name_expr evaluates at runtime
		Core.eval(@__MODULE__, :(const $(Symbol(new_filter.name)) = $new_filter))
		
		# Note: FilterIntersection does not register specializations
		# Only FilterIntersectionWithProperties tracks the base->child relationship
		
		nothing # suppress output when using the macro in tests
	end)
end

function FilterIntersection(filters::Filter...)
	length(filters) < 2 && error("FilterIntersection expects at least two filters")
	
	name = join([f.name for f in filters], "_and_")
	
	# If it is available in the module stack or Main, return it
	for m in [Main, ModulesForEvaluationStack...]
		if isdefined(m, Symbol(name))
			existing = getfield(m, Symbol(name))
			if isa(existing, Filter)
				return existing
			end
		end
	end
	
	filter_names = join([f.name for f in filters], " ")
	error("FilterIntersection must be created first via '@FilterIntersection $(filter_names)' macro.")
	
end

export @FilterIntersection, FilterIntersection

# Property Filter macro - creates type hierarchy
macro FilterIntersectionWithProperties(base_filter, properties...)
	base_filter isa Symbol || error("@FilterIntersectionWithProperties expects a filter name (Symbol) as first argument")
	isempty(properties) && error("@FilterIntersectionWithProperties expects at least one property")
	all(p -> p isa Symbol, properties) || error("@FilterIntersectionWithProperties expects property names (Symbols) as remaining arguments")

	# Create a runtime expression to compute the filter name from actual filter.name and property names
	properties_name_expr = :(join([$([:($p.name) for p in properties]...)], "_and_"))
	filter_name_expr = :($base_filter.name * "_and_" * $properties_name_expr)
	
	# For type names (computed at macro expansion time), use symbol strings as placeholder
  filter_name = string(base_filter) * "_and_" * join(string.(properties), "_and_")
	abstract_type_name = Symbol("TheJuliaAbstractType", filter_name)
	concrete_type_name = Symbol("TheJuliaConcreteType", filter_name)
	abstract_type_qn = QuoteNode(abstract_type_name)
	concrete_type_qn = QuoteNode(concrete_type_name)
	# Build predicate: obj -> base_filter_pred(obj) && prop1(obj) && prop2(obj) && ...
	predicate_checks = Expr(:&&, :($base_filter.additional_predicate(obj)))
	for prop in properties
    push!(predicate_checks.args, :($prop.tester(obj)))
	end
  for prop in properties
    push!(predicate_checks.args, :($prop(obj)))
  end
	additional_predicate = :(obj -> $predicate_checks)
	implied_filters = :(unique(vcat( [$base_filter], $base_filter.implied_filters )))
	
	esc(quote
		# Define types once per caller module - subtype of base filter's abstract type
		if !isdefined(@__MODULE__, $abstract_type_qn)
			abstract type $abstract_type_name <: $base_filter.abstract_type end
		end
		if !isdefined(@__MODULE__, $concrete_type_qn)
			struct $concrete_type_name{T} <: $abstract_type_name
				dict::Dict{Symbol, Any}
			end
		end
		
		# Create the FilterIntersectionWithProperties
		local new_filter = Filter($filter_name_expr, $abstract_type_name, $concrete_type_name, true, $additional_predicate, $implied_filters, true)
		
		# Create variable with symbol-based name (predictable from macro call)
		global const $(Symbol(filter_name)) = new_filter
		
		# Also create variable with actual filter name (for GAP compatibility)
		# Must be done at runtime since filter_name_expr evaluates at runtime
		Core.eval(@__MODULE__, :(const $(Symbol(new_filter.name)) = $new_filter))
		
		# Register this specialized filter with its base filter
		register_filter_specialization(new_filter, $base_filter)
		
		nothing # suppress output when using the macro in tests
	end)
end

function FilterIntersectionWithProperties(base_filter::Filter, properties::Vararg{Attribute})
	# if exists in the module stack or main, return that  
	properties_name = join([property.name for property in properties], "_and_")
	combined_name = Symbol(string(base_filter.name, "_and_", properties_name))
	
	for m in [Main, ModulesForEvaluationStack...]
		if isdefined(m, combined_name)
			existing = getfield(m, combined_name)
			if isa(existing, Filter)
				return existing
			end
		end
	end
	# Fallback: error
	error("No FilterIntersectionWithProperties type found for combination of filter $(base_filter.name) and properties $(join([property.name for property in properties], ", ")). Please declare it using @FilterIntersectionWithProperties macro.")
end

export @FilterIntersectionWithProperties, FilterIntersectionWithProperties