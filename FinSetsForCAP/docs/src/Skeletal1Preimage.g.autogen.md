
```jldoctest Skeletal1Preimage.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1Preimage.g

julia> true
true

julia> m = FinSet1( 7 )
|7|

julia> n = FinSet1( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 7, 5, 5 ], m )
|3| → |7|

julia> P = Preimage( phi, [ 3 ] );

julia> Display( P )
[  ]

julia> P = Preimage( phi, AsList( FinSet1( 5 ) ) );

julia> Display( P )
[ 2, 3 ]

julia> List( P, phi ) == [ 5, 5 ]
true

```
