
```jldoctest Skeletal1IsHomSetInhabited.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1IsHomSetInhabited.g

julia> true
true

julia> L = FinSet1( 0 )
|0|

julia> M = FinSet1( 2 )
|2|

julia> N = FinSet1( 3 )
|3|

julia> IsHomSetInhabited( L, L )
true

julia> IsHomSetInhabited( M, L )
false

julia> IsHomSetInhabited( L, M )
true

julia> IsHomSetInhabited( M, N )
true

```
