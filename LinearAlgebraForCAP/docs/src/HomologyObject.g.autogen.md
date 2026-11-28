
```jldoctest HomologyObject.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/HomologyObject.g

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
