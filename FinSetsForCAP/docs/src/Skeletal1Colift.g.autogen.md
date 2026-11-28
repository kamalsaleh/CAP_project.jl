
```jldoctest Skeletal1Colift.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1Colift.g

julia> true
true

julia> I = InitialObject( SkeletalFinSets1 )
|0|

julia> iota = UniversalMorphismIntoTerminalObject( I )
|0| → |1|

julia> id = IdentityMorphism( I )
|0| → |0|

julia> IsColiftable( iota, id )
false

julia> m = FinSet1( 5 )
|5|

julia> n = FinSet1( 4 )
|4|

julia> f = MapOfFinSets( m, [ 2, 2, 1, 1, 3 ], n )
|5| → |4|

julia> g = MapOfFinSets( m, [ 5, 5, 4, 4, 5 ], m )
|5| → |5|

julia> IsColiftable( f, g )
true

julia> chi = Colift( f, g )
|4| → |5|

julia> Display( chi )
[ 1,..., 4 ] ⱶ[ 4, 5, 5, 1 ]→ [ 1,..., 5 ]

julia> PreCompose( f, Colift( f, g ) ) == g
true

julia> IsColiftable( g, f )
false

```
