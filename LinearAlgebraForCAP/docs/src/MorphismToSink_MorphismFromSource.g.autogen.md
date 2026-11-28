
```jldoctest MorphismToSink_MorphismFromSource.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/MorphismToSink_MorphismFromSource.g

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
