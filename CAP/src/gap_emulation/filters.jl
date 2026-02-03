struct Filter <: Function
	name::String
	abstract_type::Type
	concrete_type::Type
	subtypable::Bool
	additional_predicate::Function
	implied_filters::Vector{Function}
	is_filter_intersection_with_properties::Bool
end

# Add a better show method for filters (emulating GAP's view method)
function Base.show(io::IO, ::MIME"text/plain", filter::Filter)
	print(io, "<Filter \"$(filter.name)\">")
end

function Filter(name::String, abstract_type::Type)
	Filter(name, abstract_type, obj -> true)
end

function Filter(name::String, abstract_type::Type, additional_predicate::Function)
	Filter(name, abstract_type, Any, true, additional_predicate, Function[], false)
end

function (filter::Filter)(obj)
	# First check: is obj an instance of this filter's abstract type?
	if isa(obj, filter.abstract_type)
		return filter.additional_predicate(obj)
	end
	
	filter_obj = FilterOfObject(obj)
	
	if filter_obj === nothing
		return false
	end
	
	# Second check: if filter is implied by the object's filter, return true
	if filter in filter_obj.implied_filters
		return true
	end
	
	# Third check: filter is intersection with properties
	if filter.is_filter_intersection_with_properties && (filter_obj in filter.implied_filters)
	return filter.additional_predicate(obj)
	end

	return false
end

function IsFilter( obj )
	obj isa Filter
end

# Get the filter associated with an object by deriving filter name from type name
function FilterOfObject(obj)
	T = typeof(obj)
	
	# Walk up the type hierarchy to find a filter
	current_type = T
	while current_type != Any
		# Get the base type name (without parameters)
		type_name = if current_type isa UnionAll
			string(current_type)
		else
			string(Base.typename(current_type).name)
		end
		
		# Check if this looks like a filter concrete type
		if startswith(type_name, "TheJuliaConcreteType")
			# Extract filter name by removing the prefix
			filter_name = type_name[21:end]  # Remove "TheJuliaConcreteType" (20 chars)
			
			filter_symbol = Symbol(filter_name)
			
			# Get the module where the type was defined
			type_module = Base.typename(current_type).module
			
			# Search in the type's module first, then Main and ModulesForEvaluationStack
			search_modules = unique([type_module, Main, ModulesForEvaluationStack...])
			
			for mod in search_modules
				if isdefined(mod, filter_symbol)
					candidate = getfield(mod, filter_symbol)
					if IsFilter(candidate)
						return candidate
					end
				end
			end
		end
		
		# Move to supertype
		current_type = supertype(current_type)
	end
	
	return nothing
end

export FilterOfObject

macro DeclareFilter(name::String, parent_filter::Union{Symbol,Expr} = :IsObject)
	filter_symbol = Symbol(name)
	abstract_type_symbol = Symbol("TheJuliaAbstractType", name)
	concrete_type_symbol = Symbol("TheJuliaConcreteType", name)
	
	# Check if parent_filter is an Intersection expression (e.g., FilterIntersection(filter1, filter2, ...))
	if parent_filter isa Expr && parent_filter.head == :call && parent_filter.args[1] == :FilterIntersection
		# Extract all filters from the Intersection expression (args[2:end])
		filters = parent_filter.args[2:end]
		
		length(filters) < 2 && error("@DeclareFilter: FilterIntersection must have at least two filters")
		all(f -> f isa Symbol, filters) || error("@DeclareFilter: all arguments of FilterIntersection must be filter names (Symbols)")
		
		intersection_name = Symbol(join(string.(filters), "_and_"))
		
		# We need to ensure the intersection filter exists at runtime
		parent_filter =
			quote
				if !@isdefined($intersection_name)
					@FilterIntersection $(filters...)
				end
				$intersection_name
			end
	
	# Check if parent_filter is a FilterIntersectionWithProperties expression (e.g., FilterIntersectionWithProperties(filter, prop1, prop2, ...))
	elseif parent_filter isa Expr && parent_filter.head == :call && parent_filter.args[1] == :FilterIntersectionWithProperties
		# Extract the base filter and properties from the expression
		base_filter = parent_filter.args[2]
		properties = parent_filter.args[3:end]
		
		base_filter isa Symbol || error("@DeclareFilter: first argument of FilterIntersectionWithProperties must be a filter name (Symbol)")
		isempty(properties) && error("@DeclareFilter: FilterIntersectionWithProperties must have at least one property")
		all(p -> p isa Symbol, properties) || error("@DeclareFilter: property arguments of FilterIntersectionWithProperties must be property names (Symbols)")
		
		properties_name = join(string.(properties), "_and_")
		intersection_name = Symbol(string(base_filter), "_and_", properties_name)
		
		# We need to ensure the intersection filter exists at runtime
		parent_filter =
			quote
				if !@isdefined($intersection_name)
					@FilterIntersectionWithProperties $base_filter $(properties...)
				end
				$intersection_name
			end
	end
	
	additional_predicate = :(obj -> $parent_filter.additional_predicate(obj))
	implied_filters = :(unique(vcat([$parent_filter], $parent_filter.implied_filters)))
	
	# all our macros are meant to fully execute in the context where the macro is called -> always fully escape them
	esc(quote
		local parent = $parent_filter
		@assert parent.subtypable
		abstract type $abstract_type_symbol <: parent.abstract_type end
		struct $concrete_type_symbol{T} <: $abstract_type_symbol
			dict::Dict{Symbol, Any}
		end
		global const $filter_symbol = Filter($name, $abstract_type_symbol, $concrete_type_symbol, true, $additional_predicate, $implied_filters, false)
		nothing # suppress output when using the macro in tests
	end)
end

export @DeclareFilter

function NewFilter( name, parent_filter )
	if !parent_filter.subtypable
		throw("cannot create NewFilter with a parent filter which was itself created by NewFilter")
	end
	type_symbol = Symbol(name, gensym())
	concrete_type = parent_filter.concrete_type{type_symbol}
	Filter(name, concrete_type, concrete_type, false, obj -> true, [parent_filter], false)
end

global const NewCategory = NewFilter
