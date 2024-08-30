
```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> S = HomalgRingOfIntegers();

julia> rows = CategoryOfRows( S )
Rows( Z )

julia> obj1 = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

julia> obj2 = CategoryOfRowsObject( 8, rows )
<A row module over Z of rank 8>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> obj3 = CategoryOfRowsObject( 1, rows )
<A row module over Z of rank 1>

julia> IsWellDefined( obj1 )
true

julia> obj4 = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

julia> mor = CategoryOfRowsMorphism( obj3, HomalgMatrix( [[1,2]], 1, 2, S ), obj4 )
<A morphism in Rows( Z )>

julia> IsWellDefined( mor )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> Length( AdditiveGenerators( rows ) )
1

julia> ZeroObject( rows )
<A row module over Z of rank 0>

julia> obj5 = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> obj6 = CategoryOfRowsObject( 1, rows )
<A row module over Z of rank 1>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> directSum = DirectSum( [ obj5, obj6 ] )
<A row module over Z of rank 3>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> i1 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> i2 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> proj1 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> proj2 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> mor2 = IdentityMorphism( obj6 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> source = CategoryOfRowsObject( 1, rows )
<A row module over Z of rank 1>

julia> range = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

julia> mor = CategoryOfRowsMorphism( source, HomalgMatrix( [[ 2, 3 ]], 1, 2, S ), range )
<A morphism in Rows( Z )>

julia> colift = Colift( mor2, mor )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> S = HomalgRingOfIntegers();

julia> cols = CategoryOfColumns( S )
Columns( Z )

julia> obj1 = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

julia> obj2 = CategoryOfColumnsObject( 8, cols )
<A column module over Z of rank 8>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> obj3 = CategoryOfColumnsObject( 1, cols )
<A column module over Z of rank 1>

julia> IsWellDefined( obj1 )
true

julia> obj4 = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

julia> mor = CategoryOfColumnsMorphism( obj3, HomalgMatrix( [[1],[2]], 2, 1, S ), obj4 )
<A morphism in Columns( Z )>

julia> IsWellDefined( mor )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> ZeroObject( cols )
<A column module over Z of rank 0>

julia> obj5 = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> obj6 = CategoryOfColumnsObject( 1, cols )
<A column module over Z of rank 1>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> directSum = DirectSum( [ obj5, obj6 ] )
<A column module over Z of rank 3>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> i1 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> i2 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> proj1 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> proj2 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> mor2 = IdentityMorphism( obj6 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> source = CategoryOfColumnsObject( 1, cols )
<A column module over Z of rank 1>

julia> range = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

julia> mor = CategoryOfColumnsMorphism( source, HomalgMatrix( [[ 2 ], [ 3 ]], 2, 1, S ), range )
<A morphism in Columns( Z )>

julia> colift = Colift( mor2, mor )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

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
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> R = HomalgRingOfIntegers();

julia> cols = CategoryOfColumns( R );

julia> adelman = AdelmanCategory( cols );

julia> obj1 = CategoryOfColumnsObject( 1, cols );

julia> obj2 = CategoryOfColumnsObject( 2, cols );

julia> id = IdentityMorphism( obj2 );

julia> alpha = CategoryOfColumnsMorphism( obj1, HomalgMatrix( [ [ 1 ], [ 2 ] ], 2, 1, R ), obj2 );

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
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

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
        Display( Source( Opposite( sum ) ) )
A row module over Q of rank 2

julia> Display( Range( Opposite( sum ) ) )
A row module over Q of rank 1

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

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
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> Q = HomalgFieldOfRationals();

julia> RowsQ = CategoryOfRows( Q );

julia> a = 3/RowsQ;

julia> b = 4/RowsQ;

julia> IsProjective( a )
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
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using CartesianCategories; using Toposes; using FinSetsForCAP; using FreydCategoriesForCAP

julia> Q = HomalgFieldOfRationals();

julia> ColsQ = CategoryOfColumns( Q );

julia> a = 3/ColsQ;

julia> b = 4/ColsQ;

julia> IsProjective( a )
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
