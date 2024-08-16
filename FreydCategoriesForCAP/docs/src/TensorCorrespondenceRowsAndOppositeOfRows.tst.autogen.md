

```jldoctest
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP


julia> true
true


julia> Q = HomalgFieldOfRationals();

julia> rows = CategoryOfRows( Q );

julia> opposite = Opposite( rows );


julia> a = 2 / rows;

julia> b = 3 / rows;


julia> MonoidalCategoriesTensorProductAndUnitTest( rows, opposite, a, b );


julia> a = 0 / rows;

julia> b = 2 / rows;


julia> MonoidalCategoriesTensorProductAndUnitTest( rows, opposite, a, b );


julia> a = 3 / rows;

julia> b = 0 / rows;


julia> MonoidalCategoriesTensorProductAndUnitTest( rows, opposite, a, b );


julia> a = 2 / rows;

julia> b = 3 / rows;

julia> c = 6 / rows;

julia> d = 4 / rows;


julia> alpha = CategoryOfRowsMorphism( a, HomalgMatrix( (2):(7), RankOfObject( a ), RankOfObject( b ), Q ), b );

julia> beta = CategoryOfRowsMorphism( c, HomalgMatrix( (8):(31), RankOfObject( c ), RankOfObject( d ), Q ), d );


julia> MonoidalCategoriesTest( rows, opposite, a, b, c, alpha, beta );


julia> a = 0 / rows;

julia> b = 3 / rows;


julia> alpha = ZeroMorphism( a, b );


julia> MonoidalCategoriesTest( rows, opposite, a, b, c, alpha, beta );


julia> a = 3 / rows;

julia> b = 0 / rows;


julia> alpha = ZeroMorphism( a, b );


julia> MonoidalCategoriesTest( rows, opposite, a, b, c, alpha, beta );


julia> a = 2 / rows;

julia> L = [ 3 / rows, 4 / rows, 5 / rows ];


julia> AdditiveMonoidalCategoriesTest( rows, opposite, a, L );


julia> a = 0 / rows;

julia> L = [ 3 / rows, 4 / rows, 5 / rows ];


julia> AdditiveMonoidalCategoriesTest( rows, opposite, a, L );


julia> a = 2 / rows;

julia> L = [ 3 / rows, 0 / rows, 5 / rows ];


julia> AdditiveMonoidalCategoriesTest( rows, opposite, a, L );


julia> a = 2 / rows;

julia> b = 3 / rows;


julia> BraidedMonoidalCategoriesTest( rows, opposite, a, b );


julia> a = 0 / rows;

julia> b = 2 / rows;


julia> BraidedMonoidalCategoriesTest( rows, opposite, a, b );


julia> a = 2 / rows;

julia> b = 0 / rows;


julia> BraidedMonoidalCategoriesTest( rows, opposite, a, b );


julia> u = TensorUnit( rows );


julia> a = 2 / rows;

julia> b = 3 / rows;

julia> c = 6 / rows;

julia> d = 4 / rows;


julia> a_tensor_b = TensorProduct( a, b );

julia> c_tensor_d = TensorProduct( c, d );


julia> hom_ab = InternalHom( a, b );

julia> hom_cd = InternalHom( c, d );


julia> alpha = CategoryOfRowsMorphism( a, HomalgMatrix( (2):(7), RankOfObject( a ), RankOfObject( b ), Q ), b );

julia> beta = CategoryOfRowsMorphism( c, HomalgMatrix( (8):(31), RankOfObject( c ), RankOfObject( d ), Q ), d );

julia> gamma = CategoryOfRowsMorphism( a_tensor_b, HomalgMatrix( (2):(7), RankOfObject( a_tensor_b ), RankOfObject( u ), Q ), u );

julia> delta = CategoryOfRowsMorphism( c_tensor_d, HomalgMatrix( (8):(31), RankOfObject( c_tensor_d ), RankOfObject( u ), Q ), u );

julia> epsilon = CategoryOfRowsMorphism( u, HomalgMatrix( [ 2 .. 7], RankOfObject( u ), RankOfObject( hom_ab ), Q ), hom_ab );

julia> zeta = CategoryOfRowsMorphism( u, HomalgMatrix( (8):(31), RankOfObject( u ), RankOfObject( hom_cd ), Q ), hom_cd );


julia> ClosedMonoidalCategoriesTest( rows, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );


julia> a == 0 / rows;

julia> d == 0 / rows;


julia> a_tensor_b = TensorProduct( a, b );

julia> c_tensor_d = TensorProduct( c, d );


julia> hom_ab = InternalHom( a, b );

julia> hom_cd = InternalHom( c, d );


julia> alpha = ZeroMorphism( a, b );

julia> beta = ZeroMorphism( c, d );

julia> gamma = ZeroMorphism( a_tensor_b, u );

julia> delta = ZeroMorphism( c_tensor_d, u );

julia> epsilon = ZeroMorphism( u, hom_ab );

julia> zeta = ZeroMorphism( u, hom_cd );


julia> ClosedMonoidalCategoriesTest( rows, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );


julia> u = TensorUnit( rows );


julia> a = 2 / rows;

julia> b = 3 / rows;

julia> c = 6 / rows;

julia> d = 4 / rows;


julia> a_tensor_b = TensorProduct( a, b );

julia> c_tensor_d = TensorProduct( c, d );


julia> cohom_ab = InternalCoHom( a, b );

julia> cohom_cd = InternalCoHom( c, d );


julia> alpha = CategoryOfRowsMorphism( a, HomalgMatrix( (2):(7), RankOfObject( a ), RankOfObject( b ), Q ), b );

julia> beta = CategoryOfRowsMorphism( c, HomalgMatrix( (8):(31), RankOfObject( c ), RankOfObject( d ), Q ), d );

julia> gamma = CategoryOfRowsMorphism( u, HomalgMatrix( (2):(7), RankOfObject( u ), RankOfObject( a_tensor_b ), Q ), a_tensor_b );

julia> delta = CategoryOfRowsMorphism( u, HomalgMatrix( (8):(31), RankOfObject( u ), RankOfObject( c_tensor_d ), Q ), c_tensor_d );

julia> epsilon = CategoryOfRowsMorphism( cohom_ab, HomalgMatrix( (2):(7), RankOfObject( cohom_ab ), RankOfObject( u ), Q ), u );

julia> zeta = CategoryOfRowsMorphism( cohom_cd, HomalgMatrix( (8):(31), RankOfObject( cohom_cd ), RankOfObject( u ), Q ), u );


julia> CoclosedMonoidalCategoriesTest( rows, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );


julia> a == 0 / rows;

julia> d == 0 / rows;


julia> a_tensor_b = TensorProduct( a, b );

julia> c_tensor_d = TensorProduct( c, d );


julia> cohom_ab = InternalCoHom( a, b );

julia> cohom_cd = InternalCoHom( c, d );


julia> alpha = ZeroMorphism( a, b );

julia> beta = ZeroMorphism( c, d );

julia> gamma = ZeroMorphism( u, a_tensor_b );

julia> delta = ZeroMorphism( u, c_tensor_d );

julia> epsilon = ZeroMorphism( cohom_ab, u );

julia> zeta = ZeroMorphism( cohom_cd, u );


julia> CoclosedMonoidalCategoriesTest( rows, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );


julia> a = 2 / rows;

julia> b = 3 / rows;

julia> c = 6 / rows;

julia> d = 4 / rows;


julia> alpha = IdentityMorphism( a );


julia> RigidSymmetricClosedMonoidalCategoriesTest( rows, opposite, a, b, c, d, alpha );


julia> a = 0 / rows;

julia> d = 0 / rows;


julia> alpha = IdentityMorphism( a );


julia> RigidSymmetricClosedMonoidalCategoriesTest( rows, opposite, a, b, c, d, alpha );


julia> a = 2 / rows;

julia> b = 3 / rows;

julia> c = 6 / rows;

julia> d = 4 / rows;


julia> alpha = IdentityMorphism( a );


julia> RigidSymmetricCoclosedMonoidalCategoriesTest( rows, opposite, a, b, a, b, alpha );


julia> a = 0 / rows;

julia> d = 0 / rows;


julia> alpha = IdentityMorphism( a );


julia> RigidSymmetricCoclosedMonoidalCategoriesTest( rows, opposite, a, b, a, b, alpha );


```
