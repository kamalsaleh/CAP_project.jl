
```jldoctest Skeletal1Pushout.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1Pushout.g

julia> true
true

julia> M = FinSet1( 5 )
|5|

julia> N1 = FinSet1( 3 )
|3|

julia> iota1 = EmbeddingOfFinSets( N1, M )
|3| ↪ |5|

julia> Display( iota1 )
[ 1, 2, 3 ] ⱶ[ 1 .. 3 ]→ [ 1,..., 5 ]

julia> N2 = FinSet1( 2 )
|2|

julia> iota2 = EmbeddingOfFinSets( N2, M )
|2| ↪ |5|

julia> Display( iota2 )
[ 1, 2 ] ⱶ[ 1 .. 2 ]→ [ 1,..., 5 ]

julia> D = [ iota1, iota2 ];

julia> Fib = FiberProduct( D )
|2|

julia> pi1 = ProjectionInFactorOfFiberProduct( D, 1 )
|2| → |3|

julia> Display( pi1 )
[ 1, 2 ] ⱶ[ 1, 2 ]→ [ 1, 2, 3 ]

julia> pi2 = ProjectionInFactorOfFiberProduct( D, 2 )
|2| → |2|

julia> Display( pi2 )
[ 1, 2 ] ⱶ[ 1, 2 ]→ [ 1, 2 ]

```

```jldoctest Skeletal1Pushout.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1Pushout.g

julia> true
true

julia> D = [ pi1, pi2 ];

julia> UU = Pushout( D )
|3|

julia> kappa1 = InjectionOfCofactorOfPushout( D, 1 )
|3| → |3|

julia> Display( kappa1 )
[ 1, 2, 3 ] ⱶ[ 1, 2, 3 ]→ [ 1, 2, 3 ]

julia> kappa2 = InjectionOfCofactorOfPushout( D, 2 )
|2| → |3|

julia> Display( kappa2 )
[ 1, 2 ] ⱶ[ 1, 2 ]→ [ 1, 2, 3 ]

julia> PreCompose( pi1, kappa1 ) == PreCompose( pi2, kappa2 )
true

```

```jldoctest Skeletal1Pushout.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1Pushout.g

julia> true
true

julia> Co = Coproduct( N1, N2 )
|5|

julia> Display( Co )
[ 1,..., 5 ]

julia> iota_1 = InjectionOfCofactorOfCoproduct( [ N1, N2 ], 1 )
|3| → |5|

julia> Display( iota_1 )
[ 1, 2, 3 ] ⱶ[ 1, 2, 3 ]→ [ 1,..., 5 ]

julia> iota_2 = InjectionOfCofactorOfCoproduct( [ N1, N2 ], 2 )
|2| → |5|

julia> Display( iota_2 )
[ 1, 2 ] ⱶ[ 4, 5 ]→ [ 1,..., 5 ]

julia> alpha = PreCompose( pi1, iota_1 )
|2| → |5|

julia> Display( alpha )
[ 1, 2 ] ⱶ[ 1, 2 ]→ [ 1,..., 5 ]

julia> beta = PreCompose( pi2, iota_2 )
|2| → |5|

julia> Display( beta )
[ 1, 2 ] ⱶ[ 4, 5 ]→ [ 1,..., 5 ]

julia> Cq = Coequalizer( [ alpha, beta ] )
|3|

julia> psi = ProjectionOntoCoequalizer( [ alpha, beta ] )
|5| → |3|

julia> Display( psi )
[ 1,..., 5 ] ⱶ[ 1, 2, 3, 1, 2 ]→ [ 1, 2, 3 ]

julia> Display( PreCompose( iota_1, psi ) )
[ 1, 2, 3 ] ⱶ[ 1, 2, 3 ]→ [ 1, 2, 3 ]

julia> Display( PreCompose( iota_2, psi ) )
[ 1, 2 ] ⱶ[ 1, 2 ]→ [ 1, 2, 3 ]

julia> PreCompose( alpha, psi ) == PreCompose( beta, psi )
true

```
