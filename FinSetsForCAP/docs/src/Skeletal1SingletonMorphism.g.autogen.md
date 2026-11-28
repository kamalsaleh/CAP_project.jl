
```jldoctest Skeletal1SingletonMorphism.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1SingletonMorphism.g

julia> true
true

julia> a = FinSet1( 3 )
|3|

julia> sa = SingletonMorphism( a );

julia> Display( sa )
[ 1, 2, 3 ] ⱶ[ 2, 3, 5 ]→ [ 1,..., 8 ]

julia> sa == LowerSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) )
true

julia> sa == UpperSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) )
true

```
