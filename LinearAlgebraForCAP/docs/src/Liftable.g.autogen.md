
```jldoctest Liftable.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/Liftable.g

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
