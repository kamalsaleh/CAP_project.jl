
```jldoctest SkeletalImageEmbedding.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SkeletalImageEmbedding.g

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> n = FinSet( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 6, 4, 4 ], m )
|3| → |7|

julia> pi = ImageEmbedding( phi )
|2| → |7|

julia> Display( pi )
[ 0, 1 ] ⱶ[ 4, 6 ]→ [ 0,..., 6 ]

```
