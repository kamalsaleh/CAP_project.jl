
```jldoctest SkeletalPreimage.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SkeletalPreimage.g

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> n = FinSet( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 6, 4, 4 ], m )
|3| → |7|

julia> P = Preimage( phi, [ 2 ] );

julia> Display( P )
[  ]

julia> P = Preimage( phi, AsList( FinSet( 5 ) ) );

julia> Display( P )
[ 1, 2 ]

julia> List( P, phi ) == [ 4, 4 ]
true

```
