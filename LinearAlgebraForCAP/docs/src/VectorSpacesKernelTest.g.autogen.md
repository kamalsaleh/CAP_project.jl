
```jldoctest VectorSpacesKernelTest.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/VectorSpacesKernelTest.g

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

```jldoctest VectorSpacesKernelTest.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/VectorSpacesKernelTest.g

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

```jldoctest VectorSpacesKernelTest.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/VectorSpacesKernelTest.g

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
