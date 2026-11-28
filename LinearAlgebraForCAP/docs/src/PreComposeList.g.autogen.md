
```jldoctest PreComposeList.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/PreComposeList.g

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
