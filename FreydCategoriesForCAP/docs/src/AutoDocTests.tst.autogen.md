
```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> QQ = HomalgFieldOfRationalsInSingular();

julia> R = QQ * "x,y,z";

julia> rows = CategoryOfRows_as_AdditiveClosure_RingAsCategory( R );

julia> M = HomalgMatrix( "[[x^2,4*y]]", 1, 2, R );

julia> N = HomalgMatrix( "[[1,3*x], [2*y^3,5*y]]", 2, 2, R );

julia> P = M * N;

julia> o = CategoryOfRowsObject( rows, 1 );

julia> A = o;

julia> B = DirectSum( o, o );

julia> alpha = CategoryOfRowsMorphism( rows, A, M, B );

julia> IsWellDefined( alpha )
true

julia> beta = CategoryOfRowsMorphism( rows, B, N, B );

julia> IsWellDefined( beta )
true

julia> gamma = PreCompose( alpha, beta );

julia> IsWellDefined( gamma )
true

julia> UnderlyingMatrix( gamma ) == P
true

julia> # compute Lift( gamma, beta ) via SolveLinearSystemInAbCategory for coverage of hom structure:
        delta = SolveLinearSystemInAbCategory( [ [ IdentityMorphism( A ) ] ], [ [ beta ] ], [ gamma ] )[1];

julia> IsWellDefined( delta )
true

julia> IsCongruentForMorphisms( gamma, PreCompose( delta, beta ) )
true

julia> IsCongruentForMorphisms(
            SumOfMorphisms( A, [ alpha, alpha, alpha ], B ),
            AdditionForMorphisms( alpha, AdditionForMorphisms( alpha, alpha ) )
        )
true

julia> IsCongruentForMorphisms(
            SumOfMorphisms( A, [ ], B ),
            ZeroMorphism( A, B )
        )
true

julia> # E && EE are both occupied by GAP
        EEE = KoszulDualRing( R );

julia> rows = CategoryOfRows_as_AdditiveClosure_RingAsCategory( EEE );

julia> M = HomalgMatrix( "[[e0*e1,3*e0]]", 1, 2, EEE );

julia> N = HomalgMatrix( "[[1,e0*e2], [2*e0*e1*e2,5*e2]]", 2, 2, EEE );

julia> P = M * N;

julia> o = CategoryOfRowsObject( rows, 1 );

julia> A = o;

julia> B = DirectSum( o, o );

julia> alpha = CategoryOfRowsMorphism( rows, A, M, B );

julia> IsWellDefined( alpha )
true

julia> beta = CategoryOfRowsMorphism( rows, B, N, B );

julia> IsWellDefined( beta )
true

julia> gamma = PreCompose( alpha, beta );

julia> IsWellDefined( gamma )
true

julia> UnderlyingMatrix( gamma ) == P
true

julia> # compute Lift( gamma, beta ) via SolveLinearSystemInAbCategory for coverage of hom structure:
        delta = SolveLinearSystemInAbCategory( [ [ IdentityMorphism( A ) ] ], [ [ beta ] ], [ gamma ] )[1];

julia> IsWellDefined( delta )
true

julia> IsCongruentForMorphisms( gamma, PreCompose( delta, beta ) )
true

julia> IsCongruentForMorphisms(
            SumOfMorphisms( A, [ alpha, alpha, alpha ], B ),
            AdditionForMorphisms( alpha, AdditionForMorphisms( alpha, alpha ) )
        )
true

julia> IsCongruentForMorphisms(
            SumOfMorphisms( A, [ ], B ),
            ZeroMorphism( A, B )
        )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> S = HomalgRingOfIntegers()
Z

julia> rows = CategoryOfRows( S )
Rows( Z )

julia> obj1 = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

julia> obj2 = CategoryOfRowsObject( 8, rows )
<A row module over Z of rank 8>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> obj3 = CategoryOfRowsObject( 1, rows )
<A row module over Z of rank 1>

julia> IsWellDefined( obj1 )
true

julia> obj4 = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

julia> mor = CategoryOfRowsMorphism( obj3, HomalgMatrix( [[1,2]], S ), obj4 )
<A morphism in Rows( Z )>

julia> IsWellDefined( mor )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Size( AdditiveGenerators( rows ) )
1

julia> ZeroObject( rows )
<A row module over Z of rank 0>

julia> obj5 = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> obj6 = CategoryOfRowsObject( 1, rows )
<A row module over Z of rank 1>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> directSum = DirectSum( [ obj5, obj6 ] )
<A row module over Z of rank 3>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> i1 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> i2 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> proj1 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> proj2 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> k = WeakKernelEmbedding( proj1 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> ck = WeakCokernelProjection( k )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> IsMonomorphism( k )
true

julia> IsEpimorphism( k )
false

julia> IsMonomorphism( ck )
false

julia> IsEpimorphism( ck )
true

julia> mor1 = CategoryOfRowsMorphism( obj5, HomalgMatrix( [[ 1 ], [ 2 ]], S ), obj6 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> mor2 = IdentityMorphism( obj6 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> lift = Lift( mor1, mor2 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> source = CategoryOfRowsObject( 1, rows )
<A row module over Z of rank 1>

julia> range = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

julia> mor = CategoryOfRowsMorphism( source, HomalgMatrix( [[ 2, 3 ]], S ), range )
<A morphism in Rows( Z )>

julia> colift = Colift( mor2, mor )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> fp = WeakBiFiberProduct( mor1, mor2 )
<A row module over Z of rank 2>

julia> fp_proj = ProjectionOfBiasedWeakFiberProduct( mor1, mor2 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> po = WeakBiPushout( mor, mor2 )
<A row module over Z of rank 2>

julia> inj_push = InjectionOfBiasedWeakPushout( mor, mor2 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Q = HomalgFieldOfRationals();

julia> rows = CategoryOfRows( Q );

julia> homalg_matrix = HomalgMatrix( [ [ 1, 0 ],
                                         [ 0, 1 ],
                                         [ -2, 0] ], 3, 2, Q );

julia> alpha = homalg_matrix / rows;

julia> diagram = [ alpha, 2*alpha, 3*alpha ];

julia> equalizer = EmbeddingOfEqualizer( diagram );

julia> Display(equalizer)
Source: 
A row module over Q of rank 1

Matrix:
[ [  2,  0,  1 ] ]

Range:
A row module over Q of rank 3

A morphism in Rows( Q )

julia> equalizer_d1 = PreCompose( equalizer, diagram[1] );

julia> equalizer_d2 = PreCompose( equalizer, diagram[2] );

julia> equalizer_d3 = PreCompose( equalizer, diagram[3] );

julia> IsEqualForMorphisms( equalizer_d1, equalizer_d2 )
true

julia> IsEqualForMorphisms( equalizer_d2, equalizer_d3 )
true

julia> IsEqualForMorphisms( equalizer_d1, equalizer_d3 )
true

julia> universal_morphism = UniversalMorphismIntoEqualizer( Source(alpha), diagram, Source( 2*equalizer ), 2*equalizer );

julia> Display( universal_morphism )
Source:
A row module over Q of rank 1

Matrix:
[ [  2 ] ]

Range:
A row module over Q of rank 1

A morphism in Rows( Q )

julia> IsEqualForMorphisms( PreCompose( universal_morphism, equalizer ), 2*equalizer )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Q = HomalgFieldOfRationals();

julia> rows = CategoryOfRows( Q );

julia> homalg_matrix = HomalgMatrix( [ [ 1, 0, -2 ],
                                         [ 0, 1, 0 ] ], 2, 3, Q );

julia> alpha = homalg_matrix / rows;

julia> diagram = [ alpha, 2*alpha, 3*alpha ];

julia> coequalizer = ProjectionOntoCoequalizer( diagram );

julia> Display( coequalizer )
Source:
A row module over Q of rank 3

Matrix: 
[ [  2 ],
  [  0 ],
  [  1 ] ]

Range:
A row module over Q of rank 1

A morphism in Rows( Q )

julia> coequalizer_d1 = PreCompose( diagram[1], coequalizer );

julia> coequalizer_d2 = PreCompose( diagram[2], coequalizer );

julia> coequalizer_d3 = PreCompose( diagram[3], coequalizer );

julia> IsEqualForMorphisms( coequalizer_d1, coequalizer_d2 )
true

julia> IsEqualForMorphisms( coequalizer_d2, coequalizer_d3 )
true

julia> IsEqualForMorphisms( coequalizer_d1, coequalizer_d3 )
true

julia> universal_morphism = UniversalMorphismFromCoequalizer( Range(alpha), diagram, Range( 2*coequalizer ), 2*coequalizer );

julia> Display( universal_morphism )
Source:
A row module over Q of rank 1

Matrix:
[ [  2 ] ]

Range:
A row module over Q of rank 1

A morphism in Rows( Q )

julia> IsEqualForMorphisms( PreCompose( coequalizer,  universal_morphism ), 2*coequalizer )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgRingOfIntegers();

julia> rows = CategoryOfRows( R );

julia> M = HomalgMatrix( [ [ 2, 2, 2 ], [ 3, 3, 3 ] ], 2, 3, R );

julia> alpha = AsCategoryOfRowsMorphism( M, rows );

julia> pi = PreCompose( [
            SimplifySourceAndRange_IsoFromInputSource( alpha, infinity ),
            SimplifySourceAndRange( alpha, infinity ),
            SimplifySourceAndRange_IsoToInputRange( alpha, infinity ) ] );

julia> IsCongruentForMorphisms( pi, alpha )
true

julia> IsOne(
            PreCompose( SimplifySourceAndRange_IsoFromInputSource( alpha, infinity ), SimplifySourceAndRange_IsoToInputSource( alpha, infinity ) )
        )
true

julia> IsOne(
            PreCompose( SimplifySourceAndRange_IsoFromInputRange( alpha, infinity ), SimplifySourceAndRange_IsoToInputRange( alpha, infinity ) )
        )
true

julia> pi2 = PreCompose(
            SimplifySource_IsoFromInputObject( alpha, infinity ),
            SimplifySource( alpha, infinity )
        );

julia> IsCongruentForMorphisms( pi2, alpha )
true

julia> IsOne( PreCompose( SimplifySource_IsoFromInputObject( alpha, infinity ), SimplifySource_IsoToInputObject( alpha, infinity ) ) )
true

julia> pi3 = PreCompose(
            SimplifyRange( alpha, infinity ),
            SimplifyRange_IsoToInputObject( alpha, infinity )
        );

julia> IsCongruentForMorphisms( pi3, alpha )
true

julia> IsOne( PreCompose( SimplifyRange_IsoFromInputObject( alpha, infinity ), SimplifyRange_IsoToInputObject( alpha, infinity ) ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgRingOfIntegers();

julia> cols = CategoryOfColumns( R );

julia> M = HomalgMatrix( [ [ 2, 2, 2 ], [ 3, 3, 3 ] ], 2, 3, R );

julia> alpha = AsCategoryOfColumnsMorphism( M, cols );

julia> pi = PreCompose( [
            SimplifySourceAndRange_IsoFromInputSource( alpha, infinity ),
            SimplifySourceAndRange( alpha, infinity ), 
            SimplifySourceAndRange_IsoToInputRange( alpha, infinity ) ] );

julia> IsCongruentForMorphisms( pi, alpha )
true

julia> IsOne(
            PreCompose( SimplifySourceAndRange_IsoFromInputSource( alpha, infinity ), SimplifySourceAndRange_IsoToInputSource( alpha, infinity ) )
        )
true

julia> IsOne(
            PreCompose( SimplifySourceAndRange_IsoFromInputRange( alpha, infinity ), SimplifySourceAndRange_IsoToInputRange( alpha, infinity ) )
        )
true

julia> pi2 = PreCompose(
            SimplifySource_IsoFromInputObject( alpha, infinity ),
            SimplifySource( alpha, infinity )
        );

julia> IsCongruentForMorphisms( pi2, alpha )
true

julia> IsOne( PreCompose( SimplifySource_IsoFromInputObject( alpha, infinity ), SimplifySource_IsoToInputObject( alpha, infinity ) ) )
true

julia> pi3 = PreCompose(
            SimplifyRange( alpha, infinity ),
            SimplifyRange_IsoToInputObject( alpha, infinity )
        );

julia> IsCongruentForMorphisms( pi3, alpha )
true

julia> IsOne( PreCompose( SimplifyRange_IsoFromInputObject( alpha, infinity ), SimplifyRange_IsoToInputObject( alpha, infinity ) ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Qxyz = HomalgFieldOfRationalsInDefaultCAS( ) * "x,y,z";

julia> A3 = RingOfDerivations( Qxyz, "Dx,Dy,Dz" );

julia> M1 = HomalgMatrix( "[ > Dx  > ]", 1, 1, A3 );

julia> M2 = HomalgMatrix( "[ > Dx, > Dy  > ]", 2, 1, A3 );

julia> M3 = HomalgMatrix( "[ > Dx, > Dy, > Dz  > ]", 3, 1, A3 );

julia> M = DiagMat( [ M1, M2, M3 ] );

julia> M = ShallowCopy( M );

julia> SetIsMutableMatrix( M, true );

julia> M[ 1, 2 ] = "1";

julia> M[ 2, 3 ] = "1";

julia> M[ 3, 3 ] = "1";

julia> MakeImmutable( M );

julia> tau1 = HomalgMatrix( "[ > 1, Dx, Dz, > 0,  0,  1, > 0,  1, Dy  > ]", 3, 3, A3 );

julia> tau2 = HomalgMatrix( "[ > 0,  1, Dz+x*y, > 0,  0,      1, > 1, Dz,    x-y  > ]", 3, 3, A3 );

julia> tau3 = HomalgMatrix( "[ > 1,  0, 0, > 1,  1, 0, > 0, -1, 1  > ]", 3, 3, A3 );

julia> tau = tau1 * tau2 * tau3;

julia> M = M * tau;

julia> rows = CategoryOfRows( A3 );

julia> alpha = AsCategoryOfRowsMorphism( M, rows );

julia> Mrows = FreydCategoryObject( alpha );

julia> Srows = SimplifyObject( Mrows, infinity );

julia> RankOfObject( Source( RelationMorphism( Srows ) ) )
4

julia> RankOfObject( Range( RelationMorphism( Srows ) ) )
2

julia> IsIsomorphism( SimplifyObject_IsoFromInputObject( Mrows, infinity ) )
true

julia> IsIsomorphism( SimplifyObject_IsoToInputObject( Mrows, infinity ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> mu1 = GradeFiltrationNthMonomorphism( Mrows, 1 );

julia> IsZero( mu1 )
false

julia> IsMonomorphism( mu1 )
true

julia> mu2 = GradeFiltrationNthMonomorphism( Mrows, 2 );

julia> IsZero( mu2 )
false

julia> IsMonomorphism( mu2 )
true

julia> mu3 = GradeFiltrationNthMonomorphism( Mrows, 3 );

julia> IsZero( mu3 )
false

julia> IsMonomorphism( mu3 )
true

julia> mu4 = GradeFiltrationNthMonomorphism( Mrows, 4 );

julia> IsZero( mu4 )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> cols = CategoryOfColumns( A3 );

julia> alpha = AsCategoryOfColumnsMorphism( M, cols );

julia> Mcols = FreydCategoryObject( alpha );

julia> Scols = SimplifyObject( Mcols, infinity );

julia> RankOfObject( Source( RelationMorphism( Scols ) ) )
1

julia> RankOfObject( Range( RelationMorphism( Scols ) ) )
4

julia> IsIsomorphism( SimplifyObject_IsoFromInputObject( Mcols, infinity ) )
true

julia> IsIsomorphism( SimplifyObject_IsoToInputObject( Mcols, infinity ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> S = HomalgRingOfIntegers()
Z

julia> cols = CategoryOfColumns( S )
Columns( Z )

julia> obj1 = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

julia> obj2 = CategoryOfColumnsObject( 8, cols )
<A column module over Z of rank 8>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> obj3 = CategoryOfColumnsObject( 1, cols )
<A column module over Z of rank 1>

julia> IsWellDefined( obj1 )
true

julia> obj4 = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

julia> mor = CategoryOfColumnsMorphism( obj3, HomalgMatrix( [[1],[2]], S ), obj4 )
<A morphism in Columns( Z )>

julia> IsWellDefined( mor )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> ZeroObject( cols )
<A column module over Z of rank 0>

julia> obj5 = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> obj6 = CategoryOfColumnsObject( 1, cols )
<A column module over Z of rank 1>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> directSum = DirectSum( [ obj5, obj6 ] )
<A column module over Z of rank 3>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> i1 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> i2 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> proj1 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> proj2 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> k = WeakKernelEmbedding( proj1 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> ck = WeakCokernelProjection( k )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> IsMonomorphism( k )
true

julia> IsEpimorphism( k )
false

julia> IsMonomorphism( ck )
false

julia> IsEpimorphism( ck )
true

julia> mor1 = CategoryOfColumnsMorphism( obj5, HomalgMatrix( [[ 1, 2 ]], S ), obj6 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> mor2 = IdentityMorphism( obj6 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> lift = Lift( mor1, mor2 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> source = CategoryOfColumnsObject( 1, cols )
<A column module over Z of rank 1>

julia> range = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

julia> mor = CategoryOfColumnsMorphism( source, HomalgMatrix( [[ 2 ], [ 3 ]], S ), range )
<A morphism in Columns( Z )>

julia> colift = Colift( mor2, mor )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> fp = WeakBiFiberProduct( mor1, mor2 )
<A column module over Z of rank 2>

julia> fp_proj = ProjectionOfBiasedWeakFiberProduct( mor1, mor2 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> po = WeakBiPushout( mor, mor2 )
<A column module over Z of rank 2>

julia> inj_push = InjectionOfBiasedWeakPushout( mor, mor2 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgRingOfIntegers();

julia> rows = CategoryOfRows( R );

julia> adelman = AdelmanCategory( rows );

julia> obj1 = CategoryOfRowsObject( 1, rows );

julia> obj2 = CategoryOfRowsObject( 2, rows );

julia> id = IdentityMorphism( obj2 );

julia> alpha = CategoryOfRowsMorphism( obj1, HomalgMatrix( [ [ 1, 2 ] ], 1, 2, R ), obj2 );

julia> beta = CategoryOfRowsMorphism( obj2, HomalgMatrix( [ [ 1, 2 ], [ 3, 4 ] ], 2, 2, R ), obj2 );

julia> gamma = CategoryOfRowsMorphism( obj2, HomalgMatrix( [ [ 1, 3 ], [ 3, 4 ] ], 2, 2, R ), obj2 );

julia> obj1_a = AsAdelmanCategoryObject( obj1 );

julia> obj2_a = AsAdelmanCategoryObject( obj2 );

julia> m = AsAdelmanCategoryMorphism( beta );

julia> n = AsAdelmanCategoryMorphism( gamma );

julia> IsWellDefined( m )
true

julia> # backwards compatibility
        IsIdenticalObj( MorphismDatum( m ), beta )
true

julia> IsCongruentForMorphisms( PreCompose( m, n ), PreCompose( n, m ) )
false

julia> IsCongruentForMorphisms( SubtractionForMorphisms( m, m ), ZeroMorphism( obj2_a, obj2_a ) )
true

julia> IsCongruentForMorphisms( ZeroObjectFunctorial( adelman ),
                                 PreCompose( UniversalMorphismFromZeroObject( obj1_a), UniversalMorphismIntoZeroObject( obj1_a ) ) 
                                )
true

julia> d = [ obj1_a, obj2_a ];

julia> pi1 = ProjectionInFactorOfDirectSum( d, 1 );

julia> pi2 = ProjectionInFactorOfDirectSum( d, 2 );

julia> id = IdentityMorphism( DirectSum( d ) );

julia> iota1 = InjectionOfCofactorOfDirectSum( d, 1 );

julia> iota2 = InjectionOfCofactorOfDirectSum( d, 2 );

julia> IsCongruentForMorphisms( PreCompose( pi1, iota1 ) + PreCompose( pi2, iota2 ), id )
true

julia> IsCongruentForMorphisms( UniversalMorphismIntoDirectSum( d, [ pi1, pi2 ] ), id )
true

julia> IsCongruentForMorphisms( UniversalMorphismFromDirectSum( d, [ iota1, iota2 ] ), id )
true

julia> c = CokernelProjection( m );

julia> c2 = CokernelProjection( c );

julia> IsCongruentForMorphisms( c2, ZeroMorphism( Source( c2 ), Range( c2 ) ) )
true

julia> IsWellDefined( CokernelProjection( m ) )
true

julia> IsCongruentForMorphisms( CokernelColift( m, CokernelProjection( m ) ), IdentityMorphism( CokernelObject( m ) ) )
true

julia> k = KernelEmbedding( c );

julia> IsZeroForMorphisms( PreCompose( k, c ) )
true

julia> IsCongruentForMorphisms( KernelLift( m, KernelEmbedding( m ) ), IdentityMorphism( KernelObject( m ) ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgRingOfIntegers();

julia> cols = CategoryOfColumns( R );

julia> adelman = AdelmanCategory( cols );

julia> obj1 = CategoryOfColumnsObject( 1, cols );

julia> obj2 = CategoryOfColumnsObject( 2, cols );

julia> id = IdentityMorphism( obj2 );

julia> alpha = CategoryOfColumnsMorphism( obj1, HomalgMatrix( [ [ 1 ], [ 2 ] ], 1, 2, R ), obj2 );

julia> beta = CategoryOfColumnsMorphism( obj2, HomalgMatrix( [ [ 1, 3 ], [ 2, 4 ] ], 2, 2, R ), obj2 );

julia> gamma = CategoryOfColumnsMorphism( obj2, HomalgMatrix( [ [ 1, 3 ], [ 3, 4 ] ], 2, 2, R ), obj2 );

julia> obj1_a = AsAdelmanCategoryObject( obj1 );

julia> obj2_a = AsAdelmanCategoryObject( obj2 );

julia> m = AsAdelmanCategoryMorphism( beta );

julia> n = AsAdelmanCategoryMorphism( gamma );

julia> IsWellDefined( m )
true

julia> IsCongruentForMorphisms( PreCompose( m, n ), PreCompose( n, m ) )
false

julia> IsCongruentForMorphisms( SubtractionForMorphisms( m, m ), ZeroMorphism( obj2_a, obj2_a ) )
true

julia> IsCongruentForMorphisms( ZeroObjectFunctorial( adelman ),
                                 PreCompose( UniversalMorphismFromZeroObject( obj1_a), UniversalMorphismIntoZeroObject( obj1_a ) ) 
                                )
true

julia> d = [ obj1_a, obj2_a ];

julia> pi1 = ProjectionInFactorOfDirectSum( d, 1 );

julia> pi2 = ProjectionInFactorOfDirectSum( d, 2 );

julia> id = IdentityMorphism( DirectSum( d ) );

julia> iota1 = InjectionOfCofactorOfDirectSum( d, 1 );

julia> iota2 = InjectionOfCofactorOfDirectSum( d, 2 );

julia> IsCongruentForMorphisms( PreCompose( pi1, iota1 ) + PreCompose( pi2, iota2 ), id )
true

julia> IsCongruentForMorphisms( UniversalMorphismIntoDirectSum( d, [ pi1, pi2 ] ), id )
true

julia> IsCongruentForMorphisms( UniversalMorphismFromDirectSum( d, [ iota1, iota2 ] ), id )
true

julia> c = CokernelProjection( m );

julia> c2 = CokernelProjection( c );

julia> IsCongruentForMorphisms( c2, ZeroMorphism( Source( c2 ), Range( c2 ) ) )
true

julia> IsWellDefined( CokernelProjection( m ) )
true

julia> IsCongruentForMorphisms( CokernelColift( m, CokernelProjection( m ) ), IdentityMorphism( CokernelObject( m ) ) )
true

julia> k = KernelEmbedding( c );

julia> IsZeroForMorphisms( PreCompose( k, c ) )
true

julia> IsCongruentForMorphisms( KernelLift( m, KernelEmbedding( m ) ), IdentityMorphism( KernelObject( m ) ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> true
true

julia> true
true

julia> R = HomalgRingOfIntegers();

julia> cat = CategoryOfRows( R );

julia> obj1 = CategoryOfRowsObject( 1, cat );

julia> obj2 = CategoryOfRowsObject( 2, cat );

julia> IsIsomorphicForObjects( obj1, obj2 )
false

julia> IsIsomorphicForObjects( obj2, obj2 )
true

julia> IsIsomorphism( SomeIsomorphismBetweenObjects( obj2, obj2 ) )
true

julia> id = IdentityMorphism( obj2 );

julia> alpha = CategoryOfRowsMorphism( obj1, HomalgMatrix( [ [ 1, 2 ] ], 1, 2, R ), obj2 );

julia> beta = CategoryOfRowsMorphism( obj2, HomalgMatrix( [ [ 1, 2 ], [ 3, 4 ] ], 2, 2, R ), obj2 );

julia> comp = PreCompose( alpha, beta );

julia> IsZero( comp );

julia> zero = ZeroMorphism( obj1, obj2 );

julia> IsZero( zero );

julia> ZeroObject( cat );

julia> UniversalMorphismIntoZeroObject( obj2 );

julia> UniversalMorphismFromZeroObject( obj1 );

julia> IsCongruentForMorphisms(
            SumOfMorphisms( obj1, [ alpha, alpha, alpha ], obj2 ),
            AdditionForMorphisms( alpha, AdditionForMorphisms( alpha, alpha ) )
        )
true

julia> IsCongruentForMorphisms(
            SumOfMorphisms( obj1, [ ], obj2 ),
            ZeroMorphism( obj1, obj2 )
        )
true

julia> DirectSum( obj1, obj2 );

julia> DirectSumFunctorial( [ alpha, beta, id ] );

julia> proj = ProjectionInFactorOfDirectSum( [ obj2, obj1, obj2 ], 2 );

julia> IsZero( ComponentOfMorphismFromDirectSum( proj, [ obj2, obj1, obj2 ], 1 ) )
true

julia> IsOne( ComponentOfMorphismFromDirectSum( proj, [ obj2, obj1, obj2 ], 2 ) )
true

julia> IsZero( ComponentOfMorphismFromDirectSum( proj, [ obj2, obj1, obj2 ], 3 ) )
true

julia> IsZero( ComponentOfMorphismFromCoproduct( proj, [ obj2, obj1, obj2 ], 1 ) )
true

julia> IsOne( ComponentOfMorphismFromCoproduct( proj, [ obj2, obj1, obj2 ], 2 ) )
true

julia> IsZero( ComponentOfMorphismFromCoproduct( proj, [ obj2, obj1, obj2 ], 3 ) )
true

julia> UniversalMorphismIntoDirectSum( [ alpha, alpha, alpha ] );

julia> inj = InjectionOfCofactorOfDirectSum( [ obj2, obj2, obj1 ], 2 );

julia> IsZero( ComponentOfMorphismIntoDirectSum( inj, [ obj2, obj2, obj1 ], 1 ) )
true

julia> IsOne( ComponentOfMorphismIntoDirectSum( inj, [ obj2, obj2, obj1 ], 2 ) )
true

julia> IsZero( ComponentOfMorphismIntoDirectSum( inj, [ obj2, obj2, obj1 ], 3 ) )
true

julia> IsZero( ComponentOfMorphismIntoDirectProduct( inj, [ obj2, obj2, obj1 ], 1 ) )
true

julia> IsOne( ComponentOfMorphismIntoDirectProduct( inj, [ obj2, obj2, obj1 ], 2 ) )
true

julia> IsZero( ComponentOfMorphismIntoDirectProduct( inj, [ obj2, obj2, obj1 ], 3 ) )
true

julia> gamma = CategoryOfRowsMorphism( obj2, HomalgMatrix( [ [ 1, 1 ], [ 1, 1 ] ], 2, 2, R ), obj2 );

julia> IsColiftable( beta, gamma )
true

julia> IsColiftable( gamma, beta )
false

julia> ProjectionInFirstFactorOfWeakBiFiberProduct( gamma, gamma );

julia> ProjectionInFirstFactorOfWeakBiFiberProduct( gamma, ZeroMorphism( Range( gamma ), Range( gamma ) ) );

julia> lift_arg_1 = PreCompose( ProjectionInFirstFactorOfWeakBiFiberProduct( gamma, gamma + gamma ), gamma );

julia> lift_arg_2 = gamma + gamma;

julia> IsLiftable( lift_arg_1, lift_arg_2 );

julia> Lift( lift_arg_1, lift_arg_2 );

julia> pi1 = ProjectionInFirstFactorOfWeakBiFiberProduct( alpha, beta );

julia> pi2 = ProjectionInSecondFactorOfWeakBiFiberProduct( alpha, beta );

julia> IsEqualForMorphisms( PreCompose( pi1, alpha ), PreCompose( pi2, beta ) );

julia> inj1 = InjectionOfFirstCofactorOfWeakBiPushout( gamma + gamma, gamma );

julia> inj2 = InjectionOfSecondCofactorOfWeakBiPushout( gamma + gamma, gamma );

julia> IsEqualForMorphisms( PreCompose( gamma + gamma, inj1 ), PreCompose( gamma, inj2 ) );

julia> WeakKernelLift( WeakCokernelProjection( gamma ), gamma );

julia> pi1 = InjectionOfFirstCofactorOfWeakBiPushout( alpha, alpha );

julia> pi2 = InjectionOfSecondCofactorOfWeakBiPushout( alpha, alpha );

julia> UniversalMorphismFromWeakBiPushout( alpha, alpha, pi1, pi2 );

julia> ## Freyd categories
        freyd = FreydCategory( cat );

julia> IsAbelianCategory( freyd );

julia> obj_gamma = FreydCategoryObject( gamma );

julia> u = RandomMorphismWithFixedSource( obj_gamma, [ [5], [5] ] );

julia> IsWellDefined( u ) && IsEqualForObjects( Source(u), obj_gamma )
true

julia> u = RandomMorphismWithFixedSource( obj_gamma, 5 );

julia> IsWellDefined( u ) && IsEqualForObjects( Source(u), obj_gamma )
true

julia> u = RandomMorphismWithFixedRange( obj_gamma, [ [5], [5] ] );

julia> IsWellDefined( u ) && IsEqualForObjects( Range(u), obj_gamma )
true

julia> u = RandomMorphismWithFixedRange( obj_gamma, 5 );

julia> IsWellDefined( u ) && IsEqualForObjects( Range(u), obj_gamma )
true

julia> obj_delta = RandomObject( freyd, [[10],[10],[10]] );

julia> obj_delta = RandomObject( freyd, 10 );

julia> u = RandomMorphismWithFixedSourceAndRange( obj_gamma, obj_delta, [ 5 ] );

julia> IsWellDefined( u )
true

julia> IsEqualForObjects( Source(u), obj_gamma ) && IsEqualForObjects( Range(u), obj_delta )
true

julia> u = RandomMorphismWithFixedSourceAndRange( obj_gamma, obj_delta, 5 );

julia> IsWellDefined( u )
true

julia> IsEqualForObjects( Source(u), obj_gamma ) && IsEqualForObjects( Range(u), obj_delta )
true

julia> IsWellDefined( RandomMorphism( freyd, 5 ) )
true

julia> IsWellDefined( RandomMorphism( freyd, [[[5],[5],[5]],[[5],[5],[5]],[1]] ) )
true

julia> f = FreydCategoryMorphism( obj_gamma, gamma, obj_gamma );

julia> witness = MorphismWitness( f );

julia> g = FreydCategoryMorphism( obj_gamma, ZeroMorphism( obj2, obj2 ), obj_gamma );

julia> IsCongruentForMorphisms( f, g );

julia> c = PreCompose( f, f );

julia> s = g + g;

julia> a = CategoryOfRowsMorphism( obj1, HomalgMatrix( [ [ 2 ] ], 1, 1, R ), obj1 );

julia> Z2 = FreydCategoryObject( a );

julia> id = IdentityMorphism( Z2 );

julia> z = id + id + id;

julia> d = DirectSumFunctorial( [ z, z, z ] );

julia> pr2 = ProjectionInFactorOfDirectSum( [ Z2, Z2, Z2 ], 2 );

julia> pr3 = ProjectionInFactorOfDirectSum( [ Z2, Z2, Z2 ], 3 );

julia> UniversalMorphismIntoDirectSum( [ pr3, pr2 ] );

julia> inj1 = InjectionOfCofactorOfDirectSum( [ Z2, Z2, Z2 ], 1 );

julia> inj2 = InjectionOfCofactorOfDirectSum( [ Z2, Z2, Z2 ], 2 );

julia> UniversalMorphismFromDirectSum( [ inj2, inj1 ] );

julia> ZFree = obj1/freyd;

julia> id = IdentityMorphism( ZFree );

julia> z = id + id;

julia> CokernelProjection( z );

julia> CokernelColift( z, CokernelProjection( z ) );

julia> UniversalMorphismFromZeroObjectWithGivenZeroObject( obj_gamma, ZeroObject( freyd ) );

julia> MultiplyWithElementOfCommutativeRingForMorphisms( 2 / R, f );

julia> S = HomalgFieldOfRationalsInSingular() * "x,y,z";

julia> Rows_S = CategoryOfRows( S );

julia> S3 = CategoryOfRowsObject( 3, Rows_S );

julia> S1 = CategoryOfRowsObject( 1, Rows_S );

julia> mor = CategoryOfRowsMorphism( S3, HomalgMatrix( "[x,y,z]", 3, 1, S ), S1 );

julia> biased_w = CategoryOfRowsMorphism( S3, HomalgMatrix( "[x,0,0,0,x,0,0,0,x]", 3, 3, S ), S3 );

julia> biased_h = CategoryOfRowsMorphism( S3, HomalgMatrix( "[x*y, x*z, y^2]", 3, 3, S ), S3 );

julia> BiasedWeakFiberProduct( biased_h, biased_w );

julia> ProjectionOfBiasedWeakFiberProduct( biased_h, biased_w );

julia> IsCongruentForMorphisms(
           PreCompose( UniversalMorphismIntoBiasedWeakFiberProduct( biased_h, biased_w, biased_h ), ProjectionOfBiasedWeakFiberProduct( biased_h, biased_w ) ),
           biased_h
        )
true

julia> IsCongruentForMorphisms(
          PreCompose( InjectionOfBiasedWeakPushout( biased_h, biased_w ), UniversalMorphismFromBiasedWeakPushout( biased_h, biased_w, biased_h )),
          biased_h
        )
true

julia> k = FreydCategoryObject( mor );

julia> w = EpimorphismFromSomeProjectiveObjectForKernelObject( UniversalMorphismIntoZeroObject( k ) );

julia> k = KernelEmbedding( w );

julia> ColiftAlongEpimorphism( CokernelProjection( k ), CokernelProjection( k ) );

julia> ## Homomorphism structures
        a = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( gamma );

julia> IsCongruentForMorphisms( InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( a ), Range( a ), InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( a ) ), a );

julia> a = ZeroObjectFunctorial( cat );

julia> IsCongruentForMorphisms( InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( a ), Range( a ), InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( a ) ), a );

julia> Z4 = FreydCategoryObject( AsCategoryOfRowsMorphism( HomalgMatrix( "[4]", 1, 1, R ), cat ) );

julia> Z3 = FreydCategoryObject( AsCategoryOfRowsMorphism( HomalgMatrix( "[3]", 1, 1, R ), cat ) );

julia> HomomorphismStructureOnObjects( Z4, Z2 );

julia> HomomorphismStructureOnObjects( Z4, Z4 );

julia> HomomorphismStructureOnObjects( Z2, Z4 );

julia> HomomorphismStructureOnObjects( Z3, Z4 );

julia> HomomorphismStructureOnMorphisms( IdentityMorphism( DirectSum( Z4, Z2, Z3 ) ), -IdentityMorphism( DirectSum( Z4, Z3 ) ) );

julia> ## Lifts
        S2 = CategoryOfRowsObject( 2, Rows_S );

julia> S4 = CategoryOfRowsObject( 4, Rows_S );

julia> S1_freyd = AsFreydCategoryObject( S1 );

julia> S2_freyd = AsFreydCategoryObject( S2 );

julia> S3_freyd = AsFreydCategoryObject( S3 );

julia> S4_freyd = AsFreydCategoryObject( S4 );

julia> lift = FreydCategoryMorphism( S1_freyd, CategoryOfRowsMorphism( S1, HomalgMatrix( "[x]", 1, 1, S ), S1 ), S1_freyd );

julia> gamma = FreydCategoryMorphism( S1_freyd, CategoryOfRowsMorphism( S1, HomalgMatrix( "[y]", 1,1, S ), S1 ), S1_freyd );

julia> alpha = PreCompose( lift, gamma );

julia> IsLiftable( alpha, gamma )
true

julia> Lift( alpha, gamma );

julia> IsColiftable( lift, alpha )
true

julia> IsCongruentForMorphisms( PreCompose( lift, Colift( lift, alpha ) ), alpha )
true

julia> lift = FreydCategoryMorphism( S2_freyd, CategoryOfRowsMorphism( S2, HomalgMatrix( "[x,y,z,x^2,1,z+1]", 2, 3, S ), S3 ), S3_freyd );

julia> gamma = FreydCategoryMorphism( S3_freyd, CategoryOfRowsMorphism( S3, HomalgMatrix( "[x,y,z,z+1, x^2,y^2,z^2,z^2+1, x^3,y^3,z^3,z^3+1]", 3,4, S ), S4 ), S4_freyd );

julia> alpha = PreCompose( lift, gamma );

julia> Lift( alpha, gamma );

julia> Colift( lift, alpha );

julia> IsCongruentForMorphisms( PreCompose( lift, Colift( lift, alpha ) ), alpha );

julia> interpretation = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( gamma );

julia> IsCongruentForMorphisms( gamma,
        InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( gamma ), Range( gamma ), interpretation ) );

julia> ## Opposite
        HomomorphismStructureOnObjects( Opposite( Z4 ), Opposite( Z2 ) );

julia> HomomorphismStructureOnObjects( Z2, Z4 );

julia> interpretation = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( Opposite( gamma ) );

julia> IsCongruentForMorphisms( Opposite( gamma ),
        InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( Opposite( gamma ) ), Range( Opposite( gamma ) ), interpretation ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgRingOfIntegers();

julia> cat = CategoryOfColumns( R );

julia> obj1 = CategoryOfColumnsObject( 1, cat );

julia> obj2 = CategoryOfColumnsObject( 2, cat );

julia> id = IdentityMorphism( obj2 );

julia> alpha = CategoryOfColumnsMorphism( obj1, HomalgMatrix( [ [ 1 ], [ 2 ] ], 1, 2, R ), obj2 );

julia> beta = CategoryOfColumnsMorphism( obj2, HomalgMatrix( [ [ 1, 2 ], [ 3, 4 ] ], 2, 2, R ), obj2 );

julia> comp = PreCompose( alpha, beta );

julia> IsZero( comp );

julia> zero = ZeroMorphism( obj1, obj2 );

julia> IsZero( zero );

julia> ZeroObject( cat );

julia> UniversalMorphismIntoZeroObject( obj2 );

julia> UniversalMorphismFromZeroObject( obj1 );

julia> DirectSum( obj1, obj2 );

julia> DirectSumFunctorial( [ alpha, beta, id ] );

julia> proj = ProjectionInFactorOfDirectSum( [ obj2, obj1, obj2 ], 2 );

julia> IsZero( ComponentOfMorphismFromDirectSum( proj, [ obj2, obj1, obj2 ], 1 ) )
true

julia> IsOne( ComponentOfMorphismFromDirectSum( proj, [ obj2, obj1, obj2 ], 2 ) )
true

julia> IsZero( ComponentOfMorphismFromDirectSum( proj, [ obj2, obj1, obj2 ], 3 ) )
true

julia> UniversalMorphismIntoDirectSum( [ alpha, alpha, alpha ] );

julia> inj = InjectionOfCofactorOfDirectSum( [ obj2, obj2, obj1 ], 2 );

julia> IsZero( ComponentOfMorphismIntoDirectSum( inj, [ obj2, obj2, obj1 ], 1 ) )
true

julia> IsOne( ComponentOfMorphismIntoDirectSum( inj, [ obj2, obj2, obj1 ], 2 ) )
true

julia> IsZero( ComponentOfMorphismIntoDirectSum( inj, [ obj2, obj2, obj1 ], 3 ) )
true

julia> gamma = CategoryOfColumnsMorphism( obj2, HomalgMatrix( [ [ 1, 1 ], [ 1, 1 ] ], 2, 2, R ), obj2 );

julia> IsColiftable( beta, gamma )
false

julia> IsColiftable( gamma, beta )
false

julia> ProjectionInFirstFactorOfWeakBiFiberProduct( gamma, gamma );

julia> ProjectionInFirstFactorOfWeakBiFiberProduct( gamma, ZeroMorphism( Range( gamma ), Range( gamma ) ) );

julia> lift_arg_1 = PreCompose( ProjectionInFirstFactorOfWeakBiFiberProduct( gamma, gamma + gamma ), gamma );

julia> lift_arg_2 = gamma + gamma;

julia> IsLiftable( lift_arg_1, lift_arg_2 );

julia> Lift( lift_arg_1, lift_arg_2 );

julia> pi1 = ProjectionInFirstFactorOfWeakBiFiberProduct( alpha, beta );

julia> pi2 = ProjectionInSecondFactorOfWeakBiFiberProduct( alpha, beta );

julia> IsEqualForMorphisms( PreCompose( pi1, alpha ), PreCompose( pi2, beta ) );

julia> inj1 = InjectionOfFirstCofactorOfWeakBiPushout( gamma + gamma, gamma );

julia> inj2 = InjectionOfSecondCofactorOfWeakBiPushout( gamma + gamma, gamma );

julia> IsEqualForMorphisms( PreCompose( gamma + gamma, inj1 ), PreCompose( gamma, inj2 ) );

julia> WeakKernelLift( WeakCokernelProjection( gamma ), gamma );

julia> pi1 = InjectionOfFirstCofactorOfWeakBiPushout( alpha, alpha );

julia> pi2 = InjectionOfSecondCofactorOfWeakBiPushout( alpha, alpha );

julia> UniversalMorphismFromWeakBiPushout( alpha, alpha, pi1, pi2 );

julia> ## Freyd categories
        freyd = FreydCategory( cat );

julia> IsAbelianCategory( freyd );

julia> obj_gamma = FreydCategoryObject( gamma );

julia> f = FreydCategoryMorphism( obj_gamma, gamma, obj_gamma );

julia> witness = MorphismWitness( f );

julia> g = FreydCategoryMorphism( obj_gamma, ZeroMorphism( obj2, obj2 ), obj_gamma );

julia> IsCongruentForMorphisms( f, g );

julia> c = PreCompose( f, f );

julia> s = g + g;

julia> a = CategoryOfColumnsMorphism( obj1, HomalgMatrix( [ [ 2 ] ], 1, 1, R ), obj1 );

julia> Z2 = FreydCategoryObject( a );

julia> id = IdentityMorphism( Z2 );

julia> z = id + id + id;

julia> d = DirectSumFunctorial( [ z, z, z ] );

julia> pr2 = ProjectionInFactorOfDirectSum( [ Z2, Z2, Z2 ], 2 );

julia> pr3 = ProjectionInFactorOfDirectSum( [ Z2, Z2, Z2 ], 3 );

julia> UniversalMorphismIntoDirectSum( [ pr3, pr2 ] );

julia> inj1 = InjectionOfCofactorOfDirectSum( [ Z2, Z2, Z2 ], 1 );

julia> inj2 = InjectionOfCofactorOfDirectSum( [ Z2, Z2, Z2 ], 2 );

julia> UniversalMorphismFromDirectSum( [ inj2, inj1 ] );

julia> ZFree = AsFreydCategoryObject( obj1 );

julia> id = IdentityMorphism( ZFree );

julia> z = id + id;

julia> CokernelProjection( z );

julia> CokernelColift( z, CokernelProjection( z ) );

julia> S = HomalgFieldOfRationalsInSingular() * "x,y,z";

julia> Cols_S = CategoryOfColumns( S );

julia> S3 = CategoryOfColumnsObject( 3, Cols_S );

julia> S1 = CategoryOfColumnsObject( 1, Cols_S );

julia> mor = CategoryOfColumnsMorphism( S3, HomalgMatrix( "[x,y,z]", 1, 3, S ), S1 );

julia> biased_w = CategoryOfColumnsMorphism( S3, HomalgMatrix( "[x,0,0,0,x,0,0,0,x]", 3, 3, S ), S3 );

julia> biased_h = CategoryOfColumnsMorphism( S3, HomalgMatrix( "[x*y, x*z, y^2]", 3, 3, S ), S3 );

julia> BiasedWeakFiberProduct( biased_h, biased_w );

julia> ProjectionOfBiasedWeakFiberProduct( biased_h, biased_w );

julia> IsCongruentForMorphisms(
           PreCompose( UniversalMorphismIntoBiasedWeakFiberProduct( biased_h, biased_w, biased_h ), ProjectionOfBiasedWeakFiberProduct( biased_h, biased_w ) ),
           biased_h
        )
true

julia> IsCongruentForMorphisms(
          PreCompose( InjectionOfBiasedWeakPushout( biased_h, biased_w ), UniversalMorphismFromBiasedWeakPushout( biased_h, biased_w, biased_h )),
          biased_h
        )
true

julia> k = FreydCategoryObject( mor );

julia> w = EpimorphismFromSomeProjectiveObjectForKernelObject( UniversalMorphismIntoZeroObject( k ) );

julia> k = KernelEmbedding( w );

julia> ColiftAlongEpimorphism( CokernelProjection( k ), CokernelProjection( k ) );

julia> ## Homomorphism structures
        a = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( gamma );

julia> IsCongruentForMorphisms( InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( a ), Range( a ), InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( a ) ), a );

julia> a = ZeroObjectFunctorial( cat );

julia> IsCongruentForMorphisms( InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( a ), Range( a ), InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( a ) ), a );

julia> Z4 = FreydCategoryObject( AsCategoryOfColumnsMorphism( HomalgMatrix( "[4]", 1, 1, R ), cat ) );

julia> Z3 = FreydCategoryObject( AsCategoryOfColumnsMorphism( HomalgMatrix( "[3]", 1, 1, R ), cat ) );

julia> HomomorphismStructureOnObjects( Z4, Z2 );

julia> HomomorphismStructureOnObjects( Z4, Z4 );

julia> HomomorphismStructureOnObjects( Z2, Z4 );

julia> HomomorphismStructureOnObjects( Z3, Z4 );

julia> HomomorphismStructureOnMorphisms( IdentityMorphism( DirectSum( Z4, Z2, Z3 ) ), -IdentityMorphism( DirectSum( Z4, Z3 ) ) );

julia> ## Lifts
        S2 = CategoryOfColumnsObject( 2, Cols_S );

julia> S4 = CategoryOfColumnsObject( 4, Cols_S );

julia> S1_freyd = AsFreydCategoryObject( S1 );

julia> S2_freyd = AsFreydCategoryObject( S2 );

julia> S3_freyd = AsFreydCategoryObject( S3 );

julia> S4_freyd = AsFreydCategoryObject( S4 );

julia> lift = FreydCategoryMorphism( S1_freyd, CategoryOfColumnsMorphism( S1, HomalgMatrix( "[x]", 1, 1, S ), S1 ), S1_freyd );

julia> gamma = FreydCategoryMorphism( S1_freyd, CategoryOfColumnsMorphism( S1, HomalgMatrix( "[y]", 1,1, S ), S1 ), S1_freyd );

julia> alpha = PreCompose( lift, gamma );

julia> Lift( alpha, gamma );

julia> Colift( lift, alpha );

julia> IsCongruentForMorphisms( PreCompose( lift, Colift( lift, alpha ) ), alpha );

julia> lift = FreydCategoryMorphism( S2_freyd, CategoryOfColumnsMorphism( S2, HomalgMatrix( "[x,y,z,x^2,1,z+1]", 3, 2, S ), S3 ), S3_freyd );

julia> gamma = FreydCategoryMorphism( S3_freyd, CategoryOfColumnsMorphism( S3, HomalgMatrix( "[x,y,z,z+1, x^2,y^2,z^2,z^2+1, x^3,y^3,z^3,z^3+1]", 4,3, S ), S4 ), S4_freyd );

julia> alpha = PreCompose( lift, gamma );

julia> Lift( alpha, gamma );

julia> Colift( lift, alpha );

julia> IsCongruentForMorphisms( PreCompose( lift, Colift( lift, alpha ) ), alpha );

julia> interpretation = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( gamma );

julia> IsCongruentForMorphisms( gamma,
        InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( gamma ), Range( gamma ), interpretation ) );

julia> ## Opposite
        HomomorphismStructureOnObjects( Opposite( Z4 ), Opposite( Z2 ) );

julia> HomomorphismStructureOnObjects( Z2, Z4 );

julia> interpretation = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( Opposite( gamma ) );

julia> IsCongruentForMorphisms( Opposite( gamma ),
        InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( Opposite( gamma ) ), Range( Opposite( gamma ) ), interpretation ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> true
true

julia> ZZZ = HomalgRingOfIntegers( );

julia> rows = CategoryOfRows( ZZZ );

julia> co_freyd = CoFreydCategory( rows )
CoFreyd( Rows( Z ) )

julia> rows_obj = CategoryOfRowsObject( rows, 1 );; # ZZZ^1

julia> co_freyd_obj = AsCoFreydCategoryObject( rows_obj );; # ZZZ^1 -> 0

julia> rows_mor = CategoryOfRowsMorphism( rows, rows_obj, HomalgMatrix( [ 2 ], 1, 1, ZZZ ), rows_obj );; # ZZZ^1 --2-> ZZZ^1

julia> co_freyd_mor = CoFreydCategoryMorphism( co_freyd_obj, rows_mor, co_freyd_obj );

julia> IsWellDefined( co_freyd_mor )
true

julia> Display( KernelObject( co_freyd_mor ) )

--------------------------------
CoRelation morphism:
--------------------------------

Source: 
A row module over Z of rank 1

Matrix: 
[ [  2 ] ]

Range: 
A row module over Z of rank 1

A morphism in Rows( Z )


--------------------------------
General description:
--------------------------------

An object in CoFreyd( Rows( Z ) )


julia> Display( UnderlyingMorphism( KernelEmbedding( co_freyd_mor ) ) )
Source: 
A row module over Z of rank 1

Matrix: 
[ [  1 ] ]

Range: 
A row module over Z of rank 1

A morphism in Rows( Z )

julia> Display( CokernelObject( co_freyd_mor ) )

--------------------------------
CoRelation morphism:
--------------------------------

Source: 
A row module over Z of rank 0

Matrix: 
(an empty 0 x 0 matrix)

Range: 
A row module over Z of rank 0

A morphism in Rows( Z )


--------------------------------
General description:
--------------------------------

An object in CoFreyd( Rows( Z ) )


julia> Display( UnderlyingMorphism( CokernelProjection( co_freyd_mor ) ) )
Source: 
A row module over Z of rank 1

Matrix: 
(an empty 1 x 0 matrix)

Range: 
A row module over Z of rank 0

A morphism in Rows( Z )

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgFieldOfRationalsInSingular() * "x,y,z";

julia> RowsR = CategoryOfRows( R );

julia> m = AsCategoryOfRowsMorphism( 
            HomalgMatrix( "[[x],[y],[z]]", 3, 1, R ), RowsR
        );

julia> mu = AsCokernelImageClosureMorphism( m );

julia> C = CokernelObject( mu );

julia> C2 = AsFinitelyPresentedCokernelImageClosureObject( m );

julia> IsEqualForObjects( C, C2 )
true

julia> n = AsCategoryOfRowsMorphism( 
            HomalgMatrix( "[[x,y],[y^2,z]]", 2, 2, R ), RowsR
        );

julia> nu = AsCokernelImageClosureMorphism( n );

julia> nu2 = PreCompose( nu, nu );

julia> IsWellDefined( nu2 )
true

julia> IsCongruentForMorphisms( nu, nu2 )
false

julia> nu + nu;

julia> nu2 - nu;

julia> cat = CapCategory( nu );

julia> ZeroObject( cat );

julia> ZeroMorphism( Source( nu ), Source( mu ) );

julia> UniversalMorphismIntoZeroObject( Source( nu ) );

julia> UniversalMorphismFromZeroObject( Source( nu ) );

julia> S = Source( mu );

julia> DirectSum( [S, S, S ] );

julia> DirectSumFunctorial( [ nu2, nu ] );

julia> UniversalMorphismIntoDirectSum( [ nu, nu ] );

julia> UniversalMorphismFromDirectSum( [ nu, nu ] );

julia> ProjectionInFactorOfDirectSum( [ S, S, S ], 2 );

julia> InjectionOfCofactorOfDirectSum( [ S, S, S, S ], 4 );

julia> CokernelColift( nu, CokernelProjection( nu ) );

julia> IsCongruentForMorphisms( nu, PreCompose( CoastrictionToImage( nu ), ImageEmbedding( nu ) ) )
true

julia> u = UniversalMorphismFromImage( nu, [ nu, IdentityMorphism( Range( nu ) ) ] );

julia> IsWellDefined( u )
true

julia> IsCongruentForMorphisms( nu, PreCompose( CoastrictionToImage( nu ), u ) )
true

julia> IsCongruentForMorphisms( u, ImageEmbedding( nu ) )
true

julia> kernel = KernelObject( mu );

julia> emb = KernelEmbedding( mu );

julia> p = PreCompose( EpimorphismFromSomeProjectiveObject( kernel ), KernelEmbedding( mu ) );

julia> KernelLift( mu, p );

julia> LiftAlongMonomorphism( emb, p );

julia> I_to_A = FunctorCokernelImageClosureToFreydCategory( RowsR );

julia> A_to_I = FunctorFreydCategoryToCokernelImageClosure( RowsR );

julia> ApplyFunctor( I_to_A, kernel );

julia> ApplyFunctor( A_to_I, ApplyFunctor( I_to_A, kernel ) );

julia> nu = NaturalIsomorphismFromIdentityToFinitePresentationOfCokernelImageClosureObject( RowsR );

julia> mu = NaturalIsomorphismFromFinitePresentationOfCokernelImageClosureObjectToIdentity( RowsR );

julia> IsCongruentForMorphisms(
            IdentityMorphism( kernel ),
            PreCompose( ApplyNaturalTransformation( nu, kernel ), ApplyNaturalTransformation( mu, kernel ) )
        )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgFieldOfRationalsInSingular() * "x,y,z";

julia> ColsR = CategoryOfColumns( R );

julia> m = AsCategoryOfColumnsMorphism( 
             HomalgMatrix( "[[x],[y],[z]]", 1, 3, R ), ColsR
        );

julia> mu = AsCokernelImageClosureMorphism( m );

julia> C = CokernelObject( mu );

julia> C2 = AsFinitelyPresentedCokernelImageClosureObject( m );

julia> IsEqualForObjects( C, C2 )
true

julia> n = AsCategoryOfColumnsMorphism( 
            HomalgMatrix( "[[x,y],[y^2,z]]", 2, 2, R ), ColsR
        );

julia> nu = AsCokernelImageClosureMorphism( n );

julia> nu2 = PreCompose( nu, nu );

julia> IsWellDefined( nu2 )
true

julia> IsCongruentForMorphisms( nu, nu2 )
false

julia> nu + nu;

julia> nu2 - nu;

julia> cat = CapCategory( nu );

julia> ZeroObject( cat );

julia> ZeroMorphism( Source( nu ), Source( mu ) );

julia> UniversalMorphismIntoZeroObject( Source( nu ) );

julia> UniversalMorphismFromZeroObject( Source( nu ) );

julia> S = Source( mu );

julia> DirectSum( [S, S, S ] );

julia> DirectSumFunctorial( [ nu2, nu ] );

julia> UniversalMorphismIntoDirectSum( [ nu, nu ] );

julia> UniversalMorphismFromDirectSum( [ nu, nu ] );

julia> ProjectionInFactorOfDirectSum( [ S, S, S ], 2 );

julia> InjectionOfCofactorOfDirectSum( [ S, S, S, S ], 4 );

julia> CokernelColift( nu, CokernelProjection( nu ) );

julia> IsCongruentForMorphisms( nu, PreCompose( CoastrictionToImage( nu ), ImageEmbedding( nu ) ) )
true

julia> u = UniversalMorphismFromImage( nu, [ nu, IdentityMorphism( Range( nu ) ) ] );

julia> IsWellDefined( u )
true

julia> IsCongruentForMorphisms( nu, PreCompose( CoastrictionToImage( nu ), u ) )
true

julia> IsCongruentForMorphisms( u, ImageEmbedding( nu ) )
true

julia> kernel = KernelObject( mu );

julia> emb = KernelEmbedding( mu );

julia> p = PreCompose( EpimorphismFromSomeProjectiveObject( kernel ), KernelEmbedding( mu ) );

julia> KernelLift( mu, p );

julia> LiftAlongMonomorphism( emb, p );

julia> I_to_A = FunctorCokernelImageClosureToFreydCategory( ColsR );

julia> A_to_I = FunctorFreydCategoryToCokernelImageClosure( ColsR );

julia> ApplyFunctor( I_to_A, kernel );

julia> ApplyFunctor( A_to_I, ApplyFunctor( I_to_A, kernel ) );

julia> nu = NaturalIsomorphismFromIdentityToFinitePresentationOfCokernelImageClosureObject( ColsR );

julia> mu = NaturalIsomorphismFromFinitePresentationOfCokernelImageClosureObjectToIdentity( ColsR );

julia> IsCongruentForMorphisms(
            IdentityMorphism( kernel ),
            PreCompose( ApplyNaturalTransformation( nu, kernel ), ApplyNaturalTransformation( mu, kernel ) )
        )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgRingOfIntegers();

julia> RowsR = CategoryOfRows( R );

julia> one = AsCategoryOfRowsMorphism( HomalgMatrix( [ [ 1 ] ], 1, 1, R ), RowsR );

julia> two = AsCategoryOfRowsMorphism( HomalgMatrix( [ [ 2 ] ], 1, 1, R ), RowsR );

julia> four = AsCategoryOfRowsMorphism( HomalgMatrix( [ [ 4 ] ], 1, 1, R ), RowsR );

julia> source = AdelmanCategoryObject( two, two );

julia> range = AdelmanCategoryObject( two, four );

julia> mor = AdelmanCategoryMorphism( source, one, range );

julia> IsZero( mor )
false

julia> emb = EmbeddingFunctorIntoFreydCategory( RowsR );

julia> ind = AdelmanCategoryFunctorInducedByUniversalProperty( emb );

julia> IsZero( ApplyFunctor( ind, mor ) )
true

julia> M = FreydCategoryObject( AsCategoryOfRowsMorphism( HomalgMatrix( [ [  2, 2, 2 ], [ 4, 4, 6 ] ], 2, 3, R ), RowsR ) );

julia> as_tensor = EmbeddingFunctorOfFreydCategoryIntoAdelmanCategory( RowsR );

julia> Mt = ApplyFunctor( as_tensor, M );

julia> lsat = LeftSatelliteAsEndofunctorOfAdelmanCategory( RowsR );

julia> rsat = RightSatelliteAsEndofunctorOfAdelmanCategory( RowsR );

julia> torsion = ApplyFunctor( ind, ( ApplyFunctor( rsat, ApplyFunctor( lsat, Mt ) ) ) );

julia> unit = UnitOfSatelliteAdjunctionOfAdelmanCategory( RowsR );

julia> IsZero( ApplyNaturalTransformation( unit, Mt ) )
true

julia> counit = CounitOfSatelliteAdjunctionOfAdelmanCategory( RowsR );

julia> t = ApplyNaturalTransformation( counit, Mt );

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgFieldOfRationalsInSingular() * "x,y";

julia> R = R/"x*y"/"x^2";

julia> RowsR = CategoryOfRows( R );

julia> Freyd = FreydCategory( RowsR );

julia> mat = HomalgMatrix( "[x,y]", 1, 2, R );

julia> M = mat/Freyd;

julia> mu1 = GradeFiltrationNthMonomorphism( M, 1 );

julia> IsMonomorphism( mu1 )
true

julia> IsZero( mu1 )
false

julia> IsEpimorphism( mu1 )
false

julia> mu2 = GradeFiltrationNthMonomorphism( M, 2 );

julia> IsIsomorphism( mu2 )
true

julia> IsZero( mu2 )
false

julia> mu3 = GradeFiltrationNthMonomorphism( M, 3 );

julia> IsIsomorphism( mu3 )
true

julia> IsZero( mu3 )
false

julia> mu4 = GradeFiltrationNthMonomorphism( M, 4 );

julia> IsMonomorphism( mu4 )
false

julia> IsEpimorphism( mu4 )
true

julia> IsZero( mu4 )
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Qxyz = HomalgFieldOfRationalsInDefaultCAS( ) * "x,y,z";

julia> wmat = HomalgMatrix( "[ > x*y,  y*z,    z,        0,         0,    > x^3*z,x^2*z^2,0,        x*z^2,     -z^2, > x^4,  x^3*z,  0,        x^2*z,     -x*z, > 0,    0,      x*y,      -y^2,      x^2-1,> 0,    0,      x^2*z,    -x*y*z,    y*z,  > 0,    0,      x^2*y-x^2,-x*y^2+x*y,y^2-y > ]", 6, 5, Qxyz );

julia> RowsR = CategoryOfRows( Qxyz );

julia> Freyd = FreydCategory( RowsR );

julia> Adel = AdelmanCategory( RowsR );

julia> M = wmat/Freyd;

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> M_tor = M/Adel;

julia> Mu1 = GradeFiltrationNthNaturalTransformationComponent( M_tor, 1 );

julia> IsZero( Mu1 )
false

julia> IsMonomorphism( Mu1 )
true

julia> Mu2 = GradeFiltrationNthNaturalTransformationComponent( M_tor, 2 );

julia> IsZero( Mu2 )
false

julia> IsMonomorphism( Mu2 )
false

julia> Mu3 = GradeFiltrationNthNaturalTransformationComponent( M_tor, 3 );

julia> IsZero( Mu3 )
false

julia> IsMonomorphism( Mu3 )
false

julia> Mu4 = GradeFiltrationNthNaturalTransformationComponent( M_tor, 4 );

julia> IsZero( Mu4 )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> mu1 = GradeFiltrationNthMonomorphism( M, 1 );

julia> IsZero( mu1 )
false

julia> IsMonomorphism( mu1 )
true

julia> mu2 = GradeFiltrationNthMonomorphism( M, 2 );

julia> IsZero( mu2 )
false

julia> IsMonomorphism( mu2 )
true

julia> mu3 = GradeFiltrationNthMonomorphism( M, 3 );

julia> IsZero( mu3 )
false

julia> IsMonomorphism( mu3 )
true

julia> mu4 = GradeFiltrationNthMonomorphism( M, 4 );

julia> IsZero( mu4 )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> G = SymmetricGroup( 3 );

julia> CG = GroupAsCategory( G );

julia> u = GroupAsCategoryUniqueObject( CG );

julia> alpha = GroupAsCategoryMorphism( (1,2,3), CG );

julia> alpha * Inverse( alpha ) == IdentityMorphism( u )
true

julia> beta = GroupAsCategoryMorphism( (1,2,3,5), CG );

julia> IsWellDefined( beta )
false

julia> gamma = GroupAsCategoryMorphism( (1,3), CG );

julia> IsWellDefined( gamma )
true

julia> Lift( alpha, gamma ) * gamma == alpha
true

julia> alpha * Colift( alpha, gamma ) == gamma
true

julia> Length( HomomorphismStructureOnObjects( u, u ) ) == Size( G )
true

julia> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism(
            u,u,
            PreCompose(
                InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( alpha ), HomomorphismStructureOnMorphisms( gamma, Inverse( gamma ) )
            )
        )
        =
        gamma * alpha * Inverse( gamma )
true

julia> x = (2,3)/CG;

julia> id = ()/CG;

julia> IsIdenticalObj( x * x, id )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgFieldOfRationalsInSingular() * "x,y,z";

julia> Rows_R = CategoryOfRows( R );

julia> R1 = CategoryOfRowsObject( 1, Rows_R );

julia> R3 = CategoryOfRowsObject( 3, Rows_R );

julia> alpha = CategoryOfRowsMorphism( R3, HomalgMatrix( "[x,y,z]", 3, 1, R ), R1 );

julia> M = FreydCategoryObject( alpha );

julia> c0 = CovariantExtAsFreydCategoryObject( M, 0 );

julia> c1 = CovariantExtAsFreydCategoryObject( M, 1 );

julia> c2 = CovariantExtAsFreydCategoryObject( M, 2 );

julia> IsZeroForObjects( HomomorphismStructureOnObjects( c0, c2 ) ); # == Ext^2( M, M )
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgFieldOfRationalsInSingular() * "x,y,z";

julia> Cols_R = CategoryOfColumns( R );

julia> R1 = CategoryOfColumnsObject( 1, Cols_R );

julia> R3 = CategoryOfColumnsObject( 3, Cols_R );

julia> alpha = CategoryOfColumnsMorphism( R3, HomalgMatrix( "[x,y,z]", 1, 3, R ), R1 );

julia> M = FreydCategoryObject( alpha );

julia> c0 = CovariantExtAsFreydCategoryObject( M, 0 );

julia> c1 = CovariantExtAsFreydCategoryObject( M, 1 );

julia> c2 = CovariantExtAsFreydCategoryObject( M, 2 );

julia> IsZeroForObjects( HomomorphismStructureOnObjects( c0, c2 ) ); # == Ext^2( M, M )
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> G = SymmetricGroup( 3 );

julia> CG = GroupAsCategory( G );

julia> compare_func = function( g, h ) return UnderlyingGroupElement( g ) < UnderlyingGroupElement( h ); end;

julia> ZZZ = HomalgRingOfIntegers();

julia> ZCG = LinearClosure( ZZZ, CG, compare_func );

julia> u = GroupAsCategoryUniqueObject( CG );

julia> g = GroupAsCategoryMorphism( (1,2,3), CG );

julia> h = GroupAsCategoryMorphism( (1,2), CG );

julia> v = LinearClosureObject( ZCG, u );

julia> elem1 = LinearClosureMorphism( v, [ 1, 2, 3, 4, 5, 6 ], [ g, h, g, h, g, h ], v );

julia> elem2 = LinearClosureMorphism( v, [ 1, 2, 3, 4, 5, 6 ], [ h, g, h, g, h, g ], v );

julia> # for i in (1):(10^6) do LinearClosureMorphism( v, [ 1, 2, 3, 4, 5, 6 ], [ g, h, g, h, g, h ], v ); end

julia> elem = LinearClosureMorphism( v, [ 0, 0, 0, 0, 0, 0 ], [ g, h, g, h, g, h ], v );

julia> a = (1,2)/CG/ZCG;

julia> b = (2,3)/CG/ZCG;

julia> IsIsomorphism( a + b )
false

julia> Lift( a + b, a ) * a == a + b
true

julia> IsLiftable( a + b, -2*a ); ## over Q this is liftable
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> #Incidence matrix of our proset
        K = [ [1, 1, 1], [0, 1, 1], [0, 1, 1] ];

julia> #Construction of a tower of categories
        CP_K = ProSetAsCategory( K );

julia> ZZZ = HomalgRingOfIntegers( );

julia> ZP_K = LinearClosure( ZZZ, CP_K, ReturnTrue );

julia> RowsP_K = AdditiveClosure( ZP_K );

julia> a = ProSetAsCategoryObject( 1, CP_K );

julia> b = ProSetAsCategoryObject( 2, CP_K );

julia> c = ProSetAsCategoryObject( 3, CP_K );

julia> #Three random objects in the additive closure
        #Such that there exists morphisms from A->B && B->C:
        rand_coef = List( (1):(5), i -> Random( (2):(20) ) );

julia> A1 = List( (1):(rand_coef[ 1 ]), i -> a );

julia> A2 = List( (1):(rand_coef[ 2 ]), i -> b );

julia> A = @Concatenation( A1, A2 );

julia> B1 = List( (1):(rand_coef[ 3 ]), i -> b );

julia> B2 = List( (1):(rand_coef[ 4 ]), i -> c );

julia> B =  @Concatenation( B1, B2 );

julia> C = List((1):(rand_coef[ 5 ]), i -> c);

julia> #A random lifting problem over ZP_K
        MA_B =  List( [ 1 .. rand_coef[ 1 ] + rand_coef[ 2 ] ], i ->
                    List( [ 1 .. rand_coef[ 3 ] + rand_coef[ 4 ] ], j ->
                        LinearClosureMorphism( LinearClosureObject( A[i], ZP_K ), [Random( (-20):(20) )], [ProSetAsCategoryMorphism( A[i], B[j] )], LinearClosureObject( B[j], ZP_K ) )
                        )
                      );

julia> alpha = MA_B/RowsP_K;

julia> MB_C =  List( [ 1 .. rand_coef[ 3 ] + rand_coef[ 4 ] ], i ->
                    List( (1):(rand_coef[ 5 ]), j ->
                        LinearClosureMorphism( LinearClosureObject( B[i], ZP_K ), [Random( (-20):(20) )], [ProSetAsCategoryMorphism( B[i], C[j] )], LinearClosureObject( C[j], ZP_K ) )
                        )
                     );

julia> beta = MB_C/RowsP_K;

julia> gamma = PreCompose( alpha, beta );

julia> lift = Lift( gamma, beta );

julia> PreCompose(lift, beta) == gamma
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> G = SymmetricGroup( 3 );

julia> CG = GroupAsCategory( G );

julia> ZZZ = HomalgRingOfIntegers( );

julia> ZCG = LinearClosure( ZZZ, CG );

julia> RowsG = AdditiveClosure( ZCG );

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> a = (1,2)/CG/ZCG;

julia> b = (2,3)/CG/ZCG;

julia> e = ()/CG/ZCG;

julia> omega = [ [ a - e ], [ b - e ] ]/RowsG;

julia> u = GroupAsCategoryUniqueObject( CG );

julia> v = LinearClosureObject( ZCG, u );

julia> u = AsAdditiveClosureObject( v );

julia> HomStructure( u, omega );

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> elem = Elements( G );

julia> elem = List( elem, x -> x/CG/ZCG );

julia> rand_elem = function() local coeffs; coeffs = List( (1):(6), i -> Random( (-20):(20) ) ); if ForAll( coeffs, IsZero ) then return ZeroMorphism( v, v ); end; return Sum( List( (1):(6), i -> Random( (-20):(20) ) * One( ZZZ ) * elem[i] ) ); end;

julia> mat10_11 = List( (1):(10), i ->
                List( (1):(11), j ->
                    rand_elem()
                )
            );

julia> mat11_12 = List( (1):(11), i ->
                List( (1):(12), j ->
                    rand_elem()
                )
            );

julia> alpha = mat10_11/RowsG;

julia> beta = mat11_12/RowsG;

julia> gamma = PreCompose( alpha, beta );

julia> lift = Lift( gamma, beta );

julia> PreCompose( lift, beta ) == gamma
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> true
true

julia> QQ = HomalgFieldOfRationals( );

julia> cols = CategoryOfColumns( QQ );

julia> rows = CategoryOfRows( QQ );

julia> object_constructor =
            ( cat, rank ) -> CreateCapCategoryObjectWithAttributes( cat,
                                                                    Opposite, CategoryOfRowsObject( Opposite( cat ), rank )
            );

julia> modeling_tower_object_constructor =
            ( cat, rank ) -> CreateCapCategoryObjectWithAttributes( ModelingCategory( cat ),
                                                                    RankOfObject, rank
            );

julia> object_datum = ( cat, obj ) -> RankOfObject( Opposite( obj ) );

julia> modeling_tower_object_datum = ( cat, obj ) -> RankOfObject( obj );

julia> morphism_constructor =
            ( cat, source, underlying_matrix, range ) ->
                CreateCapCategoryMorphismWithAttributes(
                    cat,
                    source, range,
                    Opposite, CategoryOfRowsMorphism(
                        Opposite( cat ),
                        Opposite( range ),
                        underlying_matrix,
                        Opposite( source )
                    )
                );

julia> modeling_tower_morphism_constructor =
            ( cat, source, underlying_matrix, range ) ->
                CreateCapCategoryMorphismWithAttributes(
                    ModelingCategory( cat ),
                    source, range,
                    UnderlyingMatrix, underlying_matrix
                );

julia> morphism_datum = ( cat, mor ) -> UnderlyingMatrix( Opposite( mor ) );

julia> modeling_tower_morphism_datum = ( cat, mor ) -> UnderlyingMatrix( mor );

julia> op = ReinterpretationOfCategory( cols, @rec(
            name = @Concatenation( "Opposite( ", Name( rows )," )" ),
            category_filter = WasCreatedAsOppositeCategory,
            category_object_filter = IsCapCategoryOppositeObject,
            category_morphism_filter = IsCapCategoryOppositeMorphism,
            object_constructor = object_constructor,
            object_datum = object_datum,
            morphism_constructor = morphism_constructor,
            morphism_datum = morphism_datum,
            modeling_tower_object_constructor = modeling_tower_object_constructor,
            modeling_tower_object_datum = modeling_tower_object_datum,
            modeling_tower_morphism_constructor = modeling_tower_morphism_constructor,
            modeling_tower_morphism_datum = modeling_tower_morphism_datum,
            only_primitive_operations = true,
        ) )
Opposite( Rows( Q ) )

julia> SetOpposite( op, rows )

julia> source = ObjectConstructor( op, 1 )
<An object in Opposite( Rows( Q ) )>

julia> range = ObjectConstructor( op, 2 )
<An object in Opposite( Rows( Q ) )>

julia> zero = ZeroMorphism( source, range )
<A morphism in Opposite( Rows( Q ) )>

julia> sum = AdditionForMorphisms( zero, zero )
<A morphism in Opposite( Rows( Q ) )>

julia> # notice that source && range are indeed swapped compared to the above
        Display( Opposite( sum ) )
Source: 
A row module over Q of rank 2

Matrix: 
[ [  0 ],
  [  0 ] ]

Range: 
A row module over Q of rank 1

A morphism in Rows( Q )

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgRingOfIntegers();

julia> rows = CategoryOfRows( R );

julia> adelman = AdelmanCategory( rows );

julia> rowobj = CategoryOfRowsObject( 1, rows );

julia> alpha = ProjectionInFactorOfDirectSum( [ rowobj, rowobj ], 1 );

julia> alpha = AsAdelmanCategoryMorphism( alpha );

julia> obj = CokernelObject( alpha );

julia> IsBijectiveObject( obj )
true

julia> beta = 2 * IdentityMorphism( rowobj );

julia> beta = AsAdelmanCategoryMorphism( beta );

julia> obj1 = CokernelObject( beta );

julia> obj2 = KernelObject( beta );

julia> obj3 = ImageObject( beta );

julia> obj4 = HomologyObject( beta, beta );

julia> IsBijectiveObject( obj1 )
false

julia> IsInjective( obj1 )
true

julia> ProjectiveDimension( obj1 )
2

julia> IsBijectiveObject( obj2 )
false

julia> IsProjective( obj2 )
true

julia> InjectiveDimension( obj2 )
2

julia> ProjectiveDimension( obj3 )
1

julia> InjectiveDimension( obj3 )
1

julia> ProjectiveDimension( obj4 )
2

julia> InjectiveDimension( obj4 )
2

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> K = [ [1, 1, 1], [0, 1, 1], [0, 1, 1] ];

julia> L = [ [1, 1, 0], [0, 1, 1], [0, 0, 1] ];

julia> P_K = ProSetAsCategory(K);

julia> #ProSetAsCategory(L)

julia> a = 1/P_K;

julia> b = ProSetAsCategoryObject(2, P_K);

julia> c = ProSetAsCategoryObject(3, P_K);

julia> d = ProSetAsCategoryObject(4, P_K);

julia> delta = ProSetAsCategoryMorphism(b, a);

julia> IsWellDefined(a)
true

julia> IsWellDefined(d)
false

julia> IsWellDefined(delta)
false

julia> alpha = ProSetAsCategoryMorphism(a, b);

julia> beta = ProSetAsCategoryMorphism(b, c);

julia> gamma = ProSetAsCategoryMorphism(a, c);

julia> gamma == PreCompose(alpha, beta)
true

julia> id_a = IdentityMorphism(a);

julia> IsWellDefined(Inverse(alpha))
false

julia> beta*Inverse(beta) == IdentityMorphism(b)
true

julia> alpha == Lift(gamma, beta)
true

julia> IsLiftable(beta, gamma)
false

julia> Colift(alpha, gamma) == beta
true

julia> alpha == HomStructure(a, b, HomStructure(alpha))
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> true
true

julia> R = HomalgRingOfIntegers( ) ;

julia> cat = CategoryOfColumns( R );

julia> A = RandomObjectByInteger( cat, 2 );

julia> B = RandomObjectByInteger( cat, 2 );

julia> mor1 = RandomMorphismByInteger( cat, 2 );

julia> mor2 = RandomMorphismWithFixedSourceByInteger( cat, CategoryOfColumnsObject( cat, 3 ), 2 );

julia> mor3 = RandomMorphismWithFixedRangeByInteger( cat, CategoryOfColumnsObject( cat, 3 ), 2 );

julia> mor4 = RandomMorphismWithFixedSourceAndRangeByInteger( cat, CategoryOfColumnsObject( cat, 3 ), CategoryOfColumnsObject( cat, 4 ), 2 );

julia> RankOfObject( Source( mor2 ) ) == 3
true

julia> RankOfObject( Range( mor3 ) ) == 3
true

julia> RankOfObject( Source( mor4 ) ) == 3
true

julia> RankOfObject( Range( mor4 ) ) == 4
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> true
true

julia> QQ = HomalgFieldOfRationalsInSingular( );

julia> QQxy = QQ * "x,y";

julia> EQQxy = KoszulDualRing( QQxy );

julia> R = KoszulDualRing( HomalgRingOfIntegersInSingular( ) * "x,y" );

julia> CAP_INTERNAL_GENERATE_DOCUMENTATION_FOR_CATEGORY_INSTANCES(
            [
                [ CategoryOfRows( R ), "CategoryOfRows of an arbitrary ring" ],
                [ CategoryOfRows( EQQxy ), "CategoryOfRows of an exterior algebra over a field" ],
                [ CategoryOfRows( QQxy ), "CategoryOfRows of a commutative ring" ],
                [ CategoryOfRows( QQ ), "CategoryOfRows of a field" ],
            ],
            "FreydCategoriesForCAP",
            "CategoryOfRows.autogen.gd",
            "Category of rows",
            "Supported CAP operations"
        )

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> F = HomalgRingOfIntegers( 3 );

julia> vec = CategoryOfRows( F );

julia> rel = RelCategory( vec );

julia> A = 1/vec/rel;

julia> id = IdentityMorphism( A );

julia> IsWellDefined( id )
true

julia> alpha = HomalgMatrix( "[ 1, 2 ]", 2, 1, F )/vec;

julia> alpha_rel = alpha/rel;

julia> alpha_rel_inv = rel/alpha;

julia> beta = PreCompose( alpha_rel_inv, alpha_rel );

julia> IsCongruentForMorphisms( beta, id )
true

julia> IsEqualForMorphisms( beta, id )
false

julia> R = HomalgFieldOfRationalsInSingular() * "t";

julia> t = IndeterminatesOfPolynomialRing( R )[1];

julia> cocycle = function( a, b, c ) local e; e = CoastrictionToImage( UniversalMorphismIntoDirectSum( [ ReversedArrow( c ), Arrow( c ) ] ) ); return t^RankOfObject( KernelObject( e ) ); end;

julia> T = TwistedLinearClosure( R, rel, cocycle );

julia> gamma = beta/T;

julia> delta = ZeroMorphism( 1/vec, 1/vec )/rel/T;

julia> IsZero( 3*gamma - 3*gamma )
true

julia> IsCongruentForMorphisms( delta, gamma )
false

julia> beta = PreCompose( alpha_rel_inv/T, alpha_rel/T );

julia> IsZero( beta - t * IdentityMorphism( Range( alpha_rel/T ) ) )
true

julia> IsZero( ( gamma * delta ) * gamma - gamma * ( delta * gamma ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> CR = RingAsCategory( Integers );

julia> u = RingAsCategoryUniqueObject( CR );

julia> alpha = 2 / CR
<2>

julia> IsOne( alpha )
false

julia> IsZero( alpha )
false

julia> alpha * alpha
<4>

julia> -alpha
<-2>

julia> IsZero( alpha + AdditiveInverse( alpha ) )
true

julia> beta = RingAsCategoryMorphism( 1/2, CR );

julia> IsWellDefined( beta )
false

julia> gamma = IdentityMorphism( u )
<1>

julia> IsOne( gamma )
true

julia> delta = ZeroMorphism( u, u )
<0>

julia> IsZero( delta )
true

julia> 2 * alpha
<4>

julia> Lift( alpha * alpha, alpha )
<2>

julia> Colift( alpha, alpha * alpha )
<2>

julia> BasisOfExternalHom( u, u )
[ <1> ]

julia> CoefficientsOfMorphism( alpha )
[ 2 ]

julia> IsCongruentForMorphisms( alpha, LinearCombinationOfMorphisms( u, CoefficientsOfMorphism( alpha ), BasisOfExternalHom( u, u ), u ) )
true

julia> EEE = KoszulDualRing( HomalgFieldOfRationalsInSingular( ) * "x,y" );

julia> CE = RingAsCategory( EEE );

julia> u = RingAsCategoryUniqueObject( CE );

julia> alpha = ("2 + 3 * e0 + 4 * e1 + 5 * e0*e1" / EEE) / CE
<5*e0*e1+3*e0+4*e1+2>

julia> IsOne( alpha )
false

julia> IsZero( alpha )
false

julia> alpha * alpha
<20*e0*e1+12*e0+16*e1+4>

julia> -alpha
<-5*e0*e1-3*e0-4*e1-2>

julia> IsZero( alpha + AdditiveInverse( alpha ) )
true

julia> gamma = IdentityMorphism( u )
<1>

julia> IsOne( gamma )
true

julia> delta = ZeroMorphism( u, u )
<0>

julia> IsZero( delta )
true

julia> 2 * alpha
<10*e0*e1+6*e0+8*e1+4>

julia> Lift( alpha * alpha, alpha )
<5*e0*e1+3*e0+4*e1+2>

julia> Colift( alpha, alpha * alpha )
<5*e0*e1+3*e0+4*e1+2>

julia> basis = BasisOfExternalHom( u, u )
[ <1>, <e0>, <e1>, <e0*e1> ]

julia> coeffs = CoefficientsOfMorphism( alpha )
[ 2, 3, 4, 5 ]

julia> IsCongruentForMorphisms( alpha, LinearCombinationOfMorphisms( u, coeffs, basis, u ) )
true

julia> u_op = Opposite( u )
<An object in Opposite( RingAsCategory( Q[e0,e1] ) )>

julia> alpha_op = Opposite( alpha )
<A morphism in Opposite( RingAsCategory( Q[e0,e1] ) )>

julia> basis = BasisOfExternalHom( u_op, u_op );

julia> coeffs = CoefficientsOfMorphism( alpha_op )
[ 2, 3, 4, 5 ]

julia> IsCongruentForMorphisms( alpha_op, LinearCombinationOfMorphisms( u_op, coeffs, basis, u_op ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Q = HomalgFieldOfRationalsInSingular();

julia> S = GradedRing( Q * "x_1, x_2" );

julia> SetWeightsOfIndeterminates( S, [[1],[1]] );

julia> Module = AsFreydCategoryObject( GradedRow( [[[1],1]], S ) )
<An object in Category of f.p. graded left modules over Q[x_1,x_2] (with weights [ 1, 1 ])>

julia> IsFpGradedLeftOrRightModulesObject( Module )
true

julia> mor = AsFreydCategoryMorphism( IdentityMorphism( GradedRow( [[[1],1]], S ) ) )
<A morphism in Category of f.p. graded left modules over Q[x_1,x_2] (with weights [ 1, 1 ])>

julia> IsFpGradedLeftOrRightModulesMorphism( mor )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Q = HomalgFieldOfRationalsInSingular()
Q

julia> S = GradedRing( Q * "x_1, x_2, x_3, x_4" )
Q[x_1,x_2,x_3,x_4]
(weights: yet unset)

julia> SetWeightsOfIndeterminates( S, [[1,0],[1,0],[0,1],[0,1]] )


julia> cat = CategoryOfGradedRows( S )
Category of graded rows over Q[x_1,x_2,x_3,x_4] 
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])

julia> obj1 = GradedRow( [ [[1,1],1] ], S )
<A graded row of rank 1>

julia> obj2 = GradedRow( [ [[1,1],2] ], S )
<A graded row of rank 2>

julia> gamma = GradedRowOrColumnMorphism( obj2, 
                               HomalgMatrix( [ [ 1, 1 ], [ 1, 1 ] ], 2, 2, S ), obj2 )
<A morphism in Category of graded rows over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> freyd = FreydCategory( cat )
Category of f.p. graded left modules over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])

julia> IsAbelianCategory( freyd )
true

julia> obj_gamma = FreydCategoryObject( gamma )
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsFpGradedLeftOrRightModulesObject( obj_gamma )
true

julia> f = FreydCategoryMorphism( obj_gamma, gamma, obj_gamma )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsFpGradedLeftOrRightModulesMorphism( f )
true

julia> witness = MorphismWitness( f )
<A morphism in Category of graded rows over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> g = FreydCategoryMorphism( obj_gamma, 
                                           ZeroMorphism( obj2, obj2 ), obj_gamma )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsCongruentForMorphisms( f, g )
true

julia> c = PreCompose( f, f )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> s = g + g
<A morphism in Category of f.p. graded left modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> a = GradedRowOrColumnMorphism( obj1, 
                                         HomalgMatrix( [ [ 2 ] ], 1, 1, S ), obj1 )
<A morphism in Category of graded rows over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Z2 = FreydCategoryObject( a )
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> id = IdentityMorphism( Z2 )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> z = id + id + id
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> d = DirectSumFunctorial( [ z, z, z ] )
<A morphism in Category of f.p. graded left modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> pr2 = ProjectionInFactorOfDirectSum( [ Z2, Z2, Z2 ], 2 )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> pr3 = ProjectionInFactorOfDirectSum( [ Z2, Z2, Z2 ], 3 )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> uni = UniversalMorphismIntoDirectSum( [ pr3, pr2 ] )
<A morphism in Category of f.p. graded left modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> inj1 = InjectionOfCofactorOfDirectSum( [ Z2, Z2, Z2 ], 1 )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> inj2 = InjectionOfCofactorOfDirectSum( [ Z2, Z2, Z2 ], 2 )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> uni2 = UniversalMorphismFromDirectSum( [ inj2, inj1 ] )
<A morphism in Category of f.p. graded left modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> ZFree = AsFreydCategoryObject( obj1 )
<An object in Category of f.p. graded left modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> id = IdentityMorphism( ZFree )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> z = id + id
<A morphism in Category of f.p. graded left modules over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> coker_proj = CokernelProjection( z )
<A morphism in Category of f.p. graded left modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> cokernel_colift = CokernelColift( z, CokernelProjection( z ) )
<A morphism in Category of f.p. graded left modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> a = ZFree
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> b = obj_gamma
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> c = TensorProductOnObjects( ZFree, obj_gamma )
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> KaxbKxc = TensorProductOnObjects( TensorProductOnObjects( a, b ), c )
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsEqualForObjects( KaxbKxc, ZeroObject( freyd ) )
false

julia> tensor_product_morphism = TensorProductOnMorphisms( cokernel_colift, coker_proj )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsEpimorphism( tensor_product_morphism )
true

julia> IsEqualForObjects( Source( tensor_product_morphism ), Range( tensor_product_morphism ) )
false

julia> unit = TensorUnit( freyd )
<An object in Category of f.p. graded left modules over Q[x_1,x_2,x_3,x_4] 
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsEqualForObjects( TensorProductOnObjects( a, unit ), a )
true

julia> axKbxcK = TensorProductOnObjects( a, TensorProductOnObjects( b, c ) )
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> ass_left_to_right = AssociatorLeftToRightWithGivenTensorProducts( KaxbKxc, a, b, c, axKbxcK )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsIsomorphism( ass_left_to_right )
true

julia> ass_right_to_left = AssociatorLeftToRightWithGivenTensorProducts( axKbxcK, a, b, c, KaxbKxc )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsMonomorphism( ass_right_to_left )
true

julia> IsEpimorphism( ass_right_to_left )
true

julia> LeftUnitor( a )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> LeftUnitorInverse( axKbxcK )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> RightUnitor( b )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> RightUnitorInverse( TensorProductOnObjects( axKbxcK, axKbxcK ) )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> Braiding( axKbxcK, KaxbKxc )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> braiding = Braiding( a, b )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( braiding )
true

julia> hom = InternalHomOnObjects( axKbxcK, axKbxcK )
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsZero( hom )
false

julia> free_mod1 = AsFreydCategoryObject( GradedRow( [ [[0,0],1] ], S ) )
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> free_mod2 = AsFreydCategoryObject( GradedRow( [ [[1,1],1] ], S ) )
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> hom2 = InternalHomOnObjects( free_mod1, free_mod2 )
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsZero( hom2 )
false

julia> IsZero( Source( RelationMorphism( hom2 ) ) )
true

julia> Rank( Range( RelationMorphism( hom2 ) ) )
1

julia> hom3 = InternalHomOnObjects( free_mod2, free_mod1 )
<An object in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsZero( hom3 )
false

julia> InternalHomOnMorphisms( ass_left_to_right, ass_right_to_left )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> eval = ClosedMonoidalLeftEvaluationMorphism( a, b )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsEpimorphism( eval )
true

julia> IsMonomorphism( eval )
true

julia> coeval = ClosedMonoidalLeftCoevaluationMorphism( a, b )
<A morphism in Category of f.p. graded left modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsEpimorphism( coeval )
true

julia> IsMonomorphism( coeval )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Q = HomalgFieldOfRationalsInSingular()
Q

julia> S = GradedRing( Q * "x_1, x_2, x_3, x_4" )
Q[x_1,x_2,x_3,x_4]
(weights: yet unset)

julia> SetWeightsOfIndeterminates( S, [[1,0],[1,0],[0,1],[0,1]] )


julia> cat = CategoryOfGradedColumns( S )
Category of graded columns over Q[x_1,x_2,x_3,x_4] 
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])

julia> obj1 = GradedColumn( [ [[1,1],1] ], S )
<A graded column of rank 1>

julia> obj2 = GradedColumn( [ [[1,1],2] ], S )
<A graded column of rank 2>

julia> gamma = GradedRowOrColumnMorphism( obj2, 
                               HomalgMatrix( [ [ 1, 1 ], [ 1, 1 ] ], 2, 2, S ), obj2 )
<A morphism in Category of graded columns over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> freyd = FreydCategory( cat )
Category of f.p. graded right modules over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])

julia> IsAbelianCategory( freyd )
true

julia> obj_gamma = FreydCategoryObject( gamma )
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> f = FreydCategoryMorphism( obj_gamma, gamma, obj_gamma )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> witness = MorphismWitness( f )
<A morphism in Category of graded columns over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> g = FreydCategoryMorphism( obj_gamma, 
                                           ZeroMorphism( obj2, obj2 ), obj_gamma )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsCongruentForMorphisms( f, g )
true

julia> c = PreCompose( f, f )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> s = g + g
<A morphism in Category of f.p. graded right modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> a = GradedRowOrColumnMorphism( obj1, 
                                         HomalgMatrix( [ [ 2 ] ], 1, 1, S ), obj1 )
<A morphism in Category of graded columns over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Z2 = FreydCategoryObject( a )
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> id = IdentityMorphism( Z2 )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> z = id + id + id
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> d = DirectSumFunctorial( [ z, z, z ] )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> pr2 = ProjectionInFactorOfDirectSum( [ Z2, Z2, Z2 ], 2 )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> pr3 = ProjectionInFactorOfDirectSum( [ Z2, Z2, Z2 ], 3 )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> uni = UniversalMorphismIntoDirectSum( [ pr3, pr2 ] )
<A morphism in Category of f.p. graded right modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> inj1 = InjectionOfCofactorOfDirectSum( [ Z2, Z2, Z2 ], 1 )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> inj2 = InjectionOfCofactorOfDirectSum( [ Z2, Z2, Z2 ], 2 )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> uni2 = UniversalMorphismFromDirectSum( [ inj2, inj1 ] )
<A morphism in Category of f.p. graded right modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> ZFree = AsFreydCategoryObject( obj1 )
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> id = IdentityMorphism( ZFree )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> z = id + id
<A morphism in Category of f.p. graded right modules over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> coker_proj = CokernelProjection( z )
<A morphism in Category of f.p. graded right modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> cokernel_colift = CokernelColift( z, CokernelProjection( z ) )
<A morphism in Category of f.p. graded right modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> a = ZFree
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> b = obj_gamma
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> c = TensorProductOnObjects( a, b )
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> KaxbKxc = TensorProductOnObjects( TensorProductOnObjects( a, b ), c )
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsEqualForObjects( KaxbKxc, ZeroObject( freyd ) )
false

julia> tensor_product_morphism = TensorProductOnMorphisms( cokernel_colift, coker_proj )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsEpimorphism( tensor_product_morphism )
true

julia> IsEqualForObjects( Source( tensor_product_morphism ), Range( tensor_product_morphism ) )
false

julia> unit = TensorUnit( freyd )
<An object in Category of f.p. graded right modules over Q[x_1,x_2,x_3,x_4] 
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsEqualForObjects( TensorProductOnObjects( a, unit ), a )
true

julia> axKbxcK = TensorProductOnObjects( a, TensorProductOnObjects( b, c ) )
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> ass_left_to_right = AssociatorLeftToRightWithGivenTensorProducts( KaxbKxc, a, b, c, axKbxcK )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsIsomorphism( ass_left_to_right )
true

julia> ass_right_to_left = AssociatorLeftToRightWithGivenTensorProducts( axKbxcK, a, b, c, KaxbKxc )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsMonomorphism( ass_right_to_left )
true

julia> IsEpimorphism( ass_right_to_left )
true

julia> LeftUnitor( a )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> LeftUnitorInverse( axKbxcK )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> RightUnitor( b )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> RightUnitorInverse( TensorProductOnObjects( axKbxcK, axKbxcK ) )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> Braiding( axKbxcK, KaxbKxc )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> braiding = Braiding( a, b )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( braiding )
true

julia> hom = InternalHomOnObjects( axKbxcK, axKbxcK )
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsZero( hom )
false

julia> free_mod1 = AsFreydCategoryObject( GradedColumn( [ [[0,0],1] ], S ) )
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> free_mod2 = AsFreydCategoryObject( GradedColumn( [ [[1,1],1] ], S ) )
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> hom2 = InternalHomOnObjects( free_mod1, free_mod2 )
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsZero( hom2 )
false

julia> IsZero( Source( RelationMorphism( hom2 ) ) )
true

julia> Rank( Range( RelationMorphism( hom2 ) ) )
1

julia> hom3 = InternalHomOnObjects( free_mod2, free_mod1 )
<An object in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsZero( hom3 )
false

julia> InternalHomOnMorphisms( ass_left_to_right, ass_right_to_left )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> eval = ClosedMonoidalLeftEvaluationMorphism( a, b )
<A morphism in Category of f.p. graded right modules over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsEpimorphism( eval )
true

julia> IsMonomorphism( eval )
true

julia> coeval = ClosedMonoidalLeftCoevaluationMorphism( a, b )
<A morphism in Category of f.p. graded right modules over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsEpimorphism( coeval )
true

julia> IsMonomorphism( coeval )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Q = HomalgFieldOfRationalsInSingular()
Q

julia> S = GradedRing( Q * "x_1, x_2, x_3, x_4" )
Q[x_1,x_2,x_3,x_4]
(weights: yet unset)

julia> SetWeightsOfIndeterminates( S, [[1,0],[1,0],[0,1],[0,1]] )


julia> ObjectL = GradedRow( [ [[1,0],2] ], S )
<A graded row of rank 2>

julia> DegreeList( ObjectL )
[ [ ( 1, 0 ), 2 ] ]

julia> Object2L = GradedRow( [ [[1,0],2], 
                   [[1,0],3],[[0,1],2],[[1,0],1] ], S )
<A graded row of rank 8>

julia> DegreeList( Object2L )
[ [ ( 1, 0 ), 5 ], [ ( 0, 1 ), 2 ], [ ( 1, 0 ), 1 ] ]

julia> UnzipDegreeList( Object2L )
[ ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 0, 1 ), ( 0, 1 ), ( 1, 0 ) ]

julia> ObjectR = GradedColumn( [ [[1,0],2] ], S )
<A graded column of rank 2>

julia> DegreeList( ObjectR )
[ [ ( 1, 0 ), 2 ] ]

julia> Object2R = GradedColumn( [ [[1,0],2], 
                   [[1,0],3],[[0,1],2],[[1,0],1] ], S )
<A graded column of rank 8>

julia> DegreeList( Object2R )
[ [ ( 1, 0 ), 5 ], [ ( 0, 1 ), 2 ], [ ( 1, 0 ), 1 ] ]

julia> UnzipDegreeList( Object2R )
[ ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 0, 1 ), ( 0, 1 ), ( 1, 0 ) ]

julia> S2 = GradedRing( Q * "x" );

julia> SetWeightsOfIndeterminates( S2, [ 1 ] );

julia> IsWellDefined( GradedRow( [ [ [ 1 ], 1 ] ], S2 ) )
true

julia> IsWellDefined( GradedColumn( [ [ [ 1 ], 1 ] ], S2 ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Object2LShuffle = GradedRow( [ [[0,1],1],
                   [[1,0],2],[[0,1],1],[[1,0],4] ], S )
<A graded row of rank 8>

julia> IsEqualForObjects( Object2L, Object2LShuffle )
false

julia> Object2RShuffle = GradedColumn( [ [[0,1],1],
                   [[1,0],2],[[0,1],1],[[1,0],4] ], S )
<A graded column of rank 8>

julia> IsEqualForObjects( Object2R, Object2RShuffle )
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Q1L = GradedRow( [ [[0,0],1] ], S )
<A graded row of rank 1>

julia> IsWellDefined( Q1L )
true

julia> Q2L = GradedRow( [ [[1,0],2] ], S )
<A graded row of rank 2>

julia> m1L = GradedRowOrColumnMorphism( 
              Q1L, HomalgMatrix( [["x_1","x_2"]], S ) ,Q2L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( m1L )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Q1R = GradedColumn( [ [[0,0],1] ], S )
<A graded column of rank 1>

julia> IsWellDefined( Q1R )
true

julia> Q2R = GradedColumn( [ [[1,0],2] ], S )
<A graded column of rank 2>

julia> m1R = GradedRowOrColumnMorphism( 
              Q1R, HomalgMatrix( [["x_1"],["x_2"]], S ) ,Q2R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( m1R )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> categoryL = CapCategory( Q1L )
Category of graded rows over Q[x_1,x_2,x_3,x_4] 
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])

julia> categoryR = CapCategory( Q1R )
Category of graded columns over Q[x_1,x_2,x_3,x_4] 
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> ZeroObject( categoryL )
<A graded row of rank 0>

julia> O1L = GradedRow( [ [[-1,0],2] ], S )
<A graded row of rank 2>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> O2L = GradedRow( [ [[0,0],1] ], S )
<A graded row of rank 1>

julia> obj3L = GradedRow( [ [[-1,0],1] ], S )
<A graded row of rank 1>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> IsWellDefined( IdentityMorphism( Q2L ) )
true

julia> directSumL = DirectSum( [ O1L, O2L ] )
<A graded row of rank 3>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> i1L = InjectionOfCofactorOfDirectSum( [ O1L, O2L ], 1 )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( i1L )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> i2L = InjectionOfCofactorOfDirectSum( [ O1L, O2L ], 2 )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ],[ 0, 1 ] ])>

julia> IsWellDefined( i2L )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> proj1L = ProjectionInFactorOfDirectSum( [ O1L, O2L ], 1 )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( proj1L )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> proj2L = ProjectionInFactorOfDirectSum( [ O1L, O2L ], 2 )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( proj2L )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> kL = WeakKernelEmbedding( proj1L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( kL )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> ckL = WeakCokernelProjection( kL )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( ckL )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> IsMonomorphism( kL )
true

julia> IsEpimorphism( kL )
false

julia> IsMonomorphism( ckL )
false

julia> IsEpimorphism( ckL )
true

julia> m1L = GradedRowOrColumnMorphism( O1L, 
              HomalgMatrix( [[ "x_1" ], [ "x_2" ]], S ), O2L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( m1L )
true

julia> m2L = IdentityMorphism( O2L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( m2L )
true

julia> obj1L = GradedRow( [ [[0,0],1], [[-1,0],1] ], S )
<A graded row of rank 2>

julia> m1L = GradedRowOrColumnMorphism( obj1L, 
              HomalgMatrix( [[ 1 ], [ "x_2"] ], S ), O2L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( m1L )
true

julia> m3L = GradedRowOrColumnMorphism( obj3L, 
              HomalgMatrix( [[ "x_1" ]], S ), O2L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( m3L )
true

julia> liftL = Lift( m3L, m1L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( liftL )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> O3L = GradedRow( [ [[1,0],2] ], S )
<A graded row of rank 2>

julia> morL = GradedRowOrColumnMorphism( 
               O2L, HomalgMatrix( [[ "x_1, x_2" ]], S ), O3L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( morL )
true

julia> coliftL = Colift( m2L, morL )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( coliftL )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> fpL = WeakBiFiberProduct( m1L, m2L )
<A graded row of rank 2>

julia> fp_proj1L = ProjectionInFirstFactorOfWeakBiFiberProduct( m1L, m2L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( fp_proj1L )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> fp_proj2L = ProjectionInSecondFactorOfWeakBiFiberProduct( m1L, m2L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( fp_proj2L )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> BiasedWeakFiberProduct( m1L, m2L )
<A graded row of rank 2>

julia> pbwfprow = ProjectionOfBiasedWeakFiberProduct( m1L, m2L )
<A morphism in Category of graded rows over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( pbwfprow )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> poL = WeakBiPushout( morL, m2L )
<A graded row of rank 2>

julia> inj1L = InjectionOfFirstCofactorOfWeakBiPushout( morL, m2L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( inj1L )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> inj2L = InjectionOfSecondCofactorOfWeakBiPushout( morL, m2L )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( inj2L )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> injectionL = InjectionOfBiasedWeakPushout( morL, m2L )
<A morphism in Category of graded rows over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( injectionL )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> tensorProductL = TensorProductOnObjects( O1L, O2L )
<A graded row of rank 2>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> tensorProductMorphismL = TensorProductOnMorphisms( m2L, morL )
<A morphism in Category of graded rows over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( tensorProductMorphismL )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> IsWellDefined( DualOnMorphisms( m1L ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> IsWellDefined( EvaluationForDualWithGivenTensorProduct( TensorProductOnObjects( 
        DualOnObjects( ObjectL ), ObjectL ), ObjectL, TensorUnit( categoryL ) ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> ZeroObject( categoryR )
<A graded column of rank 0>

julia> O1R = GradedColumn( [ [[-1,0],2] ], S )
<A graded column of rank 2>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> O2R = GradedColumn( [ [[0,0],1] ], S )
<A graded column of rank 1>

julia> obj3R = GradedColumn( [ [[-1,0],1] ], S )
<A graded column of rank 1>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> IsWellDefined( IdentityMorphism( Q2R ) )
true

julia> directSumR = DirectSum( [ O1R, O2R ] )
<A graded column of rank 3>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> i1R = InjectionOfCofactorOfDirectSum( [ O1R, O2R ], 1 )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( i1R )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> i2R = InjectionOfCofactorOfDirectSum( [ O1R, O2R ], 2 )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ],[ 0, 1 ] ])>

julia> IsWellDefined( i2R )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> proj1R = ProjectionInFactorOfDirectSum( [ O1R, O2R ], 1 )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( proj1R )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> proj2R = ProjectionInFactorOfDirectSum( [ O1R, O2R ], 2 )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( proj2R )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> kR = WeakKernelEmbedding( proj1R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( kR )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> ckR = WeakCokernelProjection( kR )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( ckR )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> IsMonomorphism( kR )
true

julia> IsEpimorphism( kR )
false

julia> IsMonomorphism( ckR )
false

julia> IsEpimorphism( ckR )
true

julia> m1R = GradedRowOrColumnMorphism( O1R, 
              HomalgMatrix( [[ "x_1", "x_2" ]], S ), O2R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( m1R )
true

julia> m2R = IdentityMorphism( O2R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( m2R )
true

julia> obj1R = GradedColumn( [ [[0,0],1], [[-1,0],1] ], S )
<A graded column of rank 2>

julia> m1R = GradedRowOrColumnMorphism( obj1R, 
              HomalgMatrix( [ [ 1, "x_2"] ], S ), O2R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( m1R )
true

julia> m3R = GradedRowOrColumnMorphism( obj3R, 
              HomalgMatrix( [[ "x_1" ]], S ), O2R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( m3R )
true

julia> liftR = Lift( m3R, m1R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( liftR )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> O3R = GradedColumn( [ [[1,0],2] ], S )
<A graded column of rank 2>

julia> morR = GradedRowOrColumnMorphism( 
               O2R, HomalgMatrix( [[ "x_1" ], [ "x_2" ]], S ), O3R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( morR )
true

julia> coliftR = Colift( m2R, morR )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( coliftR )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> fpR = WeakBiFiberProduct( m1R, m2R )
<A graded column of rank 2>

julia> fp_proj1R = ProjectionInFirstFactorOfWeakBiFiberProduct( m1R, m2R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( fp_proj1R )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> fp_proj2R = ProjectionInSecondFactorOfWeakBiFiberProduct( m1R, m2R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( fp_proj2R )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> BiasedWeakFiberProduct( m1R, m2R )
<A graded column of rank 2>

julia> pbwfpcol = ProjectionOfBiasedWeakFiberProduct( m1R, m2R )
<A morphism in Category of graded columns over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( pbwfpcol )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> poR = WeakBiPushout( morR, m2R )
<A graded column of rank 2>

julia> inj1R = InjectionOfFirstCofactorOfWeakBiPushout( morR, m2R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( inj1R )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> inj2R = InjectionOfSecondCofactorOfWeakBiPushout( morR, m2R )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( inj2R )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> injectionR = InjectionOfBiasedWeakPushout( morR, m2R )
<A morphism in Category of graded columns over
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( injectionR )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> tensorProductR = TensorProductOnObjects( O1R, O2R )
<A graded column of rank 2>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> tensorProductMorphismR = TensorProductOnMorphisms( m2R, morR )
<A morphism in Category of graded columns over 
Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>

julia> IsWellDefined( tensorProductMorphismR )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> IsWellDefined( DualOnMorphisms( m1R ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> IsWellDefined( EvaluationForDualWithGivenTensorProduct( TensorProductOnObjects( 
        DualOnObjects( ObjectR ), ObjectR ), ObjectR, TensorUnit( categoryR ) ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> aR = GradedRow( [ [ [1,0], 1 ] ], S )
<A graded row of rank 1>

julia> bR = ZeroObject( CapCategory( aR ) )
<A graded row of rank 0>

julia> coevR = CoevaluationForDual( bR )
<A morphism in Category of graded rows over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( coevR )
true

julia> evalR = EvaluationForDual( bR )
<A morphism in Category of graded rows over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( evalR )
true

julia> cR = GradedRow( [ [ [2,0], 1 ] ], S )
<A graded row of rank 1>

julia> aR_o_bR = TensorProductOnObjects( aR, bR )
<A graded row of rank 0>

julia> phiR = ZeroMorphism( aR_o_bR, cR )
<A morphism in Category of graded rows over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( phiR )
true

julia> tens_mor = TensorProductToInternalHomLeftAdjunctMorphism(aR,bR,phiR)
<A morphism in Category of graded rows over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( tens_mor )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> aC = GradedColumn( [ [ [1,0], 1 ] ], S )
<A graded column of rank 1>

julia> bC = ZeroObject( CapCategory( aC ) )
<A graded column of rank 0>

julia> coevC = CoevaluationForDual( bC )
<A morphism in Category of graded columns over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( coevC )
true

julia> evalC = EvaluationForDual( bC )
<A morphism in Category of graded columns over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( evalC )
true

julia> cC = GradedColumn( [ [ [2,0], 1 ] ], S )
<A graded column of rank 1>

julia> aC_o_bC = TensorProductOnObjects( aC, bC )
<A graded column of rank 0>

julia> phiC = ZeroMorphism( aC_o_bC, cC )
<A morphism in Category of graded columns over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( phiC )
true

julia> tens_mor = TensorProductToInternalHomLeftAdjunctMorphism(aC,bC,phiC)
<A morphism in Category of graded columns over Q[x_1,x_2,x_3,x_4]
(with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>

julia> IsWellDefined( tens_mor )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> S = GradedRing( Q * "x,y" )
Q[x,y]
(weights: yet unset)

julia> SetWeightsOfIndeterminates( S, [ 1, 1 ] )

julia> mat_1 = HomalgMatrix( "[ x, 0, 0, y ]", 2, 2, S )
<A 2 x 2 matrix over a graded ring>

julia> mat_2 = HomalgMatrix( "[ x, 0, 0, 0 ]", 2, 2, S )
<A 2 x 2 matrix over a graded ring>

julia> a = GradedRow( [ [ [ 1 ], 1 ], [ [ 2 ], 1 ] ], S )
<A graded row of rank 2>

julia> b = GradedColumn( [ [ [ 1 ], 1 ], [ [ 2 ], 1 ] ], S )
<A graded column of rank 2>

julia> map = DeduceMapFromMatrixAndRangeForGradedRows( mat_1, a )
<A morphism in Category of graded rows over Q[x,y] (with weights [ 1, 1 ])>

julia> some_map = DeduceSomeMapFromMatrixAndRangeForGradedRows( mat_1, a )
<A morphism in Category of graded rows over Q[x,y] (with weights [ 1, 1 ])>

julia> IsEqualForMorphisms( map, some_map )
true

julia> map = DeduceMapFromMatrixAndSourceForGradedRows( mat_1, a )
<A morphism in Category of graded rows over Q[x,y] (with weights [ 1, 1 ])>

julia> some_map = DeduceSomeMapFromMatrixAndSourceForGradedRows( mat_1, a )
<A morphism in Category of graded rows over Q[x,y] (with weights [ 1, 1 ])>

julia> IsEqualForMorphisms( map, some_map )
true

julia> some_map = DeduceSomeMapFromMatrixAndRangeForGradedRows( mat_2, a )
<A morphism in Category of graded rows over Q[x,y] (with weights [ 1, 1 ])>

julia> IsWellDefined( some_map )
true

julia> some_map = DeduceSomeMapFromMatrixAndSourceForGradedRows( mat_2, a )
<A morphism in Category of graded rows over Q[x,y] (with weights [ 1, 1 ])>

julia> IsWellDefined( some_map )
true

julia> map = DeduceMapFromMatrixAndRangeForGradedCols( mat_1, b )
<A morphism in Category of graded columns over Q[x,y] (with weights [ 1, 1 ])>

julia> some_map = DeduceSomeMapFromMatrixAndRangeForGradedCols( mat_1, b )
<A morphism in Category of graded columns over Q[x,y] (with weights [ 1, 1 ])>

julia> IsEqualForMorphisms( map, some_map )
true

julia> map = DeduceMapFromMatrixAndSourceForGradedCols( mat_1, b )
<A morphism in Category of graded columns over Q[x,y] (with weights [ 1, 1 ])>

julia> some_map = DeduceSomeMapFromMatrixAndSourceForGradedCols( mat_1, b )
<A morphism in Category of graded columns over Q[x,y] (with weights [ 1, 1 ])>

julia> IsEqualForMorphisms( map, some_map )
true

julia> some_map = DeduceSomeMapFromMatrixAndRangeForGradedCols( mat_2, b )
<A morphism in Category of graded columns over Q[x,y] (with weights [ 1, 1 ])>

julia> IsWellDefined( some_map )
true

julia> some_map = DeduceSomeMapFromMatrixAndSourceForGradedCols( mat_2, b )
<A morphism in Category of graded columns over Q[x,y] (with weights [ 1, 1 ])>

julia> IsWellDefined( some_map )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Q = HomalgFieldOfRationals();

julia> RowsQ = CategoryOfRows( Q );

julia> a = 3/RowsQ;

julia> b = 4/RowsQ;

julia> HasIsProjective( a ) && IsProjective( a )
true

julia> homalg_matrix = HomalgMatrix( [ [ 1, 0, 0, 0 ],
                                          [ 0, 1, 0, -1 ],
                                          [ -1, 0, 2, 1 ] ], 3, 4, Q );

julia> alpha = homalg_matrix/RowsQ;

julia> homalg_matrix = HomalgMatrix( [ [ 1, 1, 0, 0 ],
                                          [ 0, 1, 0, -1 ],
                                          [ -1, 0, 2, 1 ] ], 3, 4, Q );

julia> beta = homalg_matrix/RowsQ;

julia> IsWellDefined( CokernelObject( alpha ) )
true

julia> c = CokernelProjection( alpha );

julia> gamma = UniversalMorphismIntoDirectSum( [ c, c ] );

julia> colift = CokernelColift( alpha, gamma );

julia> IsEqualForMorphisms( PreCompose( c, colift ), gamma )
true

julia> FiberProduct( alpha, beta );

julia> F = FiberProduct( alpha, beta );

julia> IsWellDefined( F )
true

julia> IsWellDefined( ProjectionInFactorOfFiberProduct( [ alpha, beta ], 1 ) )
true

julia> IsWellDefined( Pushout( alpha, beta ) )
true

julia> i1 = InjectionOfCofactorOfPushout( [ alpha, beta ], 1 );

julia> i2 = InjectionOfCofactorOfPushout( [ alpha, beta ], 2 );

julia> u = UniversalMorphismFromDirectSum( [ b, b ], [ i1, i2 ] );

julia> KernelObjectFunctorial( u, IdentityMorphism( Source( u ) ), u ) == IdentityMorphism( 3/RowsQ )
true

julia> IsZero( CokernelObjectFunctorial( u, IdentityMorphism( Range( u ) ), u ) )
true

julia> DirectProductFunctorial( [ u, u ] ) == DirectSumFunctorial( [ u, u ] )
true

julia> CoproductFunctorial( [ u, u ] ) == DirectSumFunctorial( [ u, u ] )
true

julia> IsOne( FiberProductFunctorial( [ u, u ], [ IdentityMorphism( Source( u ) ), IdentityMorphism( Source( u ) ) ], [ u, u ] ) )
true

julia> IsOne( PushoutFunctorial( [ u, u ], [ IdentityMorphism( Range( u ) ), IdentityMorphism( Range( u ) ) ], [ u, u ] ) )
true

julia> IsCongruentForMorphisms( (1/2) * alpha, alpha * (1/2) )
true

julia> RankOfObject( HomomorphismStructureOnObjects( a, b ) ) == RankOfObject( a ) * RankOfObject( b )
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

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> Q = HomalgFieldOfRationals();

julia> ColsQ = CategoryOfColumns( Q );

julia> a = 3/ColsQ;

julia> b = 4/ColsQ;

julia> HasIsProjective( a ) && IsProjective( a )
true

julia> homalg_matrix = HomalgMatrix( [ [ 1, 0, 0, 0 ],
                                          [ 0, 1, 0, -1 ],
                                          [ -1, 0, 2, 1 ] ], 3, 4, Q );

julia> homalg_matrix = TransposedMatrix( homalg_matrix );

julia> alpha = homalg_matrix/ColsQ;

julia> homalg_matrix = HomalgMatrix( [ [ 1, 1, 0, 0 ],
                                          [ 0, 1, 0, -1 ],
                                          [ -1, 0, 2, 1 ] ], 3, 4, Q );

julia> homalg_matrix = TransposedMatrix( homalg_matrix );

julia> beta = homalg_matrix/ColsQ;

julia> IsWellDefined( CokernelObject( alpha ) )
true

julia> c = CokernelProjection( alpha );

julia> gamma = UniversalMorphismIntoDirectSum( [ c, c ] );

julia> colift = CokernelColift( alpha, gamma );

julia> IsEqualForMorphisms( PreCompose( c, colift ), gamma )
true

julia> FiberProduct( alpha, beta );

julia> F = FiberProduct( alpha, beta );

julia> IsWellDefined( F )
true

julia> IsWellDefined( ProjectionInFactorOfFiberProduct( [ alpha, beta ], 1 ) )
true

julia> IsWellDefined( Pushout( alpha, beta ) )
true

julia> i1 = InjectionOfCofactorOfPushout( [ alpha, beta ], 1 );

julia> i2 = InjectionOfCofactorOfPushout( [ alpha, beta ], 2 );

julia> u = UniversalMorphismFromDirectSum( [ b, b ], [ i1, i2 ] );

julia> KernelObjectFunctorial( u, IdentityMorphism( Source( u ) ), u ) == IdentityMorphism( 3/ColsQ )
true

julia> IsZero( CokernelObjectFunctorial( u, IdentityMorphism( Range( u ) ), u ) )
true

julia> DirectProductFunctorial( [ u, u ] ) == DirectSumFunctorial( [ u, u ] )
true

julia> CoproductFunctorial( [ u, u ] ) == DirectSumFunctorial( [ u, u ] )
true

julia> IsOne( FiberProductFunctorial( [ u, u ], [ IdentityMorphism( Source( u ) ), IdentityMorphism( Source( u ) ) ], [ u, u ] ) )
true

julia> IsOne( PushoutFunctorial( [ u, u ], [ IdentityMorphism( Range( u ) ), IdentityMorphism( Range( u ) ) ], [ u, u ] ) )
true

julia> IsCongruentForMorphisms( (1/2) * alpha, alpha * (1/2) )
true

julia> RankOfObject( HomomorphismStructureOnObjects( a, b ) ) == RankOfObject( a ) * RankOfObject( b )
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

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgFieldOfRationalsInSingular() * "a,b,c,d,e,f,g,h,i,j";

julia> C = CategoryOfRows( R );

julia> T = TensorUnit( C );

julia> IsWellDefined( T )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R2 = DirectSum( T, T );

julia> R3 = DirectSum( T, R2 );

julia> R4 = DirectSum( R2, R2 );

julia> alpha = CategoryOfRowsMorphism( T, HomalgMatrix( "[ a, b, c, d ]", 1, 4, R ), R4 );

julia> beta = CategoryOfRowsMorphism( R2, HomalgMatrix( "[ e, f, g, h, i, j ]", 2, 3, R ), R3 );

julia> IsCongruentForMorphisms(
            PreCompose( Braiding( T, R2 ), TensorProductOnMorphisms( beta, alpha ) ),
            PreCompose( TensorProductOnMorphisms( alpha, beta ), Braiding( R4, R3 ) )
        )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> M = FreydCategoryObject( alpha );

julia> mu = MorphismToBidual( M );

julia> co = CoastrictionToImage( mu );

julia> IsIsomorphism( co )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R = HomalgFieldOfRationalsInSingular() * "a,b,c,d,e,f,g,h,i,j";

julia> C = CategoryOfColumns( R );

julia> T = TensorUnit( C );

julia> IsWellDefined( T )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> R2 = DirectSum( T, T );

julia> R3 = DirectSum( T, R2 );

julia> R4 = DirectSum( R2, R2 );

julia> alpha = CategoryOfColumnsMorphism( T, HomalgMatrix( "[ a, b, c, d ]", 4, 1, R ), R4 );

julia> beta = CategoryOfColumnsMorphism( R2, HomalgMatrix( "[ e, f, g, h, i, j ]", 3, 2, R ), R3 );

julia> IsCongruentForMorphisms(
            PreCompose( Braiding( T, R2 ), TensorProductOnMorphisms( beta, alpha ) ),
            PreCompose( TensorProductOnMorphisms( alpha, beta ), Braiding( R4, R3 ) )
        )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> M = FreydCategoryObject( alpha );

julia> mu = MorphismToBidual( M );

julia> co = CoastrictionToImage( mu );

julia> IsIsomorphism( co )
true

```
