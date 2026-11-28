
```jldoctest Skeletal1CartesianLambdaIntroduction.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1CartesianLambdaIntroduction.g

julia> true
true

julia> S = FinSet1( 3 )
|3|

julia> R = FinSet1( 2 )
|2|

julia> f = MapOfFinSets( S, [ 2, 2, 1 ], R )
|3| → |2|

julia> IsWellDefined( f )
true

julia> T = TerminalObject( SkeletalFinSets1 )
|1|

julia> IsTerminal( T )
true

julia> IsOne( CartesianLambdaIntroduction( IdentityMorphism( T ) ) )
true

julia> lf = CartesianLambdaIntroduction( f )
|1| → |8|

julia> Source( lf ) == T
true

julia> Display( Range( lf ) )
[ 1,..., 8 ]

julia> Display( lf )
[ 1 ] ⱶ[ 4 ]→ [ 1,..., 8 ]

julia> elf = CartesianLambdaElimination( S, R, lf )
|3| → |2|

julia> elf == f
true

julia> L = MorphismsOfExternalHom( S, R );

julia> Display( L )
[ [ 1, 2, 3 ] ⱶ[ 1, 1, 1 ]→ [ 1, 2 ], [ 1, 2, 3 ] ⱶ[ 2, 1, 1 ]→ [ 1, 2 ], [ 1, 2, 3 ] ⱶ[ 1, 2, 1 ]→ [ 1, 2 ], [ 1, 2, 3 ] ⱶ[ 2, 2, 1 ]→ [ 1, 2 ], [ 1, 2, 3 ] ⱶ[ 1, 1, 2 ]→ [ 1, 2 ], [ 1, 2, 3 ] ⱶ[ 2, 1, 2 ]→ [ 1, 2 ], [ 1, 2, 3 ] ⱶ[ 1, 2, 2 ]→ [ 1, 2 ], [ 1, 2, 3 ] ⱶ[ 2, 2, 2 ]→ [ 1, 2 ] ]

julia> Li = List( L, phi -> CartesianLambdaIntroduction( phi ) );

julia> Display( Li )
[ [ 1 ] ⱶ[ 1 ]→ [ 1,..., 8 ], [ 1 ] ⱶ[ 2 ]→ [ 1,..., 8 ], [ 1 ] ⱶ[ 3 ]→ [ 1,..., 8 ], [ 1 ] ⱶ[ 4 ]→ [ 1,..., 8 ], [ 1 ] ⱶ[ 5 ]→ [ 1,..., 8 ], [ 1 ] ⱶ[ 6 ]→ [ 1,..., 8 ], [ 1 ] ⱶ[ 7 ]→ [ 1,..., 8 ], [ 1 ] ⱶ[ 8 ]→ [ 1,..., 8 ] ]

julia> List( L, phi ->
              DirectProductToExponentialLeftAdjunctMorphism( T, S, phi ) ) == Li
true

julia> List( Li, psi -> CartesianLambdaElimination( S, R, psi ) ) == L
true

julia> List( Li, psi ->
              ExponentialToDirectProductLeftAdjunctMorphism( S, R, psi ) ) == L
true

```
