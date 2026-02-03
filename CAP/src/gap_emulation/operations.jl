## macros

const GLOBAL_COUNTER = Ref(0)

function next_id()
    GLOBAL_COUNTER[] += 1
end

macro DeclareOperation(name::String, filter_list = [])
	# prevent attributes from being redefined as operations
	if isdefined(__module__, Symbol(name))
		return nothing
	end
	symbol = Symbol(name)
	esc(quote
		function $symbol end
		nothing # suppress output when using the macro in tests
	end)
end

export @DeclareOperation

macro KeyDependentOperation(name::String, filter1, filter2, func)
	symbol = Symbol(name)
	symbol_op = Symbol(name * "Op")
	esc(quote
		@DeclareOperation($name)
		global const $symbol_op = $symbol
		nothing # suppress output when using the macro in tests
	end)
end

export @KeyDependentOperation

macro InstallMethod(operation::Symbol, description::String, filter_list, func)
	esc(:(@InstallMethod($operation, $filter_list, $func)))
end

function get_operation_for_installation(operation, filter_list)
	if IsAttribute(operation)
		@assert filter_list !== :nothing
		
		attr = operation
		
		if length(filter_list) === 1 && filter_list[1].abstract_type <: IsAttributeStoringRep.abstract_type
			return attr.operation
		end
	end
	
	return operation
end

macro InstallMethod(operation::Symbol, filter_list, func)
	if operation === :ViewObj
		println("ignoring installation for ViewObj, use ViewString instead")
		return
	elseif operation === :Display
		println("ignoring installation for Display, use DisplayString instead")
		return
	elseif operation === :Iterator
		println("ignoring installation for Iterator, install iterator in Julia instead")
		return
	end
	
	# Allow intersection filter expressions like `[IsF1 & IsF2]`.
	# We normalize them into a stable symbol (e.g. `IsF1_and_IsF2`) and ensure that
	# such a filter is defined in the caller module before we build the method signature.
	local setup_exprs = Any[]
	local filter_list_norm = filter_list
	if filter_list !== :nothing
		@assert (filter_list isa Expr && filter_list.head === :vect) "Assertion failed while installing $(operation) with the filter_list: $(filter_list)"

		function normalize_filter_term(term)
			if term isa Symbol
				return (Any[], term)
			end
			if term isa Expr && term.head === :call && term.args[1] === :FilterIntersection && length(term.args) >= 3
				# Handle FilterIntersection with multiple filters
				filters = term.args[2:end]
				
				# Recursively normalize each filter and collect setup expressions
				all_setups = Any[]
				normalized_syms = Symbol[]
				
				for filter in filters
					setups, sym = normalize_filter_term(filter)
					append!(all_setups, setups)
					push!(normalized_syms, sym)
				end
				
				# Create the intersection symbol by joining all filter names with "_and_"
				intersection_sym = Symbol(join(string.(normalized_syms), "_and_"))
				intersection_sym_qn = QuoteNode(intersection_sym)
				
				# Define a binding for the intersection filter in the caller module
				# We use `CAP.@FilterIntersection` so it works even if the macro isn't imported
				setup_intersection = quote
					if !isdefined(@__MODULE__, $intersection_sym_qn)
						CAP.@FilterIntersection $(normalized_syms...)
					end
				end
				
				return (Any[all_setups..., setup_intersection], intersection_sym)
			end
			
			if term isa Expr && term.head === :call && term.args[1] === :FilterIntersectionWithProperties && length(term.args) >= 3
				# Handle FilterIntersectionWithProperties(BaseFilter, Property1, Property2, ...)
				base_filter = term.args[2]
				properties = term.args[3:end]
				
				# Normalize the base filter
				all_setups = Any[]
				base_setups, base_sym = normalize_filter_term(base_filter)
				append!(all_setups, base_setups)
				
				# Properties are assumed to be symbols (attributes)
				property_syms = Symbol[]
				for prop in properties
					if prop isa Symbol
						push!(property_syms, prop)
					else
						error("FilterIntersectionWithProperties expects property names as symbols, got: $(prop)")
					end
				end
				
				# Create the intersection symbol: BaseFilter_and_Prop1_and_Prop2
				intersection_sym = Symbol(string(base_sym) * "_and_" * join(string.(property_syms), "_and_"))
				intersection_sym_qn = QuoteNode(intersection_sym)
				
				# Define a binding for the filter in the caller module
				setup_intersection = quote
					if !isdefined(@__MODULE__, $intersection_sym_qn)
						CAP.@FilterIntersectionWithProperties $base_sym $(property_syms...)
					end
				end
				
				return (Any[all_setups..., setup_intersection], intersection_sym)
			end
			
			error("Unsupported filter term in @InstallMethod: $(term). Use a filter symbol like `IsF1`, an intersection like `FilterIntersection(IsF1, IsF2)`, or a property filter like `FilterIntersectionWithProperties(IsF1, IsProp1)`.")
		end

		norm_args = Any[]
		for term in filter_list.args
			setups, sym = normalize_filter_term(term)
			append!(setup_exprs, setups)
			push!(norm_args, sym)
		end
		filter_list_norm = Expr(:vect, norm_args...)
	end
	
	if !(func isa Expr)
		if filter_list_norm === :nothing
			func = :((args...) -> $func(args...))
		else
			vars = Vector{Any}(map(i -> Symbol("arg", i), 1:length(filter_list_norm.args)))
			func = :(($(vars...),) -> $func($(vars...),))
		end
	end
	
	if func.head === :macrocall
		func = macroexpand(__module__, func; recursive = false)
	end
	
	if func.head === :->
		func.head = :function
		if func.args[1] isa Symbol
			func.args[1] = Expr(:tuple, func.args[1])
		end
	end
	
	@assert func.head === :function
	
	callable = :(::typeof(get_operation_for_installation($operation, $filter_list_norm)))
	
	if func.args[1].head === :tuple
		func.args[1] = Expr(:call, callable, func.args[1].args...)
	elseif func.args[1].head === :...
		@assert filter_list === :nothing # InstallMethod in GAP cannot be used for functions with varargs
		func.args[1] = Expr(:call, callable, func.args[1])
	else
		error("unsupported head: ", func.args[1].head)
	end
	
	is_kwarg = length(func.args[1].args) >= 2 && func.args[1].args[2] isa Expr && func.args[1].args[2].head === :parameters
	
	if filter_list_norm !== :nothing
		if is_kwarg
			offset = 2
		else
			offset = 1
		end
		
		types = map(x -> Expr(:., x, :(:abstract_type)), filter_list_norm.args)
		
		@assert length(filter_list_norm.args) == length(func.args[1].args) - offset
		for i in 1:length(filter_list_norm.args)
			func.args[1].args[i + offset] = Expr(:(::), func.args[1].args[i + offset], types[i])
			# specialize native types (e.g. vectors) for performance
			# Only check if the filter is already defined (skip for dynamically created intersections)
			filter_sym = filter_list_norm.args[i]
			if isdefined(__module__, filter_sym)
				filter_val = getfield(__module__, filter_sym)
				if IsFilter(filter_val) && !(filter_val.abstract_type <: IsAttributeStoringRep.abstract_type)
					func.args[1].args[i + offset] = Expr(:macrocall, Symbol("@specialize"), __source__, func.args[1].args[i + offset])
				end
			else
				# For not-yet-defined filters (like intersections), assume they need specialization
				func.args[1].args[i + offset] = Expr(:macrocall, Symbol("@specialize"), __source__, func.args[1].args[i + offset])
			end
		end
		
		# TODO: Generate trait-based dispatch wrapper for single-argument methods
		
	end
	
	block = quote
		$(setup_exprs...)
		$func
		nothing # suppress output when using the macro in tests
	end
	
	if filter_list_norm !== :nothing
		push!(block.args, :(CAP_precompile(get_operation_for_installation($operation, $filter_list_norm), ($(types...),))))
	end
	
	esc(block)
end

export @InstallMethod

## runtime

function DeclareOperation(name::String, filter_list = [])
	DeclareOperation(last(ModulesForEvaluationStack), name, filter_list)
	return nothing
end

function DeclareOperation(mod::Module, name::String, filter_list = [])
	# operations can be redeclared with different filters
	if isdefined(mod, Symbol(name))
		return nothing
	end
	NewOperation(mod, name, filter_list)
	return nothing
end

function NewOperation(name::String, filter_list = [])
	NewOperation(last(ModulesForEvaluationStack), name, filter_list)
end

function NewOperation(mod::Module, name::String, filter_list)
	operation = Symbol(name)
	if isdefined(mod, operation)
		while true
			operation = Symbol(name * "#ID:" * string(next_id()))
			if !isdefined(mod, operation)
				break;
			end
		end
	end
	Base.eval(mod, quote
		function $operation end
		export $operation
		$operation # return value
	end)
end

function InstallMethod(operation, filter_list, func)
	InstallMethod(last(ModulesForEvaluationStack), operation, filter_list, func)
end

function InstallMethod(mod::Module, operation::Function, filter_list, func::Function)
	if operation === ViewObj
		println("ignoring installation for ViewObj, use ViewString instead")
		return
	elseif operation === Display
		println("ignoring installation for Display, use DisplayString instead")
		return
	elseif operation === Iterator
		println("ignoring installation for Iterator, install iterate in Julia instead")
		return
	end
	
	nargs = length(filter_list)
	vars = Vector{Any}(map(i -> Symbol("arg", i), 1:nargs))
	types = [filter.abstract_type for filter in filter_list]
	vars_with_types = map(function(i)
		arg_symbol = vars[i]
		type = types[i]
		:($arg_symbol::$type)
	end, 1:length(filter_list))
	if IsAttribute( operation )
		if length(filter_list) === 1 && filter_list[1].abstract_type <: IsAttributeStoringRep.abstract_type
			funcref = Symbol(operation.operation)
			operation_to_precompile = operation.operation
		else
			funcref = :(::typeof($(Symbol(operation.name))))
			operation_to_precompile = operation
		end
	else
		funcref = Symbol(operation)
		operation_to_precompile = operation
	end
	
	if funcref isa Symbol && !isdefined(mod, funcref)
		print("WARNING: installing method in module ", mod, " for undefined symbol ", funcref, "\n")
	end
	
	for i in 1:length(types)
		# specialize native types (e.g. vectors) for performance
		if !(types[i] <: IsAttributeStoringRep.abstract_type)
			vars_with_types[i] = Expr(:macrocall, Symbol("@specialize"), LineNumberNode(@__LINE__, @__FILE__), vars_with_types[i])
		end
	end
	
	is_kwarg = any(m -> !isempty(Base.kwarg_decl(m)), methods(func))
	
	if is_kwarg
		Base.eval(mod, :(
			function $funcref($(vars_with_types...); kwargs...)
				$func($(vars...); kwargs...)
			end
		))
	else
		Base.eval(mod, :(
			function $funcref($(vars_with_types...))
				$func($(vars...))
			end
		))
	end
	
	CAP_precompile(operation_to_precompile, (types...,))
end

function InstallMethod(operation, description::String, filter_list, func)
	InstallMethod(operation, filter_list, func)
end

function InstallMethod(mod, operation, description::String, filter_list, func)
	InstallMethod(mod, operation, filter_list, func)
end

global const InstallOtherMethod = InstallMethod
function InstallMethodWithCacheFromObject( operation, filter_list, func; ArgumentNumber = 1 )
	InstallMethod( operation, filter_list, func )
end
function InstallMethodWithCache( operation, filter_list, func; InstallMethod = InstallMethod, Cache = "cache" )
	InstallMethod( operation, filter_list, func )
end
function InstallMethodWithCache( operation, description, filter_list, func; InstallMethod = InstallMethod, Cache = "cache" )
	InstallMethod( operation, filter_list, func )
end
global const InstallMethodWithCrispCache = InstallMethod
