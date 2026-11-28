
```jldoctest Skeletal1Equalizer.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1Equalizer.g

julia> true
true

julia> S = FinSet1( 5 )
|5|

julia> T = FinSet1( 3 )
|3|

julia> f1 = MapOfFinSets( S, [ 3, 3, 1, 2, 2 ], T )
|5| → |3|

julia> f2 = MapOfFinSets( S, [ 3, 2, 3, 1, 2 ], T )
|5| → |3|

julia> f3 = MapOfFinSets( S, [ 3, 1, 2, 1, 2 ], T )
|5| → |3|

julia> D = [ f1, f2, f3 ];

julia> Eq = Equalizer( D )
|2|

julia> iota = EmbeddingOfEqualizer( D )
|2| → |5|

julia> Display( iota )
[ 1, 2 ] ⱶ[ 1, 5 ]→ [ 1,..., 5 ]

julia> phi = MapOfFinSets( FinSet1( 2 ), [ 5, 1 ], S );

julia> IsWellDefined( phi )
true

julia> psi = UniversalMorphismIntoEqualizer( D, phi )
|2| → |2|

julia> IsWellDefined( psi )
true

julia> Display( psi )
[ 1, 2 ] ⱶ[ 2, 1 ]→ [ 1, 2 ]

julia> PreCompose( psi, iota ) == phi
true

julia> D = [ f2, f3 ];

julia> Eq = Equalizer( D )
|3|

julia> psi = EmbeddingOfEqualizer( D )
|3| → |5|

julia> Display( psi )
[ 1, 2, 3 ] ⱶ[ 1, 4, 5 ]→ [ 1,..., 5 ]

```
