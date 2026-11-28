
```jldoctest Skeletal1ImageEmbedding.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1ImageEmbedding.g

julia> true
true

julia> m = FinSet1( 7 )
|7|

julia> n = FinSet1( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 7, 5, 5 ], m )
|3| → |7|

julia> pi = ImageEmbedding( phi )
|2| → |7|

julia> Display( pi )
[ 1, 2 ] ⱶ[ 5, 7 ]→ [ 1,..., 7 ]

```
