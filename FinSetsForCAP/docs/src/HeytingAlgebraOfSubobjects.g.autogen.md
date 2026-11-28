
```jldoctest HeytingAlgebraOfSubobjects.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/HeytingAlgebraOfSubobjects.g

julia> true
true

julia> M = FinSet( (1):(7) )
<An object in FinSets>

julia> N = FinSet( [ 2, 3, 5 ] )
<An object in FinSets>

julia> iotaN = EmbeddingOfFinSets( N, M )
<A morphism in FinSets>

julia> NC = PseudoComplementSubobject( iotaN )
<An object in FinSets>

julia> Display( NC )
[ [ 1, [  ] ], [ 4, [  ] ], [ 6, [  ] ], [ 7, [  ] ] ]

julia> tauN = EmbeddingOfPseudoComplementSubobject( iotaN )
<A morphism in FinSets>

julia> Nc = ImageObject( tauN )
<An object in FinSets>

julia> Display( Nc )
[ 1, 4, 6, 7 ]

julia> L = FinSet( [ 2, 4, 5, 7 ] )
<An object in FinSets>

julia> iotaL = EmbeddingOfFinSets( L, M )
<A morphism in FinSets>

julia> NIL = IntersectionSubobject( iotaN, iotaL )
<An object in FinSets>

julia> Display( NIL )
[ [ 2, 2 ], [ 5, 5 ] ]

julia> iotaNiL = EmbeddingOfIntersectionSubobject( iotaN, iotaL )
<A morphism in FinSets>

julia> NiL = ImageObject( iotaNiL )
<An object in FinSets>

julia> Display( NiL )
[ 2, 5 ]

julia> NUL = UnionSubobject( iotaN, iotaL )
<An object in FinSets>

julia> Display( NUL )
[ 2, 3, 5, 4, 7 ]

julia> iotaNuL = EmbeddingOfUnionSubobject( iotaN, iotaL )
<A morphism in FinSets>

julia> NuL = ImageObject( iotaNuL )
<An object in FinSets>

julia> Display( NuL )
[ 2, 3, 5, 4, 7 ]

julia> NPL = RelativePseudoComplementSubobject( iotaN, iotaL )
<An object in FinSets>

julia> Display( NPL )
[ [ 1, [  ] ], [ 2, [  ] ], [ 4, [  ] ], [ 5, [  ] ], [ 6, [  ] ], [ 7, [  ] ] ]

julia> iotaNpL = EmbeddingOfRelativePseudoComplementSubobject( iotaN, iotaL )
<A morphism in FinSets>

julia> NpL = ImageObject( iotaNpL )
<An object in FinSets>

julia> Display( NpL )
[ 1, 2, 4, 5, 6, 7 ]

```
