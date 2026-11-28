
```jldoctest SkeletalTopos.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SkeletalTopos.g

julia> true
true

julia> T = TerminalObject( SkeletalFinSets );

julia> M = FinSet( 4 );

julia> N = FinSet( 3 );

julia> P = FinSet( 4 );

julia> G_f = [ 0, 1, 0, 2 ];

julia> f = MapOfFinSets( M, G_f, N );

julia> IsWellDefined( f )
true

julia> G_g = [ 2, 2, 1, 0 ];

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

julia> SkeletalFinSets.cached_precompiled_functions.
            CartesianBraidingWithGivenDirectProducts( SkeletalFinSets,
                DirectProduct( M, N ),
                M, N,
                DirectProduct( N, M )
        );

julia> SkeletalFinSets.cached_precompiled_functions.
            CartesianBraidingInverseWithGivenDirectProducts( SkeletalFinSets,
                DirectProduct( N, M ),
                M, N,
                DirectProduct( M, N )
        );

julia> ExponentialOnObjects( M, N );

julia> ExponentialOnMorphisms( f, g );

julia> SkeletalFinSets.cached_precompiled_functions.
            ExponentialOnMorphismsWithGivenExponentials( SkeletalFinSets,
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

julia> M = FinSet( 2 );

julia> N = FinSet( 2 );

julia> P = FinSet( 1 );

julia> Q = FinSet( 2 );

julia> CartesianPreComposeMorphism( M, N, P );

julia> CartesianPostComposeMorphism( M, N, P );

julia> DirectProductExponentialCompatibilityMorphism( [ M, N, P, Q ] );

```
