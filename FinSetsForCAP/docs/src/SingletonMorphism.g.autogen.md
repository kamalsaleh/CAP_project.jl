
```jldoctest SingletonMorphism.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SingletonMorphism.g

julia> true
true

julia> a = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> sa = SingletonMorphism( a )
<A morphism in FinSets>

julia> sa == LowerSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) )
true

julia> sa == UpperSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) )
true

```
