
```jldoctest SkeletalColift.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SkeletalColift.g

julia> true
true

julia> I = InitialObject( SkeletalFinSets )
|0|

julia> iota = UniversalMorphismIntoTerminalObject( I )
|0| → |1|

julia> id = IdentityMorphism( I )
|0| → |0|

julia> IsColiftable( iota, id )
false

julia> m = FinSet( 5 )
|5|

julia> n = FinSet( 4 )
|4|

julia> f = MapOfFinSets( m, [ 1, 1, 0, 0, 2 ], n )
|5| → |4|

julia> g = MapOfFinSets( m, [ 4, 4, 3, 3, 4 ], m )
|5| → |5|

julia> IsColiftable( f, g )
true

julia> chi = Colift( f, g )
|4| → |5|

julia> Display( chi )
[ 0,..., 3 ] ⱶ[ 3, 4, 4, 0 ]→ [ 0,..., 4 ]

julia> PreCompose( f, Colift( f, g ) ) == g
true

julia> IsColiftable( g, f )
false

```
