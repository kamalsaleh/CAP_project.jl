
```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> S = HomalgRingOfIntegers();

julia> rows = CategoryOfRows( S )
Rows( Z )

julia> obj1 = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

julia> obj2 = CategoryOfRowsObject( 8, rows )
<A row module over Z of rank 8>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

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
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> Length( AdditiveGenerators( rows ) )
1

julia> ZeroObject( rows )
<A row module over Z of rank 0>

julia> obj5 = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> obj6 = CategoryOfRowsObject( 1, rows )
<A row module over Z of rank 1>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> directSum = DirectSum( [ obj5, obj6 ] )
<A row module over Z of rank 3>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> i1 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> i2 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> proj1 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> proj2 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> mor2 = IdentityMorphism( obj6 )
<A morphism in Rows( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

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
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> S = HomalgRingOfIntegers();

julia> cols = CategoryOfColumns( S )
Columns( Z )

julia> obj1 = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

julia> obj2 = CategoryOfColumnsObject( 8, cols )
<A column module over Z of rank 8>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

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
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> ZeroObject( cols )
<A column module over Z of rank 0>

julia> obj5 = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> obj6 = CategoryOfColumnsObject( 1, cols )
<A column module over Z of rank 1>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> directSum = DirectSum( [ obj5, obj6 ] )
<A column module over Z of rank 3>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> i1 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> i2 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> proj1 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> proj2 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

julia> mor2 = IdentityMorphism( obj6 )
<A morphism in Columns( Z )>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

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
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using FreydCategoriesForCAP

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
