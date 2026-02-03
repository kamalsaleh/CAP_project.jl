# Filter specialization registry for property-based dispatch

"""
Global registry mapping base filters to their specialized child filters.
Key: Base filter object
Value: Vector of child filters created via @FilterIntersectionWithProperties

This tracks the hierarchy: e.g., IsCapCategoryMorphism -> [IsCapCategoryMorphism_and_IsMonomorphism, ...]
"""
const FILTER_SPECIALIZATIONS_REGISTRY = Dict{Filter, Vector{Filter}}()

"""
Register a specialized filter with its base filter.
This is called automatically when filters are created via @FilterIntersectionWithProperties.

For @FilterIntersectionWithProperties(IsCapCategoryMorphism, IsMonomorphism),
this registers IsCapCategoryMorphism_and_IsMonomorphism as a child of IsCapCategoryMorphism.
"""
function register_filter_specialization(child_filter::Filter, base_filter::Filter)
    if !haskey(FILTER_SPECIALIZATIONS_REGISTRY, base_filter)
        FILTER_SPECIALIZATIONS_REGISTRY[base_filter] = Filter[]
    end
    
    # Add child filter if not already present
    if !(child_filter in FILTER_SPECIALIZATIONS_REGISTRY[base_filter])
        push!(FILTER_SPECIALIZATIONS_REGISTRY[base_filter], child_filter)
        
        # Sort by specificity (number of implied filters) - most specific first
        sort!(FILTER_SPECIALIZATIONS_REGISTRY[base_filter], 
              by = f -> length(f.implied_filters), 
              rev = true)
    end
    
    return child_filter
end

"""
Get all specialized child filters for a given base filter.
Returns an empty vector if no specializations exist.
"""
function get_filter_specializations(base_filter::Filter)
    get(FILTER_SPECIALIZATIONS_REGISTRY, base_filter, Filter[])
end

"""
Find the most specific matching filter for an object.
Checks all registered specializations and returns the one with highest specificity that matches.
"""
function dispatch_filter(obj)
    # Get the base filter of the object by type lookup
    obj_filter = FilterOfObject(obj)
    
    # If FilterOfObject returns nothing or non-Filter, cannot use specializations
    if !IsFilter(obj_filter)
        return obj_filter
    end
    
    # Check if there are any specializations for this filter
    specializations = get_filter_specializations(obj_filter)
    
    # Find the first (most specific) specialization that matches
    for spec_filter in specializations
        if spec_filter.additional_predicate(obj)
            return spec_filter
        end
    end
    
    # No specialization matches, return the base filter
    return obj_filter
end

"""
Find the most specific matching trait for an object.
Returns a Val{Symbol} trait based on the most specific filter match.
This is useful for trait-based dispatch patterns.
"""
function dispatch_trait(obj)
    best_filter = dispatch_filter(obj)
    
    # Handle case where FilterOfObject might return non-Filter
    if !IsFilter(best_filter)
        return Val{:Any}()
    end
    
    return Val{Symbol(best_filter.name)}()
end

# ============================================================================
# Filter-Based Method Dispatch System
# ============================================================================

"""
Global registry mapping operation names to their filter-specific method implementations.
Structure: Dict{Symbol, Vector{Tuple{Vector{Filter}, Function}}}
Key: Operation name (e.g., :MyMethod)
Value: Vector of (filter_signature, implementation) pairs, sorted by specificity

Example:
:MyMethod => [
    ([IsF1_and_IsProperty1, IsF2], method1),  # Most specific for arg1
    ([IsF1, IsF2_and_IsProperty2], method2),   # Most specific for arg2
    ([IsF1, IsF2], method3),                    # Base case
]
"""
const FILTER_METHOD_REGISTRY = Dict{Symbol, Vector{Tuple{Vector{Filter}, Function}}}()

"""
    register_filter_method(operation_name, filter_signature, implementation)

Register a method implementation for a specific filter signature.
This is called by @InstallFilterMethod to register methods in the dispatch system.

# Arguments
- `operation_name::Symbol`: Name of the operation (e.g., :MyMethod)
- `filter_signature::Vector{Filter}`: Filter requirements for each argument
- `implementation::Function`: The method implementation

# Example
```julia
register_filter_method(:MyMethod, [IsF1_and_IsProperty1], obj -> "specialized")
```
"""
function register_filter_method(operation_name::Symbol, filter_signature::Vector{Filter}, implementation::Function)
    if !haskey(FILTER_METHOD_REGISTRY, operation_name)
        FILTER_METHOD_REGISTRY[operation_name] = Tuple{Vector{Filter}, Function}[]
    end
    
    # Add the method
    push!(FILTER_METHOD_REGISTRY[operation_name], (filter_signature, implementation))
    
    # Sort by specificity: more specific signatures first
    # Specificity is determined by the sum of implied filters across all arguments
    sort!(FILTER_METHOD_REGISTRY[operation_name], 
          by = entry -> sum(length(f.implied_filters) for f in entry[1]), 
          rev = true)
    
    return implementation
end

"""
    matches_filter(obj, required_filter)

Check if an object matches a filter requirement.
Returns true if the object's filter is compatible with the required filter.

An object matches a filter if:
1. Its dispatch_filter is exactly the required filter, OR
2. Its dispatch_filter is more specific than the required filter (i.e., implies it)
"""
function matches_filter(obj, required_filter::Filter)
    obj_filter = dispatch_filter(obj)
    
    # If obj_filter is not a Filter, it cannot match
    if !IsFilter(obj_filter)
        return false
    end
    
    # Check if obj_filter is the same as required_filter
    if obj_filter === required_filter
        return true
    end
    
    # Check if obj_filter implies required_filter (is more specific)
    # For example, IsF1_and_IsProperty1 implies IsF1
    if required_filter in obj_filter.implied_filters
        return true
    end
    
    return false
end

"""
    find_filter_method(operation_name, args...)

Find the best matching method for given arguments based on their dispatch filters.
Returns the most specific matching implementation or nothing if no match.

The function checks each registered method signature in order of specificity.
A signature matches if ALL arguments match their required filters.
"""
function find_filter_method(operation_name::Symbol, args...)
    if !haskey(FILTER_METHOD_REGISTRY, operation_name)
        return nothing
    end
    
    methods = FILTER_METHOD_REGISTRY[operation_name]
    
    # Try each method signature in order of specificity (most specific first)
    for (filter_signature, implementation) in methods
        # Check argument count
        if length(args) != length(filter_signature)
            continue
        end
        
        # Check if all arguments match their required filters
        all_match = true
        for (arg, required_filter) in zip(args, filter_signature)
            if !matches_filter(arg, required_filter)
                all_match = false
                break
            end
        end
        
        if all_match
            return implementation
        end
    end
    
    return nothing
end

"""
    @dispatch operation(args...)

Dispatch a method call based on filter traits rather than Julia types.
This macro intercepts the call, checks each argument's dispatch_filter,
and calls the most specific matching method from the filter method registry.

If no filter-based method matches, it falls back to regular Julia type dispatch.

# Example
```julia
# Install methods for different filter levels
@InstallFilterMethod MyMethod([IsF1]) = obj -> "default for IsF1"
@InstallFilterMethod MyMethod([IsF1_and_IsProperty1]) = obj -> "specialized for IsProperty1"

# Multi-argument example
@InstallFilterMethod MyMethod([IsF1, IsF2]) = (obj1, obj2) -> "base"
@InstallFilterMethod MyMethod([IsF1_and_IsProperty1, IsF2]) = (obj1, obj2) -> "arg1 has property"

# Normal call uses Julia type dispatch
result = MyMethod(obj)

# Filter-based dispatch checks properties at runtime
result = @dispatch MyMethod(obj)  # Checks if obj has IsProperty1
result = @dispatch MyMethod(obj1, obj2)  # Checks filters for both arguments
```
"""
macro dispatch(expr)
    if !(expr isa Expr && expr.head === :call)
        error("@dispatch expects a function call, got: $expr")
    end
    
    operation = expr.args[1]
    args = expr.args[2:end]
    
    # Generate code that:
    # 1. Evaluates all arguments once
    # 2. Finds the matching filter method
    # 3. Calls it or falls back to regular dispatch
    
    arg_vars = [gensym("arg") for _ in args]
    
    return esc(quote
        # Evaluate arguments once
        $([:($var = $(arg)) for (var, arg) in zip(arg_vars, args)]...)
        
        # Try filter-based dispatch
        let method_impl = CAP.find_filter_method($(QuoteNode(operation)), $(arg_vars...))
            if method_impl !== nothing
                # Call the filter-specific method
                method_impl($(arg_vars...))
            else
                # Fall back to regular Julia dispatch
                $operation($(arg_vars...))
            end
        end
    end)
end

"""
    @InstallFilterMethod operation([Filter1, Filter2, ...]) = (arg1, arg2, ...) -> body

Install a method in the filter dispatch system.
This registers the method with its filter requirements for use with @dispatch.

Each filter in the signature can be:
- A base filter (e.g., `IsF1`)
- An intersection filter (e.g., `IsF1_and_IsF2`)
- A property-specialized filter (e.g., `IsF1_and_IsProperty1`)

The method will be called by @dispatch when all arguments match their respective filters.

# Examples
```julia
# Single argument
@InstallFilterMethod MyMethod([IsF1]) = obj -> "for IsF1"

# Single argument with property specialization
@InstallFilterMethod MyMethod([IsF1_and_IsProperty1]) = obj -> "for IsF1 with Property1"

# Multiple arguments with different filter requirements
@InstallFilterMethod MyMethod([IsF1, IsF2]) = (obj1, obj2) -> "base case"
@InstallFilterMethod MyMethod([IsF1_and_IsProperty1, IsF2]) = (obj1, obj2) -> "obj1 specialized"
@InstallFilterMethod MyMethod([IsF1, IsF2_and_IsProperty2]) = (obj1, obj2) -> "obj2 specialized"

# All arguments specialized
@InstallFilterMethod MyMethod([IsF1_and_IsProperty1, IsF2_and_IsProperty2]) = 
    (obj1, obj2) -> "both specialized"
```
"""
macro InstallFilterMethod(expr)
    if !(expr isa Expr && (expr.head === :(=) || expr.head === :function))
        error("@InstallFilterMethod expects an assignment or function definition")
    end
    
    # Parse the left-hand side
    lhs = expr.args[1]
    rhs = expr.args[2]
    
    if !(lhs isa Expr && lhs.head === :call)
        error("@InstallFilterMethod expects operation([filters...]) = impl")
    end
    
    operation = lhs.args[1]
    
    # Extract filter list
    if length(lhs.args) != 2 || !(lhs.args[2] isa Expr && lhs.args[2].head === :vect)
        error("@InstallFilterMethod expects operation([Filter1, Filter2, ...]) = impl")
    end
    
    filter_list = lhs.args[2].args
    
    # The RHS is already the implementation - just evaluate it in the caller's context
    # It's either a lambda expression or a function body
    return esc(quote
        # Resolve filter symbols to Filter objects
        local filter_objs = Filter[$(filter_list...)]
        
        # Evaluate the implementation in this scope
        local impl = $rhs
        
        # Register the method
        CAP.register_filter_method(
            $(QuoteNode(operation)),
            filter_objs,
            impl
        )
    end)
end

export register_filter_specialization, get_filter_specializations, dispatch_filter, dispatch_trait, FILTER_SPECIALIZATIONS_REGISTRY
export register_filter_method, find_filter_method, matches_filter, FILTER_METHOD_REGISTRY
export @dispatch, @InstallFilterMethod
