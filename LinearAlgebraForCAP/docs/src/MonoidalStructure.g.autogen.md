
```jldoctest MonoidalStructure.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/MonoidalStructure.g

julia> true
true

julia> Q = HomalgFieldOfRationals();

julia> vec = MatrixCategory( Q );

julia> a = MatrixCategoryObject( vec, 1 )
<A vector space object over Q of dimension 1>

julia> b = MatrixCategoryObject( vec, 2 )
<A vector space object over Q of dimension 2>

julia> c = MatrixCategoryObject( vec, 3 )
<A vector space object over Q of dimension 3>

julia> z = ZeroObject( vec )
<A vector space object over Q of dimension 0>

julia> alpha = VectorSpaceMorphism( a, [ [ 1, 0 ] ], b )
<A morphism in Category of matrices over Q>

julia> beta = VectorSpaceMorphism( b,
                        [ [ 1, 0, 0 ], [ 0, 1, 0 ] ], c )
<A morphism in Category of matrices over Q>

julia> gamma = VectorSpaceMorphism( c,
                         [ [ 0, 1, 1 ], [ 1, 0, 1 ], [ 1, 1, 0 ] ], c )
<A morphism in Category of matrices over Q>

julia> IsCongruentForMorphisms(
            TensorProductOnMorphisms( alpha, beta ),
            TensorProductOnMorphisms( beta, alpha )
        )
false

julia> IsCongruentForMorphisms(
            AssociatorRightToLeft( a, b, c ),
            IdentityMorphism( TensorProductOnObjects( a, TensorProductOnObjects( b, c ) ) )
        )
true

julia> IsCongruentForMorphisms(
            gamma,
            LambdaElimination( c, c, LambdaIntroduction( gamma ) )
        )
true

julia> IsZeroForMorphisms( TraceMap( gamma ) )
true

julia> IsCongruentForMorphisms(
            RankMorphism( DirectSum( a, b ) ),
            RankMorphism( c )
        )
true

julia> IsCongruentForMorphisms(
            Braiding( b, c ),
            IdentityMorphism( TensorProductOnObjects( b, c ) )
        )
false

julia> IsCongruentForMorphisms(
            PreCompose( Braiding( b, c ), Braiding( c, b ) ),
            IdentityMorphism( TensorProductOnObjects( b, c ) )
        )
true

```
