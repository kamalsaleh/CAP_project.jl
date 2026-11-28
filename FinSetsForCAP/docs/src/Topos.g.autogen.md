
```jldoctest Topos.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Topos.g

julia> true
true

julia> M = FinSet( (1):(5) );

julia> N = FinSet( [ 1, 2, 4 ] );

julia> P = FinSet( [ 1, 4, 8, 9 ] );

julia> G_f = [ [ 1, 1 ], [ 2, 2 ], [ 3, 1 ], [ 4, 2 ], [ 5, 4 ] ];

julia> f = MapOfFinSets( M, G_f, N );

julia> IsWellDefined( f )
true

julia> G_g = [ [ 1, 4 ], [ 2, 4 ], [ 3, 2 ], [ 4, 2 ], [ 5, 1 ] ];

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

julia> exp = ExponentialOnObjects( M, N );

julia> ExponentialOnObjects( FinSet( [ 1 ] ), exp );

julia> ExponentialOnMorphisms( f, g );

julia> CartesianRightEvaluationMorphism( M, N );

julia> CartesianRightCoevaluationMorphism( N, M );

julia> DirectProductToExponentialRightAdjunctMorphism( M, N,
            UniversalMorphismIntoTerminalObject( DirectProduct( M, N ) )
        );

julia> ExponentialToDirectProductRightAdjunctMorphism( M, N,
            UniversalMorphismFromInitialObject( ExponentialOnObjects( M, N ) )
        );

julia> CartesianLeftEvaluationMorphism( M, N );

julia> CartesianLeftCoevaluationMorphism( N, M );

julia> DirectProductToExponentialLeftAdjunctMorphism( M, N,
            UniversalMorphismIntoTerminalObject( DirectProduct( M, N ) )
        );

julia> ExponentialToDirectProductLeftAdjunctMorphism( M, N,
            UniversalMorphismFromInitialObject( ExponentialOnObjects( M, N ) )
        );

julia> M = FinSet( [ 1, 2 ] );

julia> N = FinSet( [ "a", "b" ] );

julia> P = FinSet( [ "*" ] );

julia> Q = FinSet( [ "§", "&" ] );

julia> CartesianPreComposeMorphism( M, N, P );

julia> CartesianPostComposeMorphism( M, N, P );

julia> DirectProductExponentialCompatibilityMorphism( [ M, N, P, Q ] );

```
