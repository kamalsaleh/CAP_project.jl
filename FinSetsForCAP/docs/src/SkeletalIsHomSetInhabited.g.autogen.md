
```jldoctest SkeletalIsHomSetInhabited.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SkeletalIsHomSetInhabited.g

julia> true
true

julia> L = FinSet( 0 )
|0|

julia> M = FinSet( 2 )
|2|

julia> N = FinSet( 3 )
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
