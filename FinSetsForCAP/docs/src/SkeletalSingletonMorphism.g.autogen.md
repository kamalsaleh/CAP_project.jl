
```jldoctest SkeletalSingletonMorphism.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SkeletalSingletonMorphism.g

julia> true
true

julia> a = FinSet( 3 )
|3|

julia> sa = SingletonMorphism( a );

julia> Display( sa )
[ 0, 1, 2 ] ⱶ[ 1, 2, 4 ]→ [ 0,..., 7 ]

julia> sa == LowerSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) )
true

julia> sa == UpperSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) )
true

```
