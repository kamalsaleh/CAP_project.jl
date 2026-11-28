
```jldoctest Skeletal1Lift.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1Lift.g

julia> true
true

julia> m = FinSet1( 3 )
|3|

julia> n = FinSet1( 4 )
|4|

julia> f = MapOfFinSets( m, [ 2, 2, 1 ], m )
|3| → |3|

julia> g = MapOfFinSets( n, [ 3, 2, 1, 2 ], m )
|4| → |3|

julia> IsLiftable( f, g )
true

julia> chi = Lift( f, g )
|3| → |4|

julia> Display( chi )
[ 1, 2, 3 ] ⱶ[ 2, 2, 3 ]→ [ 1,..., 4 ]

julia> PreCompose( Lift( f, g ), g ) == f
true

julia> IsLiftable( g, f )
false

julia> k = FinSet1( 100000 )
|100000|

julia> h = ListWithIdenticalEntries( Cardinality( k ) - 3, 3 );

julia> h = @Concatenation( h, [ 2, 1, 2 ] );

julia> h = MapOfFinSets( k, h, m )
|100000| → |3|

julia> IsLiftable( f, h )
true

julia> IsLiftable( h, f )
false

```
