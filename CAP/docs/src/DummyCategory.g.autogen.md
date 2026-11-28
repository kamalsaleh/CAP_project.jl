
```jldoctest DummyCategory.g
julia> using CAP

julia> # extracted from examples/DummyCategory.g

julia> true
true

julia> list_of_operations_to_install = [
            "ObjectConstructor",
            "MorphismConstructor",
            "ObjectDatum",
            "MorphismDatum",
            "IsCongruentForMorphisms",
            "PreCompose",
            "IdentityMorphism",
            "DirectSum",
        ];

julia> dummy = DummyCategory( @rec(
            list_of_operations_to_install = list_of_operations_to_install,
            properties = [ "IsAdditiveCategory" ],
        ) );

julia> ForAll( list_of_operations_to_install, o -> CanCompute( dummy, o ) )
true

julia> IsAdditiveCategory( dummy )
true

```
