
```jldoctest FinSet.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/doc/FinSet.g

julia> true
true

julia> S = FinSet( [ 1, 3, 2, 2, 1 ] )
<An object in FinSets>

julia> Display( S )
[ 1, 2, 3 ]

julia> L = AsList( S );

julia> Display( L )
[ 1, 2, 3 ]

julia> Q = FinSet( L )
<An object in FinSets>

julia> S == Q
true

julia> FinSet( [ 1, 2 ] ) == FinSet( [ 2, 1 ] )
true

julia> M = FinSetNC( [ 1, 2, 3, 3 ] )
<An object in FinSets>

julia> IsWellDefined( M )
false

```
