
```jldoctest SplitEpiSummand.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/SplitEpiSummand.g

julia> true
true

julia> Q = HomalgFieldOfRationals();

julia> Qmat = MatrixCategory( Q );

julia> a = MatrixCategoryObject( Qmat, 3 );

julia> b = MatrixCategoryObject( Qmat, 4 );

julia> homalg_matrix = HomalgMatrix( [ [ 1, 0, 0, 0 ],
                                          [ 0, 1, 0, -1 ],
                                          [ -1, 0, 2, 1 ] ], 3, 4, Q );

julia> alpha = VectorSpaceMorphism( a, homalg_matrix, b );

julia> beta = SomeReductionBySplitEpiSummand( alpha );

julia> IsWellDefinedForMorphisms( beta )
true

julia> Dimension( Source( beta ) )
0

julia> Dimension( Range( beta ) )
1

julia> gamma = SomeReductionBySplitEpiSummand_MorphismFromInputRange( alpha );

julia> Display( EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( gamma ) ) )
[ [ 0 ], [ 1 ], [ -1/2 ], [ 1 ] ]

```
