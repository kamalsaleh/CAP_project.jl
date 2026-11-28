
```jldoctest Functors.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/Functors.g

julia> true
true

julia> ring = HomalgFieldOfRationals( );

julia> vec = MatrixCategory( ring );

julia> F = CapFunctor( "CohomForVec", [ vec, [ vec, true ] ], vec );

julia> obj_func = function( A, B ) return TensorProductOnObjects( A, DualOnObjects( B ) ); end;

julia> mor_func = function( source, alpha, beta, range ) return TensorProductOnMorphismsWithGivenTensorProducts( source, alpha, DualOnMorphisms( beta ), range ); end;

julia> AddObjectFunction( F, obj_func );

julia> AddMorphismFunction( F, mor_func );

julia> Display( InputSignature( F ) )
[ [ Category of matrices over Q, false ], [ Category of matrices over Q, true ] ]

julia> V1 = TensorUnit( vec );

julia> V3 = DirectSum( V1, V1, V1 );

julia> pi1 = ProjectionInFactorOfDirectSum( [ V1, V1 ], 1 );

julia> pi2 = ProjectionInFactorOfDirectSum( [ V3, V1 ], 1 );

julia> value1 = ApplyFunctor( F, pi1, pi2 );

julia> input = ProductCategoryMorphism( SourceOfFunctor( F ), [ pi1, Opposite( pi2 ) ] );

julia> value2 = ApplyFunctor( F, input );

julia> IsCongruentForMorphisms( value1, value2 )
true

julia> InstallFunctor( F, "F_installation" );

julia> F_installation( pi1, pi2 );

julia> F_installation( input );

julia> F_installationOnObjects( V1, V1 );

julia> F_installationOnObjects( ProductCategoryObject( SourceOfFunctor( F ), [ V1, Opposite( V1 ) ] ) );

julia> F_installationOnMorphisms( pi1, pi2 );

julia> F_installationOnMorphisms( input );

julia> F2 = CapFunctor( "CohomForVec2", ProductCategory( [ vec, Opposite( vec ) ] ), vec );

julia> AddObjectFunction( F2, a -> obj_func( a[1], Opposite( a[2] ) ) );

julia> AddMorphismFunction( F2, function( source, datum, range ) return mor_func( source, datum[1], Opposite( datum[2] ), range ); end );

julia> input = ProductCategoryMorphism( SourceOfFunctor( F2 ), [ pi1, Opposite( pi2 ) ] );

julia> value3 = ApplyFunctor( F2, input );

julia> IsCongruentForMorphisms( value1, value3 )
true

julia> Display( InputSignature( F2 ) )
[ [ Product of: Category of matrices over Q, Opposite( Category of matrices over Q ), false ] ]

julia> InstallFunctor( F2, "F_installation2" );

julia> F_installation2( input );

julia> F_installation2OnObjects( ProductCategoryObject( SourceOfFunctor( F2 ), [ V1, Opposite( V1 ) ] ) );

julia> F_installation2OnMorphisms( input );

```
