
```jldoctest Opposite_CategoryOfRows_as_CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/Opposite_CategoryOfRows_as_CategoryOfColumns.g

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
