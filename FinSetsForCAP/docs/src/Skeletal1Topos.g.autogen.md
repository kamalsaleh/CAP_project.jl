
```jldoctest Skeletal1Topos.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1Topos.g

julia> true
true

julia> T = TerminalObject( SkeletalFinSets1 );

julia> M = FinSet1( 4 );

julia> N = FinSet1( 3 );

julia> P = FinSet1( 4 );

julia> G_f = [ 1, 2, 1, 3 ];

julia> f = MapOfFinSets( M, G_f, N );

julia> IsWellDefined( f )
true

julia> G_g = [ 3, 3, 2, 1 ];

julia> g = MapOfFinSets( M, G_g, N );

julia> IsWellDefined( g )
true

julia> DirectProduct( M, N );

julia> DirectProductOnMorphisms( f, g );

julia> CartesianAssociatorLeftToRight( M, N, P );

julia> CartesianAssociatorRightToLeft( M, N, P );

julia> TerminalObject( FinSets );

julia> CartesianLeftUnitor( M );

julia> CartesianLeftUnitorInverse( M );

julia> CartesianRightUnitor( M );

julia> CartesianRightUnitorInverse( M );

julia> CartesianBraiding( M, N );

julia> CartesianBraidingInverse( M, N );

julia> SkeletalFinSets1.cached_precompiled_functions.
            CartesianBraidingWithGivenDirectProducts( SkeletalFinSets1,
                DirectProduct( M, N ),
                M, N,
                DirectProduct( N, M )
        );

julia> SkeletalFinSets1.cached_precompiled_functions.
            CartesianBraidingInverseWithGivenDirectProducts( SkeletalFinSets1,
                DirectProduct( N, M ),
                M, N,
                DirectProduct( M, N )
        );

julia> ExponentialOnObjects( M, N );

julia> ExponentialOnMorphisms( f, g );

julia> SkeletalFinSets1.cached_precompiled_functions.
            ExponentialOnMorphismsWithGivenExponentials( SkeletalFinSets1,
                ExponentialOnObjects( Range( f ), Source( g ) ),
                f, g,
                ExponentialOnObjects( Source( f ), Range( g ) )
        );

julia> CartesianRightEvaluationMorphism( M, N );

julia> ExponentialToDirectProductRightAdjunctMorphism( M, N,
            UniversalMorphismFromInitialObject( ExponentialOnObjects( M, N ) )
        );

julia> CartesianLeftEvaluationMorphism( M, N );

julia> CartesianLeftCoevaluationMorphism( N, M );

julia> CartesianLeftCoevaluationMorphism( T, T );

julia> DirectProductToExponentialLeftAdjunctMorphism( M, N,
            UniversalMorphismIntoTerminalObject( DirectProduct( M, N ) )
        );

julia> ExponentialToDirectProductLeftAdjunctMorphism( M, N,
            UniversalMorphismFromInitialObject( ExponentialOnObjects( M, N ) )
        );

julia> M = FinSet1( 2 );

julia> N = FinSet1( 2 );

julia> P = FinSet1( 1 );

julia> Q = FinSet1( 2 );

julia> CartesianPreComposeMorphism( M, N, P );

julia> CartesianPostComposeMorphism( M, N, P );

julia> DirectProductExponentialCompatibilityMorphism( [ M, N, P, Q ] );

```
