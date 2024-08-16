
```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> Q = HomalgFieldOfRationals();

julia> vec = MatrixCategory( Q );

julia> V = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> W = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> alpha = VectorSpaceMorphism( V, [ [ 1, 1, 1 ], [ -1, -1, -1 ] ], W )
<A morphism in Category of matrices over Q>

julia> k = KernelObject( alpha )
<A vector space object over Q of dimension 1>

julia> T = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> tau = VectorSpaceMorphism( T, [ [ 2, 2 ], [ 2, 2 ] ], V )
<A morphism in Category of matrices over Q>

julia> k_lift = KernelLift( alpha, tau )
<A morphism in Category of matrices over Q>

julia> HasKernelEmbedding( alpha )
false

julia> KernelEmbedding( alpha )
<A morphism in Category of matrices over Q>

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> Q = HomalgFieldOfRationals();

julia> vec = MatrixCategory( Q );

julia> V = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> W = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> alpha = VectorSpaceMorphism( V, [ [ 1, 1, 1 ], [ -1, -1, -1 ] ], W )
<A morphism in Category of matrices over Q>

julia> k = KernelObject( alpha )
<A vector space object over Q of dimension 1>

julia> T = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> tau = VectorSpaceMorphism( T, [ [ 2, 2 ], [ 2, 2 ] ], V )
<A morphism in Category of matrices over Q>

julia> k_lift = KernelLift( alpha, tau )
<A morphism in Category of matrices over Q>

julia> HasKernelEmbedding( alpha )
false

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

julia> Q = HomalgFieldOfRationals();

julia> vec = MatrixCategory( Q );

julia> V = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> W = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> alpha = VectorSpaceMorphism( V, [ [ 1, 1, 1 ], [ -1, -1, -1 ] ], W )
<A morphism in Category of matrices over Q>

julia> k = KernelObject( alpha )
<A vector space object over Q of dimension 1>

julia> k_emb = KernelEmbedding( alpha )
<A morphism in Category of matrices over Q>

julia> IsEqualForObjects( Source( k_emb ), k )
true

julia> V = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> W = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> beta = VectorSpaceMorphism( V, [ [ 1, 1, 1 ], [ -1, -1, -1 ] ], W )
<A morphism in Category of matrices over Q>

julia> k_emb = KernelEmbedding( beta )
<A morphism in Category of matrices over Q>

julia> IsIdenticalObj( Source( k_emb ), KernelObject( beta ) )
true

```

```jldoctest AutoDocTests
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP

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
