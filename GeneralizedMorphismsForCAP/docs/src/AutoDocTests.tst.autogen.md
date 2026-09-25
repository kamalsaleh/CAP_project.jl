
```jldoctest AutoDocTests
julia> using CAP, MonoidalCategories, LinearAlgebraForCAP, GeneralizedMorphismsForCAP

julia> Q = HomalgFieldOfRationals();

julia> A = VectorSpaceObject( 4, Q );

julia> B = VectorSpaceObject( 3, Q );

julia> C = VectorSpaceObject( 2, Q );

julia> alpha = VectorSpaceMorphism( A, 
        HomalgMatrix( [ [ 1, 1, 1 ], [ 0, 1, 1 ], 
        [ 1, 0, 1 ], [ 1, 1, 0 ] ], 4, 3, Q ), B );

julia> gamma = VectorSpaceMorphism( C, 
        HomalgMatrix( [ [ -1, 1, -1 ], [ 1, 0, -1 ] ], 2, 3, Q ), B );

julia> p = ProjectionInFactorOfFiberProduct( [ alpha, gamma ], 1 );

julia> q = ProjectionInFactorOfFiberProduct( [ alpha, gamma ], 2 );

julia> PreCompose( AsGeneralizedMorphism( alpha ), GeneralizedInverse( gamma ) )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> gen1 = PreCompose( AsGeneralizedMorphism( alpha ), 
                               GeneralizedInverse( gamma ) )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> gen2 = PreCompose( GeneralizedInverse( p ), AsGeneralizedMorphism( q ) )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> IsCongruentForMorphisms( gen1, gen2 )
true

```

```jldoctest AutoDocTests
julia> using CAP, MonoidalCategories, LinearAlgebraForCAP, GeneralizedMorphismsForCAP

julia> true
true

julia> true
true

julia> old_generalized_morphism_standard = CAP_INTERNAL.generalized_morphism_standard;

julia> SwitchGeneralizedMorphismStandard( "cospan" )

julia> Q = HomalgFieldOfRationals( )
Q

julia> id = HomalgIdentityMatrix( 8, Q )
<An unevaluated 8 x 8 identity matrix over an internal ring>

julia> a = CertainColumns( CertainRows( id, [ 1, 2, 3 ] ), [ 2, 3, 4, 5 ] )
<An unevaluated non-zero 3 x 4 matrix over an internal ring>

julia> b = CertainColumns( CertainRows( id, [ 1, 2, 3, 4 ] ), [ 2, 3, 4, 5, 6 ] )
<An unevaluated non-zero 4 x 5 matrix over an internal ring>

julia> c = CertainColumns( CertainRows( id, [ 1, 2, 3, 4, 5 ] ), [ 3, 4, 5, 6, 7, 8 ] )
<An unevaluated non-zero 5 x 6 matrix over an internal ring>

julia> IsZero( a * b )
false

julia> IsZero( b * c )
false

julia> IsZero( a * b * c )
true

julia> Qmat = MatrixCategory( Q )
Category of matrices over Q

julia> Wrapper = WrapperCategory( Qmat, @rec( ) )
WrapperCategory( Category of matrices over Q )

julia> a = a / Wrapper
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> b = b / Wrapper
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> c = c / Wrapper
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> d = CokernelProjection( a )
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> e = CokernelColift( a, PreCompose( b, c ) )
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> f = KernelEmbedding( e )
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> g = KernelEmbedding( c )
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> h = KernelLift( c, PreCompose( a, b ) )
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> i = CokernelProjection( h )
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> ff = AsGeneralizedMorphism( f )
<A morphism in Generalized morphism category of
 WrapperCategory( Category of matrices over Q ) by cospan>

julia> dd = AsGeneralizedMorphism( d )
<A morphism in Generalized morphism category of
 WrapperCategory( Category of matrices over Q ) by cospan>

julia> bb = AsGeneralizedMorphism( b )
<A morphism in Generalized morphism category of
 WrapperCategory( Category of matrices over Q ) by cospan>

julia> gg = AsGeneralizedMorphism( g )
<A morphism in Generalized morphism category of
 WrapperCategory( Category of matrices over Q ) by cospan>

julia> ii = AsGeneralizedMorphism( i )
<A morphism in Generalized morphism category of
 WrapperCategory( Category of matrices over Q ) by cospan>

julia> ss = PreCompose( [ ff, PseudoInverse( dd ), bb, PseudoInverse( gg ), ii ] )
<A morphism in Generalized morphism category of
 WrapperCategory( Category of matrices over Q ) by cospan>

julia> s = HonestRepresentative( ss )
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> j = KernelObjectFunctorial( b, d, e )
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> k = CokernelObjectFunctorial( h, g, b )
<A morphism in WrapperCategory( Category of matrices over Q )>

julia> HK = HomologyObject( j, s )
<An object in WrapperCategory( Category of matrices over Q )>

julia> HC = HomologyObject( s, k )
<An object in WrapperCategory( Category of matrices over Q )>

julia> SwitchGeneralizedMorphismStandard( old_generalized_morphism_standard )

```

```jldoctest AutoDocTests
julia> using CAP, MonoidalCategories, LinearAlgebraForCAP, GeneralizedMorphismsForCAP

julia> Q = HomalgFieldOfRationals();

julia> V = VectorSpaceObject( 3, Q );

julia> mat = HomalgMatrix( [ [ 9, 8, 7 ], [ 6, 5, 4 ], [ 3, 2, 1 ] ], 3, 3, Q );

julia> alpha = VectorSpaceMorphism( V, mat, V );

julia> graph = FiberProductEmbeddingInDirectSum( 
                    [ alpha, IdentityMorphism( V ) ] );

julia> Display( graph )
[ [     1,    -2,     1,     0,     0,     0 ],
  [  -4/3,   7/3,     0,     2,     1,     0 ],
  [   5/3,  -8/3,     0,    -1,     0,     1 ] ]

A morphism in Category of matrices over Q

julia> D = DirectSum( V, V );

julia> rotmat = HomalgMatrix( [ [ 0, 0, 0, -1, 0, 0 ],
                                     [ 0, 1, 0, 0, 0, 0 ],
                                     [ 0, 0, 1, 0, 0, 0 ],
                                     [ 1, 0, 0, 0, 0, 0 ],
                                     [ 0, 0, 0, 0, 1, 0 ],
                                     [ 0, 0, 0, 0, 0, 1 ] ],
                                     6, 6, Q );

julia> rot = VectorSpaceMorphism( D, rotmat, D );

julia> p = PreCompose( graph, rot );

julia> Display( p )
[ [     0,    -2,     1,    -1,     0,     0 ],
  [     2,   7/3,     0,   4/3,     1,     0 ],
  [    -1,  -8/3,     0,  -5/3,     0,     1 ] ]

A morphism in Category of matrices over Q

julia> pi1 = ProjectionInFactorOfDirectSum( [ V, V ], 1 );

julia> pi2 = ProjectionInFactorOfDirectSum( [ V, V ], 2 );

julia> reversed_arrow = PreCompose( p, pi1 );

julia> arrow = PreCompose( p, pi2 );

julia> g = GeneralizedMorphismBySpan( reversed_arrow, arrow );

julia> IsHonest( g )
true

julia> sweep_1_alpha = HonestRepresentative( g );

julia> Display( sweep_1_alpha )
[ [  -1/9,   8/9,   7/9 ],
  [   2/3,  -1/3,  -2/3 ],
  [   1/3,  -2/3,  -4/3 ] ]

A morphism in Category of matrices over Q

julia> Display( alpha )
[ [  9,  8,  7 ],
  [  6,  5,  4 ],
  [  3,  2,  1 ] ]

A morphism in Category of matrices over Q

```

```jldoctest AutoDocTests
julia> using CAP, MonoidalCategories, LinearAlgebraForCAP, GeneralizedMorphismsForCAP

julia> Q = HomalgFieldOfRationals()
Q

julia> B = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> C = VectorSpaceObject( 3, Q )
<A vector space object over Q of dimension 3>

julia> B_1 = VectorSpaceObject( 1, Q )
<A vector space object over Q of dimension 1>

julia> C_1 = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> c1_source_aid = VectorSpaceMorphism( B_1, [ [ 1, 0 ] ], B )
<A morphism in Category of matrices over Q>

julia> SetIsSubobject( c1_source_aid, true )

julia> c1_range_aid = VectorSpaceMorphism( C, [ [ 1, 0 ], [ 0, 1 ], [ 0, 0 ] ], C_1 )
<A morphism in Category of matrices over Q>

julia> SetIsFactorobject( c1_range_aid, true )

julia> c1_associated = VectorSpaceMorphism( B_1, [ [ 1, 1 ] ], C_1 )
<A morphism in Category of matrices over Q>

julia> c1 = GeneralizedMorphism( c1_source_aid, c1_associated, c1_range_aid )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> B_2 = VectorSpaceObject( 1, Q )
<A vector space object over Q of dimension 1>

julia> C_2 = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> c2_source_aid = VectorSpaceMorphism( B_2, [ [ 2, 0 ] ], B )
<A morphism in Category of matrices over Q>

julia> SetIsSubobject( c2_source_aid, true )

julia> c2_range_aid = VectorSpaceMorphism( C, [ [ 3, 0 ], [ 0, 3 ], [ 0, 0 ] ], C_2 )
<A morphism in Category of matrices over Q>

julia> SetIsFactorobject( c2_range_aid, true )

julia> c2_associated = VectorSpaceMorphism( B_2, [ [ 6, 6 ] ], C_2 )
<A morphism in Category of matrices over Q>

julia> c2 = GeneralizedMorphism( c2_source_aid, c2_associated, c2_range_aid )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> IsCongruentForMorphisms( c1, c2 )
true

julia> IsCongruentForMorphisms( c1, c1 )
true

julia> c3_associated = VectorSpaceMorphism( B_1, [ [ 2, 2 ] ], C_1 )
<A morphism in Category of matrices over Q>

julia> c3 = GeneralizedMorphism( c1_source_aid, c3_associated, c1_range_aid )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> IsCongruentForMorphisms( c1, c3 )
false

julia> IsCongruentForMorphisms( c2, c3 )
false

julia> c1 + c2
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> Arrow( c1 + c2 )
<A morphism in Category of matrices over Q>

```

```jldoctest AutoDocTests
julia> using CAP, MonoidalCategories, LinearAlgebraForCAP, GeneralizedMorphismsForCAP

julia> Q = HomalgFieldOfRationals()
Q

julia> A = VectorSpaceObject( 1, Q )
<A vector space object over Q of dimension 1>

julia> B = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> C = VectorSpaceObject( 3, Q )
<A vector space object over Q of dimension 3>

julia> phi_tilde_associated = VectorSpaceMorphism( A, [ [ 1, 2, 0 ] ], C )
<A morphism in Category of matrices over Q>

julia> phi_tilde_source_aid = VectorSpaceMorphism( A, [ [ 1, 2 ] ], B )
<A morphism in Category of matrices over Q>

julia> phi_tilde = GeneralizedMorphismWithSourceAid( phi_tilde_source_aid, phi_tilde_associated )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> psi_tilde_associated = IdentityMorphism( B )
<A morphism in Category of matrices over Q>

julia> psi_tilde_source_aid = VectorSpaceMorphism( B, [ [ 1, 0, 0 ], [ 0, 1, 0 ] ], C )
<A morphism in Category of matrices over Q>

julia> psi_tilde = GeneralizedMorphismWithSourceAid( psi_tilde_source_aid, psi_tilde_associated )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> composition = PreCompose( phi_tilde, psi_tilde )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> Arrow( composition )
<A morphism in Category of matrices over Q>

julia> SourceAid( composition )
<A morphism in Category of matrices over Q>

julia> RangeAid( composition )
<A morphism in Category of matrices over Q>

```

```jldoctest AutoDocTests
julia> using CAP, MonoidalCategories, LinearAlgebraForCAP, GeneralizedMorphismsForCAP

julia> Q = HomalgFieldOfRationals()
Q

julia> A = VectorSpaceObject( 1, Q )
<A vector space object over Q of dimension 1>

julia> B = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> C = VectorSpaceObject( 3, Q )
<A vector space object over Q of dimension 3>

julia> phi2_tilde_associated = VectorSpaceMorphism( A, [ [ 1, 5 ] ], B )
<A morphism in Category of matrices over Q>

julia> phi2_tilde_range_aid = VectorSpaceMorphism( C, [ [ 1, 0 ], [ 0, 1 ], [ 1, 1 ] ], B )
<A morphism in Category of matrices over Q>

julia> phi2_tilde = GeneralizedMorphismWithRangeAid( phi2_tilde_associated, phi2_tilde_range_aid )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> psi2_tilde_associated = VectorSpaceMorphism( C, [ [ 1 ], [ 3 ], [ 4 ] ], A )
<A morphism in Category of matrices over Q>

julia> psi2_tilde_range_aid = VectorSpaceMorphism( B, [ [ 1 ], [ 1 ] ], A )
<A morphism in Category of matrices over Q>

julia> psi2_tilde = GeneralizedMorphismWithRangeAid( psi2_tilde_associated, psi2_tilde_range_aid )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> composition2 = PreCompose( phi2_tilde, psi2_tilde )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> Arrow( composition2 )
<A morphism in Category of matrices over Q>

julia> RangeAid( composition2 )
<A morphism in Category of matrices over Q>

julia> SourceAid( composition2 )
<A morphism in Category of matrices over Q>

```

```jldoctest AutoDocTests
julia> using CAP, MonoidalCategories, LinearAlgebraForCAP, GeneralizedMorphismsForCAP

julia> Q = HomalgFieldOfRationals()
Q

julia> A = VectorSpaceObject( 3, Q )
<A vector space object over Q of dimension 3>

julia> Asub = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> B = VectorSpaceObject( 3, Q )
<A vector space object over Q of dimension 3>

julia> Bfac = VectorSpaceObject( 1, Q )
<A vector space object over Q of dimension 1>

julia> Bsub = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> C = VectorSpaceObject( 3, Q )
<A vector space object over Q of dimension 3>

julia> Cfac = VectorSpaceObject( 1, Q )
<A vector space object over Q of dimension 1>

julia> Asub_into_A = VectorSpaceMorphism( Asub, [ [ 1, 0, 0 ], [ 0, 1, 0 ] ], A )
<A morphism in Category of matrices over Q>

julia> Asub_to_Bfac = VectorSpaceMorphism( Asub, [ [ 1 ], [ 1 ] ], Bfac )
<A morphism in Category of matrices over Q>

julia> B_onto_Bfac = VectorSpaceMorphism( B, [ [ 1 ], [ 1 ], [ 1 ] ], Bfac )
<A morphism in Category of matrices over Q>

julia> Bsub_into_B = VectorSpaceMorphism( Bsub, [ [ 2, 2, 0 ], [ 0, 2, 2 ] ], B )
<A morphism in Category of matrices over Q>

julia> Bsub_to_Cfac = VectorSpaceMorphism( Bsub, [ [ 3 ], [ 0 ] ], Cfac )
<A morphism in Category of matrices over Q>

julia> C_onto_Cfac = VectorSpaceMorphism( C, [ [ 1 ], [ 2 ], [ 3 ] ], Cfac )
<A morphism in Category of matrices over Q>

julia> generalized_morphism1 = GeneralizedMorphism( Asub_into_A, Asub_to_Bfac, B_onto_Bfac )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> generalized_morphism2 = GeneralizedMorphism( Bsub_into_B, Bsub_to_Cfac, C_onto_Cfac )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> IsWellDefined( generalized_morphism1 )
true

julia> IsWellDefined( generalized_morphism2 )
true

julia> p = PreCompose( generalized_morphism1, generalized_morphism2 )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> SourceAid( p )
<A morphism in Category of matrices over Q>

julia> Arrow( p )
<A morphism in Category of matrices over Q>

julia> RangeAid( p )
<A morphism in Category of matrices over Q>

julia> A = VectorSpaceObject( 3, Q )
<A vector space object over Q of dimension 3>

julia> Asub = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> B = VectorSpaceObject( 3, Q )
<A vector space object over Q of dimension 3>

julia> Bfac = VectorSpaceObject( 1, Q )
<A vector space object over Q of dimension 1>

julia> Bsub = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> C = VectorSpaceObject( 3, Q )
<A vector space object over Q of dimension 3>

julia> Cfac = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> Bsub_to_Cfac = VectorSpaceMorphism( Bsub, [ [ 3, 3 ], [ 0, 0 ] ], Cfac )
<A morphism in Category of matrices over Q>

julia> C_onto_Cfac = VectorSpaceMorphism( C, [ [ 1, 0 ], [ 0, 2 ], [ 3, 3 ] ], Cfac )
<A morphism in Category of matrices over Q>

julia> generalized_morphism1 = GeneralizedMorphism( Asub_into_A, Asub_to_Bfac, B_onto_Bfac )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> generalized_morphism2 = GeneralizedMorphism( Bsub_into_B, Bsub_to_Cfac, C_onto_Cfac )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> IsWellDefined( generalized_morphism1 )
true

julia> IsWellDefined( generalized_morphism2 )
true

julia> p = PreCompose( generalized_morphism1, generalized_morphism2 )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> SourceAid( p )
<A morphism in Category of matrices over Q>

julia> Arrow( p )
<A morphism in Category of matrices over Q>

julia> RangeAid( p )
<A morphism in Category of matrices over Q>

```

```jldoctest AutoDocTests
julia> using CAP, MonoidalCategories, LinearAlgebraForCAP, GeneralizedMorphismsForCAP

julia> Q = HomalgFieldOfRationals()
Q

julia> A = VectorSpaceObject( 1, Q )
<A vector space object over Q of dimension 1>

julia> B = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> phi_tilde_source_aid = VectorSpaceMorphism( A, [ [ 2 ] ], A )
<A morphism in Category of matrices over Q>

julia> phi_tilde_associated = VectorSpaceMorphism( A, [ [ 1, 1 ] ], B )
<A morphism in Category of matrices over Q>

julia> phi_tilde_range_aid = VectorSpaceMorphism( B, [ [ 1, 2 ], [ 3, 4 ] ], B )
<A morphism in Category of matrices over Q>

julia> phi_tilde = GeneralizedMorphism( phi_tilde_source_aid, phi_tilde_associated, phi_tilde_range_aid )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> HonestRepresentative( phi_tilde )
<A morphism in Category of matrices over Q>

julia> IsWellDefined( phi_tilde )
true

julia> IsWellDefined( psi_tilde )
true

```

```jldoctest AutoDocTests
julia> using CAP, MonoidalCategories, LinearAlgebraForCAP, GeneralizedMorphismsForCAP

julia> Q = HomalgFieldOfRationals()
Q

julia> A = VectorSpaceObject( 1, Q )
<A vector space object over Q of dimension 1>

julia> B = VectorSpaceObject( 2, Q )
<A vector space object over Q of dimension 2>

julia> alpha = VectorSpaceMorphism( A, [ [ 1, 2 ] ], B )
<A morphism in Category of matrices over Q>

julia> g = GeneralizedMorphism( alpha, alpha, alpha )
<A morphism in Generalized morphism category of Category of matrices over Q>

julia> IsWellDefined( alpha )
true

julia> IsWellDefined( g )
true

julia> IsEqualForObjects( A, B )
false

```
