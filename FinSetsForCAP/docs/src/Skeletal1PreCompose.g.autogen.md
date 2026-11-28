
```jldoctest Skeletal1PreCompose.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1PreCompose.g

julia> true
true

julia> m = FinSet1( 3 )
|3|

julia> n = FinSet1( 5 )
|5|

julia> p = FinSet1( 7 )
|7|

julia> psi = MapOfFinSets( m, [ 2, 5, 3 ], n )
|3| → |5|

julia> phi = MapOfFinSets( n, [ 1, 4, 6, 6, 3 ], p )
|5| → |7|

julia> alpha = PreCompose( psi, phi )
|3| → |7|

julia> Display( alpha )
[ 1, 2, 3 ] ⱶ[ 4, 3, 6 ]→ [ 1,..., 7 ]

```
