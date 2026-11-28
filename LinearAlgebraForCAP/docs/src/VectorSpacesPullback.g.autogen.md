
```jldoctest VectorSpacesPullback.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/VectorSpacesPullback.g

julia> Q = HomalgFieldOfRationals();

julia> vec = MatrixCategory( Q );

julia> A = MatrixCategoryObject( vec, 1 )
<A vector space object over Q of dimension 1>

julia> B = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> C = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> AtoC = VectorSpaceMorphism( A, [ [ 1, 2, 0 ] ], C )
<A morphism in Category of matrices over Q>

julia> BtoC = VectorSpaceMorphism( B, [ [ 1, 0, 0 ], [ 0, 1, 0 ] ], C )
<A morphism in Category of matrices over Q>

julia> P = FiberProduct( AtoC, BtoC )
<A vector space object over Q of dimension 1>

julia> p1 = ProjectionInFactorOfFiberProduct( [ AtoC, BtoC ], 1 )
<A morphism in Category of matrices over Q>

julia> p2 = ProjectionInFactorOfFiberProduct( [ AtoC, BtoC ], 2 )
<A morphism in Category of matrices over Q>

```
