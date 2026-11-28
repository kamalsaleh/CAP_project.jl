
```jldoctest SingletonMorphism.g
julia> using CAP, CartesianCategories, FinSetsForCAP, Toposes

julia> # extracted from examples/SingletonMorphism.g

julia> true
true

julia> sFinSets = SkeletalCategoryOfFiniteSets(; no_precompiled_code = true )
SkeletalFinSets

julia> a = BigInt( 3 ) / sFinSets
|3|

julia> sa = SingletonMorphism( a )
|3| ↪ |8|

julia> Display( sa )
[ 0, 1, 2 ] ⱶ[ 1, 2, 4 ]→ [ 0,..., 7 ]

julia> sa == UpperSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) )
true

julia> sa == LowerSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) )
true

```
