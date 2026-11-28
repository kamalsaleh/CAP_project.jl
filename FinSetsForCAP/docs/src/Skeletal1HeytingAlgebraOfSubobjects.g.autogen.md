
```jldoctest Skeletal1HeytingAlgebraOfSubobjects.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1HeytingAlgebraOfSubobjects.g

julia> true
true

julia> M = FinSet1( 7 )
|7|

julia> N = FinSet1( 3 )
|3|

julia> iotaN = MapOfFinSets( N, [ 2, 3, 5 ], M )
|3| → |7|

julia> NC = PseudoComplementSubobject( iotaN )
|4|

julia> tauN = EmbeddingOfPseudoComplementSubobject( iotaN )
|4| ↪ |7|

julia> Display( tauN )
[ 1,..., 4 ] ⱶ[ 1, 4, 6, 7 ]→ [ 1,..., 7 ]

julia> L = FinSet1( 4 )
|4|

julia> iotaL = MapOfFinSets( L, [ 2, 4, 5, 7 ], M )
|4| → |7|

julia> NIL = IntersectionSubobject( iotaN, iotaL )
|2|

julia> iotaNiL = EmbeddingOfIntersectionSubobject( iotaN, iotaL )
|2| ↪ |7|

julia> Display( iotaNiL )
[ 1, 2 ] ⱶ[ 2, 5 ]→ [ 1,..., 7 ]

julia> NUL = UnionSubobject( iotaN, iotaL )
|5|

julia> iotaNuL = EmbeddingOfUnionSubobject( iotaN, iotaL )
|5| → |7|

julia> Display( iotaNuL )
[ 1,..., 5 ] ⱶ[ 2, 3, 4, 5, 7 ]→ [ 1,..., 7 ]

julia> NPL = RelativePseudoComplementSubobject( iotaN, iotaL )
|6|

julia> iotaNpL = EmbeddingOfRelativePseudoComplementSubobject( iotaN, iotaL )
|6| ↪ |7|

julia> Display( iotaNpL )
[ 1,..., 6 ] ⱶ[ 1, 2, 4, 5, 6, 7 ]→ [ 1,..., 7 ]

```
