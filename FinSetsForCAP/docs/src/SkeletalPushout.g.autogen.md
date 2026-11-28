
```jldoctest SkeletalPushout.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SkeletalPushout.g

julia> true
true

julia> M = FinSet( 5 )
|5|

julia> N1 = FinSet( 3 )
|3|

julia> iota1 = EmbeddingOfFinSets( N1, M )
|3| ↪ |5|

julia> Display( iota1 )
[ 0, 1, 2 ] ⱶ[ 0 .. 2 ]→ [ 0,..., 4 ]

julia> N2 = FinSet( 2 )
|2|

julia> iota2 = EmbeddingOfFinSets( N2, M )
|2| ↪ |5|

julia> Display( iota2 )
[ 0, 1 ] ⱶ[ 0 .. 1 ]→ [ 0,..., 4 ]

julia> D = [ iota1, iota2 ];

julia> Fib = FiberProduct( D )
|2|

julia> pi1 = ProjectionInFactorOfFiberProduct( D, 1 )
|2| → |3|

julia> Display( pi1 )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1, 2 ]

julia> pi2 = ProjectionInFactorOfFiberProduct( D, 2 )
|2| → |2|

julia> Display( pi2 )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1 ]

```

```jldoctest SkeletalPushout.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SkeletalPushout.g

julia> true
true

julia> D = [ pi1, pi2 ];

julia> UU = Pushout( D )
|3|

julia> kappa1 = InjectionOfCofactorOfPushout( D, 1 )
|3| → |3|

julia> Display( kappa1 )
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

julia> kappa2 = InjectionOfCofactorOfPushout( D, 2 )
|2| → |3|

julia> Display( kappa2 )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1, 2 ]

julia> PreCompose( pi1, kappa1 ) == PreCompose( pi2, kappa2 )
true

```

```jldoctest SkeletalPushout.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SkeletalPushout.g

julia> true
true

julia> Co = Coproduct( N1, N2 )
|5|

julia> Display( Co )
[ 0,..., 4 ]

julia> iota_1 = InjectionOfCofactorOfCoproduct( [ N1, N2 ], 1 )
|3| → |5|

julia> Display( iota_1 )
[ 0, 1, 2 ] ⱶ[ 0 .. 2 ]→ [ 0,..., 4 ]

julia> iota_2 = InjectionOfCofactorOfCoproduct( [ N1, N2 ], 2 )
|2| → |5|

julia> Display( iota_2 )
[ 0, 1 ] ⱶ[ 3 .. 4 ]→ [ 0,..., 4 ]

julia> alpha = PreCompose( pi1, iota_1 )
|2| → |5|

julia> Display( alpha )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0,..., 4 ]

julia> beta = PreCompose( pi2, iota_2 )
|2| → |5|

julia> Display( beta )
[ 0, 1 ] ⱶ[ 3, 4 ]→ [ 0,..., 4 ]

julia> Cq = Coequalizer( [ alpha, beta ] )
|3|

julia> psi = ProjectionOntoCoequalizer( [ alpha, beta ] )
|5| → |3|

julia> Display( psi )
[ 0,..., 4 ] ⱶ[ 0, 1, 2, 0, 1 ]→ [ 0, 1, 2 ]

julia> Display( PreCompose( iota_1, psi ) )
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

julia> Display( PreCompose( iota_2, psi ) )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1, 2 ]

julia> PreCompose( alpha, psi ) == PreCompose( beta, psi )
true

```
