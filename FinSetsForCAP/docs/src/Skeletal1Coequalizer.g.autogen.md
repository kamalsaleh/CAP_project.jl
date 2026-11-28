
```jldoctest Skeletal1Coequalizer.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1Coequalizer.g

julia> true
true

julia> s = FinSet1( 5 )
|5|

julia> t = FinSet1( 4 )
|4|

julia> f = MapOfFinSets( s, [ 3, 4, 4, 2, 4 ], t )
|5| → |4|

julia> g = MapOfFinSets( s, [ 3, 3, 4, 2, 4 ], t )
|5| → |4|

julia> D = [ f, g ];

julia> C = Coequalizer( D )
|3|

julia> pi = ProjectionOntoCoequalizer( D )
|4| → |3|

julia> Display( pi )
[ 1,..., 4 ] ⱶ[ 1, 2, 3, 3 ]→ [ 1, 2, 3 ]

julia> tau = MapOfFinSets( t, [ 2, 1, 2, 2 ], FinSet1( 2 ) )
|4| → |2|

julia> phi = UniversalMorphismFromCoequalizer( D, tau )
|3| → |2|

julia> Display( phi )
[ 1, 2, 3 ] ⱶ[ 2, 1, 2 ]→ [ 1, 2 ]

julia> PreCompose( pi, phi ) == tau
true

julia> s = FinSet1( 5 )
|5|

julia> t = FinSet1( 4 )
|4|

julia> f = MapOfFinSets( s, [ 2, 3, 3, 2, 4 ], t )
|5| → |4|

julia> g = MapOfFinSets( s, [ 2, 3, 2, 2, 4 ], t )
|5| → |4|

julia> D = [ f, g ];

julia> C = Coequalizer( D )
|3|

julia> pi = ProjectionOntoCoequalizer( D )
|4| → |3|

julia> Display( pi )
[ 1,..., 4 ] ⱶ[ 1, 2, 2, 3 ]→ [ 1, 2, 3 ]

julia> PreCompose( f, pi ) == PreCompose( g, pi )
true

julia> tau = MapOfFinSets( t, [ 1, 2, 2, 1 ], FinSet1( 2 ) )
|4| → |2|

julia> phi = UniversalMorphismFromCoequalizer( D, tau )
|3| → |2|

julia> Display( phi )
[ 1, 2, 3 ] ⱶ[ 1, 2, 1 ]→ [ 1, 2 ]

julia> PreCompose( pi, phi ) == tau
true

julia> s = FinSet1( 2 );

julia> t = FinSet1( 3 );

julia> f = MapOfFinSets( s, [ 1, 2 ], t );

julia> IsWellDefined( f )
true

julia> g = MapOfFinSets( s, [ 2, 3 ], t );

julia> IsWellDefined( g )
true

julia> C = Coequalizer( [ f, g ] )
|1|

```
