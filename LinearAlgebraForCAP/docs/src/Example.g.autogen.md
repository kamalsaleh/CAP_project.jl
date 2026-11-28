
```jldoctest Example.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/Example.g

julia> true
true

julia> Q = HomalgFieldOfRationals();

julia> vec = MatrixCategory( Q );

julia> a = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> IsProjective( a )
true

julia> ap = 3/vec;

julia> IsEqualForObjects( a, ap )
true

julia> b = MatrixCategoryObject( vec, 4 )
<A vector space object over Q of dimension 4>

julia> homalg_matrix = HomalgMatrix( [ [ 1, 0, 0, 0 ],
                                          [ 0, 1, 0, -1 ],
                                          [ -1, 0, 2, 1 ] ], 3, 4, Q );

julia> alpha = VectorSpaceMorphism( a, homalg_matrix, b )
<A morphism in Category of matrices over Q>

```

```jldoctest Example.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/Example.g

julia> alphap = homalg_matrix/vec;

julia> IsCongruentForMorphisms( alpha, alphap )
true

julia> homalg_matrix = HomalgMatrix( [ [ 1, 1, 0, 0 ],
                                          [ 0, 1, 0, -1 ],
                                          [ -1, 0, 2, 1 ] ], 3, 4, Q );

julia> beta = VectorSpaceMorphism( a, homalg_matrix, b )
<A morphism in Category of matrices over Q>

julia> CokernelObject( alpha )
<A vector space object over Q of dimension 1>

julia> c = CokernelProjection( alpha );

julia> Display( EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( c ) ) )
[ [ 0 ], [ 1 ], [ -1/2 ], [ 1 ] ]

julia> gamma = UniversalMorphismIntoDirectSum( [ c, c ] );

julia> Display( EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( gamma ) ) )
[ [ 0, 0 ], [ 1, 1 ], [ -1/2, -1/2 ], [ 1, 1 ] ]

julia> colift = CokernelColift( alpha, gamma );

julia> IsEqualForMorphisms( PreCompose( c, colift ), gamma )
true

julia> FiberProduct( alpha, beta )
<A vector space object over Q of dimension 2>

julia> F = FiberProduct( alpha, beta )
<A vector space object over Q of dimension 2>

julia> p1 = ProjectionInFactorOfFiberProduct( [ alpha, beta ], 1 )
<A morphism in Category of matrices over Q>

julia> Display( EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( PreCompose( p1, alpha ) ) ) )
[ [ 0, 1, 0, -1 ], [ -1, 0, 2, 1 ] ]

julia> Pushout( alpha, beta )
<A vector space object over Q of dimension 5>

julia> i1 = InjectionOfCofactorOfPushout( [ alpha, beta ], 1 )
<A morphism in Category of matrices over Q>

julia> i2 = InjectionOfCofactorOfPushout( [ alpha, beta ], 2 )
<A morphism in Category of matrices over Q>

julia> u = UniversalMorphismFromDirectSum( [ b, b ], [ i1, i2 ] )
<A morphism in Category of matrices over Q>

```

```jldoctest Example.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/Example.g

julia> KernelObjectFunctorial( u, IdentityMorphism( Source( u ) ), u ) == IdentityMorphism( MatrixCategoryObject( vec, 3 ) )
true

julia> IsZeroForMorphisms( CokernelObjectFunctorial( u, IdentityMorphism( Range( u ) ), u ) )
true

julia> DirectProductFunctorial( [ u, u ] ) == DirectSumFunctorial( [ u, u ] )
true

julia> CoproductFunctorial( [ u, u ] ) == DirectSumFunctorial( [ u, u ] )
true

julia> IsCongruentForMorphisms(
            FiberProductFunctorial( [ u, u ], [ IdentityMorphism( Source( u ) ), IdentityMorphism( Source( u ) ) ], [ u, u ] ),
            IdentityMorphism( FiberProduct( [ u, u ] ) )
        )
true

julia> IsCongruentForMorphisms(
            PushoutFunctorial( [ u, u ], [ IdentityMorphism( Range( u ) ), IdentityMorphism( Range( u ) ) ], [ u, u ] ),
            IdentityMorphism( Pushout( [ u, u ] ) )
        )
true

julia> IsCongruentForMorphisms( ((1/2) / Q) * alpha, alpha * ((1/2) / Q) )
true

julia> Dimension( HomomorphismStructureOnObjects( a, b ) ) == Dimension( a ) * Dimension( b )
true

julia> IsCongruentForMorphisms(
            PreCompose( [ u, DualOnMorphisms( i1 ), DualOnMorphisms( alpha ) ] ),
            InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( u ), Source( alpha ),
                 PreCompose(
                     InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( DualOnMorphisms( i1 ) ),
                     HomomorphismStructureOnMorphisms( u, DualOnMorphisms( alpha ) )
                 )
            )
        )
true

julia> op = Opposite( vec );

julia> alpha_op = Opposite( op, alpha )
<A morphism in Opposite( Category of matrices over Q )>

julia> basis = BasisOfExternalHom( Source( alpha_op ), Range( alpha_op ) );

julia> coeffs = CoefficientsOfMorphism( alpha_op );

julia> Display( coeffs )
[ 1, 0, 0, 0, 0, 1, 0, -1, -1, 0, 2, 1 ]

julia> IsEqualForMorphisms( alpha_op, LinearCombinationOfMorphisms( Source( alpha_op ), coeffs, basis, Range( alpha_op ) ) )
true

julia> vec = CapCategory( alpha );

julia> t = TensorUnit( vec );

julia> z = ZeroObject( vec );

julia> IsCongruentForMorphisms(
            ZeroObjectFunctorial( vec ),
            InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( z, z, ZeroMorphism( t, z ) )
        )
true

julia> IsCongruentForMorphisms(
            ZeroObjectFunctorial( vec ),
            InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism(
                z, z,
                InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( ZeroObjectFunctorial( vec ) )
            )
        )
true

julia> right_side = PreCompose( [ i1, DualOnMorphisms( u ), u ] );

julia> x = SolveLinearSystemInAbCategory( [ [ i1 ] ], [ [ u ] ], [ right_side ] )[1];

julia> IsCongruentForMorphisms( PreCompose( [ i1, x, u ] ), right_side )
true

julia> a_otimes_b = TensorProductOnObjects( a, b )
<A vector space object over Q of dimension 12>

julia> hom_ab = InternalHomOnObjects( a, b )
<A vector space object over Q of dimension 12>

julia> cohom_ab = InternalCoHomOnObjects( a, b )
<A vector space object over Q of dimension 12>

julia> hom_ab == cohom_ab
true

julia> unit_ab = VectorSpaceMorphism(
                  a_otimes_b,
                  HomalgIdentityMatrix( Dimension( a_otimes_b ), Q ),
                  a_otimes_b
                  )
<A morphism in Category of matrices over Q>

julia> unit_hom_ab = VectorSpaceMorphism(
                      hom_ab,
                      HomalgIdentityMatrix( Dimension( hom_ab ), Q ),
                      hom_ab
                    )
<A morphism in Category of matrices over Q>

julia> unit_cohom_ab = VectorSpaceMorphism(
                        cohom_ab,
                        HomalgIdentityMatrix( Dimension( cohom_ab ), Q ),
                        cohom_ab
                      )
<A morphism in Category of matrices over Q>

julia> ev_ab = ClosedMonoidalLeftEvaluationMorphism( a, b )
<A morphism in Category of matrices over Q>

julia> coev_ab = ClosedMonoidalLeftCoevaluationMorphism( a, b )
<A morphism in Category of matrices over Q>

julia> coev_ba = ClosedMonoidalLeftCoevaluationMorphism( b, a )
<A morphism in Category of matrices over Q>

julia> cocl_ev_ab = CoclosedMonoidalLeftEvaluationMorphism( a, b )
<A morphism in Category of matrices over Q>

julia> cocl_ev_ba = CoclosedMonoidalLeftEvaluationMorphism( b, a )
<A morphism in Category of matrices over Q>

julia> cocl_coev_ab = CoclosedMonoidalLeftCoevaluationMorphism( a, b )
<A morphism in Category of matrices over Q>

julia> cocl_coev_ba = CoclosedMonoidalLeftCoevaluationMorphism( b, a )
<A morphism in Category of matrices over Q>

julia> UnderlyingMatrix( ev_ab ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_ab ) )
true

julia> UnderlyingMatrix( coev_ab ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_ab ) )
true

julia> UnderlyingMatrix( coev_ba ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_ba ) )
true

julia> tensor_hom_adj_1_hom_ab = InternalHomToTensorProductLeftAdjunctMorphism( a, b, unit_hom_ab )
<A morphism in Category of matrices over Q>

julia> cohom_tensor_adj_1_cohom_ab = InternalCoHomToTensorProductLeftAdjunctMorphism( a, b, unit_cohom_ab )
<A morphism in Category of matrices over Q>

julia> tensor_hom_adj_1_ab = TensorProductToInternalHomLeftAdjunctMorphism( a, b, unit_ab )
<A morphism in Category of matrices over Q>

julia> cohom_tensor_adj_1_ab = TensorProductToInternalCoHomLeftAdjunctMorphism( a, b, unit_ab )
<A morphism in Category of matrices over Q>

julia> ev_ab == tensor_hom_adj_1_hom_ab
true

julia> cocl_ev_ba == cohom_tensor_adj_1_cohom_ab
true

julia> coev_ba == tensor_hom_adj_1_ab
true

julia> cocl_coev_ba == cohom_tensor_adj_1_ab
true

julia> c = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> d = MatrixCategoryObject( vec, 1 )
<A vector space object over Q of dimension 1>

```

```jldoctest Example.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/Example.g

julia> pre_compose = MonoidalPreComposeMorphism( a, b, c )
<A morphism in Category of matrices over Q>

julia> post_compose = MonoidalPostComposeMorphism( a, b, c )
<A morphism in Category of matrices over Q>

julia> pre_cocompose = MonoidalPreCoComposeMorphism( c, b, a )
<A morphism in Category of matrices over Q>

julia> post_cocompose = MonoidalPostCoComposeMorphism( c, b, a )
<A morphism in Category of matrices over Q>

julia> UnderlyingMatrix( pre_compose ) == TransposedMatrix( UnderlyingMatrix( pre_cocompose ) )
true

julia> UnderlyingMatrix( post_compose ) == TransposedMatrix( UnderlyingMatrix( post_cocompose ) )
true

julia> tp_hom_comp = TensorProductInternalHomCompatibilityMorphism( [ a, b, c, d ] )
<A morphism in Category of matrices over Q>

julia> cohom_tp_comp = InternalCoHomTensorProductCompatibilityMorphism( [ b, d, a, c ] )
<A morphism in Category of matrices over Q>

julia> UnderlyingMatrix( tp_hom_comp ) == TransposedMatrix( UnderlyingMatrix( cohom_tp_comp ) )
true

julia> lambda = LambdaIntroduction( alpha )
<A morphism in Category of matrices over Q>

julia> lambda_elim = LambdaElimination( a, b, lambda )
<A morphism in Category of matrices over Q>

julia> alpha == lambda_elim
true

julia> alpha_op = VectorSpaceMorphism( b, TransposedMatrix( UnderlyingMatrix( alpha ) ), a )
<A morphism in Category of matrices over Q>

julia> colambda = CoLambdaIntroduction( alpha_op )
<A morphism in Category of matrices over Q>

julia> colambda_elim = CoLambdaElimination( b, a, colambda )
<A morphism in Category of matrices over Q>

julia> alpha_op == colambda_elim
true

julia> UnderlyingMatrix( lambda ) == TransposedMatrix( UnderlyingMatrix( colambda ) )
true

julia> delta = PreCompose( colambda, lambda)
<A morphism in Category of matrices over Q>

julia> Display( EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( TraceMap( delta ) ) ) )
[ [ 9 ] ]

julia> Display( EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( CoTraceMap( delta ) ) ) )
[ [ 9 ] ]

julia> TraceMap( delta ) == CoTraceMap( delta )
true

julia> RankMorphism( a ) == CoRankMorphism( a )
true

```
