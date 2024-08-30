
```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> field = HomalgFieldOfRationals( );

julia> vec = MatrixCategory( field );

julia> A = MatrixCategoryObject( vec, 1 );

julia> B = MatrixCategoryObject( vec, 2 );

julia> C = MatrixCategoryObject( vec, 3 );

julia> alpha = VectorSpaceMorphism( A, HomalgMatrix( [ [ 1, 0, 0 ] ], 1, 3, field ), C );

julia> beta = VectorSpaceMorphism( C, HomalgMatrix( [ [ 1, 0 ], [ 1, 1 ], [ 1, 2 ] ], 3, 2, field ), B );

julia> IsZeroForMorphisms( PreCompose( alpha, beta ) )
false

julia> IsCongruentForMorphisms(
            IdentityMorphism( HomologyObject( alpha, beta ) ),
            HomologyObjectFunctorial( alpha, beta, IdentityMorphism( C ), alpha, beta )
        )
true

julia> kernel_beta = KernelEmbedding( beta );

julia> K = Source( kernel_beta );

julia> IsIsomorphism(
            HomologyObjectFunctorial( 
                MorphismFromZeroObject( K ), 
                MorphismIntoZeroObject( K ),
                kernel_beta,
                MorphismFromZeroObject( Source( beta ) ),
                beta
            )
        )
true

julia> cokernel_alpha = CokernelProjection( alpha );

julia> Co = Range( cokernel_alpha );

julia> IsIsomorphism(
            HomologyObjectFunctorial( 
                alpha,
                MorphismIntoZeroObject( Range( alpha ) ),
                cokernel_alpha,
                MorphismFromZeroObject( Co ),
                MorphismIntoZeroObject( Co )
            )
        )
true

julia> op = Opposite( vec );

julia> alpha_op = Opposite( op, alpha );

julia> beta_op = Opposite( op, beta );

julia> IsCongruentForMorphisms(
            IdentityMorphism( HomologyObject( beta_op, alpha_op ) ),
            HomologyObjectFunctorial( beta_op, alpha_op, IdentityMorphism( Opposite( C ) ), beta_op, alpha_op )
        )
true

julia> kernel_beta = KernelEmbedding( beta_op );

julia> K = Source( kernel_beta );

julia> IsIsomorphism(
            HomologyObjectFunctorial( 
                MorphismFromZeroObject( K ), 
                MorphismIntoZeroObject( K ),
                kernel_beta,
                MorphismFromZeroObject( Source( beta_op ) ),
                beta_op
            )
        )
true

julia> cokernel_alpha = CokernelProjection( alpha_op );

julia> Co = Range( cokernel_alpha );

julia> IsIsomorphism(
            HomologyObjectFunctorial( 
                alpha_op,
                MorphismIntoZeroObject( Range( alpha_op ) ),
                cokernel_alpha,
                MorphismFromZeroObject( Co ),
                MorphismIntoZeroObject( Co )
            )
        )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> field = HomalgFieldOfRationals( );

julia> vec = MatrixCategory( field );

julia> V = MatrixCategoryObject( vec, 1 );

julia> W = MatrixCategoryObject( vec, 2 );

julia> alpha = VectorSpaceMorphism( V, HomalgMatrix( [ [ 1, -1 ] ], 1, 2, field ), W );

julia> beta = VectorSpaceMorphism( W, HomalgMatrix( [ [ 1, 2 ], [ 3, 4 ] ], 2, 2, field ), W );

julia> IsLiftable( alpha, beta )
true

julia> IsLiftable( beta, alpha )
false

julia> IsLiftableAlongMonomorphism( beta, alpha )
true

julia> gamma = VectorSpaceMorphism( W, HomalgMatrix( [ [ 1 ], [ 1 ] ], 2, 1, field ), V );

julia> IsColiftable( beta, gamma )
true

julia> IsColiftable( gamma, beta )
false

julia> IsColiftableAlongEpimorphism( beta, gamma )
true

julia> PreCompose( PreInverseForMorphisms( gamma ), gamma ) == IdentityMorphism( V )
true

julia> PreCompose( alpha, PostInverseForMorphisms( alpha ) ) == IdentityMorphism( V )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> field = HomalgFieldOfRationals( );

julia> vec = MatrixCategory( field );

julia> A = MatrixCategoryObject( vec, 3 );

julia> B = MatrixCategoryObject( vec, 2 );

julia> alpha = VectorSpaceMorphism( B, HomalgMatrix( [ [ 1, -1, 1 ], [ 1, 1, 1 ] ], 2, 3, field ), A );

julia> beta = VectorSpaceMorphism( B, HomalgMatrix( [ [ 1, 2, 1 ], [ 2, 1, 1 ] ], 2, 3, field ), A );

julia> m = MorphismFromFiberProductToSink( [ alpha, beta ] );

julia> IsCongruentForMorphisms(
            m,
            PreCompose( ProjectionInFactorOfFiberProduct( [ alpha, beta ], 1 ), alpha )
        )
true

julia> IsCongruentForMorphisms(
            m,
            PreCompose( ProjectionInFactorOfFiberProduct( [ alpha, beta ], 2 ), beta )
        )
true

julia> IsCongruentForMorphisms(
        MorphismFromKernelObjectToSink( alpha ),
            PreCompose( KernelEmbedding( alpha ), alpha )
        )
true

julia> alpha_p = DualOnMorphisms( alpha );

julia> beta_p = DualOnMorphisms( beta );

julia> m_p = MorphismFromSourceToPushout( [ alpha_p, beta_p ] );

julia> IsCongruentForMorphisms(
            m_p,
            PreCompose( alpha_p, InjectionOfCofactorOfPushout( [ alpha_p, beta_p ], 1 ) )
        )
true

julia> IsCongruentForMorphisms(
            m_p,
            PreCompose( beta_p, InjectionOfCofactorOfPushout( [ alpha_p, beta_p ], 2 ) )
        )
true

julia> IsCongruentForMorphisms(
            MorphismFromSourceToCokernelObject( alpha_p ),
            PreCompose( alpha_p, CokernelProjection( alpha_p ) )
        )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> true
true

julia> QQ = HomalgFieldOfRationals();

julia> vec = MatrixCategory( QQ );

julia> op = Opposite( vec );

julia> Display( ListKnownCategoricalProperties( op ) )
[ "IsAbCategory", "IsAbelianCategory", "IsAbelianCategoryWithEnoughInjectives", "IsAbelianCategoryWithEnoughProjectives", "IsAdditiveCategory", "IsBraidedMonoidalCategory", "IsCategoryWithInitialObject", "IsCategoryWithTerminalObject", "IsCategoryWithZeroObject", "IsClosedMonoidalCategory", "IsCoclosedMonoidalCategory", "IsEnrichedOverCommutativeRegularSemigroup", "IsEquippedWithHomomorphismStructure", "IsLinearCategoryOverCommutativeRing", "IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms", "IsMonoidalCategory", "IsPreAbelianCategory", "IsRigidSymmetricClosedMonoidalCategory", "IsRigidSymmetricCoclosedMonoidalCategory", "IsSkeletalCategory", "IsStrictMonoidalCategory", "IsSymmetricClosedMonoidalCategory", "IsSymmetricCoclosedMonoidalCategory", "IsSymmetricMonoidalCategory" ]

julia> V1 = Opposite( TensorUnit( vec ) );

julia> V2 = DirectSum( V1, V1 );

julia> V3 = DirectSum( V1, V2 );

julia> V4 = DirectSum( V1, V3 );

julia> V5 = DirectSum( V1, V4 );

julia> IsWellDefined( MorphismBetweenDirectSums( op, [ ], [ ], [ V1 ] ) )
true

julia> IsWellDefined( MorphismBetweenDirectSums( op, [ V1 ], [ [ ] ], [ ] ) )
true

julia> alpha13 = InjectionOfCofactorOfDirectSum( [ V1, V2 ], 1 );

julia> alpha14 = InjectionOfCofactorOfDirectSum( [ V1, V2, V1 ], 3 );

julia> alpha15 = InjectionOfCofactorOfDirectSum( [ V2, V1, V2 ], 2 );

julia> alpha23 = InjectionOfCofactorOfDirectSum( [ V2, V1 ], 1 );

julia> alpha24 = InjectionOfCofactorOfDirectSum( [ V1, V2, V1 ], 2 );

julia> alpha25 = InjectionOfCofactorOfDirectSum( [ V2, V2, V1 ], 1 );

julia> mat = [
            [ alpha13, alpha14, alpha15 ],
            [ alpha23, alpha24, alpha25 ]
        ];

julia> mor = MorphismBetweenDirectSums( mat );

julia> IsWellDefined( mor )
true

julia> IsWellDefined( Opposite( mor ) )
true

julia> IsCongruentForMorphisms(
            UniversalMorphismFromImage( mor, [ CoastrictionToImage( mor ), ImageEmbedding( mor ) ] ),
            IdentityMorphism( ImageObject( mor ) )
        )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> field = HomalgFieldOfRationals( );

julia> vec = MatrixCategory( field );

julia> A = MatrixCategoryObject( vec, 1 );

julia> B = MatrixCategoryObject( vec, 2 );

julia> C = MatrixCategoryObject( vec, 3 );

julia> alpha = VectorSpaceMorphism( A, HomalgMatrix( [ [ 1, 0, 0 ] ], 1, 3, field ), C );

julia> beta = VectorSpaceMorphism( C, HomalgMatrix( [ [ 1, 0 ], [ 1, 1 ], [ 1, 2 ] ], 3, 2, field ), B );

julia> IsCongruentForMorphisms( PreCompose( alpha, beta ), PostCompose( beta, alpha ) )
true

julia> IsCongruentForMorphisms( PreComposeList( A, [ ], A ), IdentityMorphism( A ) )
true

julia> IsCongruentForMorphisms( PreComposeList( A, [ alpha ], C ), alpha )
true

julia> IsCongruentForMorphisms( PreComposeList( A, [ alpha, beta ], B ), PreCompose( alpha, beta ) )
true

julia> IsCongruentForMorphisms( PostComposeList( A, [ ], A ), IdentityMorphism( A ) )
true

julia> IsCongruentForMorphisms( PostComposeList( A, [ alpha ], C ), alpha )
true

julia> IsCongruentForMorphisms( PostComposeList( A, [ beta, alpha ], B ), PostCompose( beta, alpha ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> Q = HomalgFieldOfRationals();

julia> vec = MatrixCategory( Q );

julia> V = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> W = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> alpha = VectorSpaceMorphism( V, [ [ 1, 1, 1 ], [ -1, -1, -1 ] ], W )
<A morphism in Category of matrices over Q>

julia> k = KernelObject( alpha )
<A vector space object over Q of dimension 1>

julia> T = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> tau = VectorSpaceMorphism( T, [ [ 2, 2 ], [ 2, 2 ] ], V )
<A morphism in Category of matrices over Q>

julia> k_lift = KernelLift( alpha, tau )
<A morphism in Category of matrices over Q>

julia> HasKernelEmbedding( alpha )
false

julia> KernelEmbedding( alpha )
<A morphism in Category of matrices over Q>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> Q = HomalgFieldOfRationals();

julia> vec = MatrixCategory( Q );

julia> V = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> W = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> alpha = VectorSpaceMorphism( V, [ [ 1, 1, 1 ], [ -1, -1, -1 ] ], W )
<A morphism in Category of matrices over Q>

julia> k = KernelObject( alpha )
<A vector space object over Q of dimension 1>

julia> T = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> tau = VectorSpaceMorphism( T, [ [ 2, 2 ], [ 2, 2 ] ], V )
<A morphism in Category of matrices over Q>

julia> k_lift = KernelLift( alpha, tau )
<A morphism in Category of matrices over Q>

julia> HasKernelEmbedding( alpha )
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> Q = HomalgFieldOfRationals();

julia> vec = MatrixCategory( Q );

julia> V = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> W = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> alpha = VectorSpaceMorphism( V, [ [ 1, 1, 1 ], [ -1, -1, -1 ] ], W )
<A morphism in Category of matrices over Q>

julia> k = KernelObject( alpha )
<A vector space object over Q of dimension 1>

julia> k_emb = KernelEmbedding( alpha )
<A morphism in Category of matrices over Q>

julia> IsEqualForObjects( Source( k_emb ), k )
true

julia> V = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> W = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> beta = VectorSpaceMorphism( V, [ [ 1, 1, 1 ], [ -1, -1, -1 ] ], W )
<A morphism in Category of matrices over Q>

julia> k_emb = KernelEmbedding( beta )
<A morphism in Category of matrices over Q>

julia> IsIdenticalObj( Source( k_emb ), KernelObject( beta ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> Q = HomalgFieldOfRationals();

julia> vec = MatrixCategory( Q );

julia> A = MatrixCategoryObject( vec, 1 )
<A vector space object over Q of dimension 1>

julia> B = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> C = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> AtoC = VectorSpaceMorphism( A, [ [ 1, 2, 0 ] ], C )
<A morphism in Category of matrices over Q>

julia> BtoC = VectorSpaceMorphism( B, [ [ 1, 0, 0 ], [ 0, 1, 0 ] ], C )
<A morphism in Category of matrices over Q>

julia> P = FiberProduct( AtoC, BtoC )
<A vector space object over Q of dimension 1>

julia> p1 = ProjectionInFactorOfFiberProduct( [ AtoC, BtoC ], 1 )
<A morphism in Category of matrices over Q>

julia> p2 = ProjectionInFactorOfFiberProduct( [ AtoC, BtoC ], 2 )
<A morphism in Category of matrices over Q>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> true
true

julia> Q = HomalgFieldOfRationals( );

julia> Qmat = MatrixCategory( Q )
Category of matrices over Q

julia> Wrapper = WrapperCategory( Qmat, @rec( ) )
WrapperCategory( Category of matrices over Q )

julia> mor = ZeroMorphism( ZeroObject( Wrapper ), ZeroObject( Wrapper ) );

julia> (2 / Q) * mor;

julia> BasisOfExternalHom( Source( mor ), Range( mor ) );

julia> CoefficientsOfMorphism( mor );

julia> distinguished_object = DistinguishedObjectOfHomomorphismStructure( Wrapper );

julia> object = HomomorphismStructureOnObjects( Source( mor ), Source( mor ) );

julia> HomomorphismStructureOnMorphisms( mor, mor );

julia> HomomorphismStructureOnMorphismsWithGivenObjects( object, mor, mor, object );

julia> iota = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( mor );

julia> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( distinguished_object, mor, object );

julia> beta = InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( mor ), Range( mor ), iota );

julia> IsCongruentForMorphisms( mor, beta )
true

```
