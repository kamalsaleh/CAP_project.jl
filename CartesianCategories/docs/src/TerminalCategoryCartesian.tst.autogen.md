

```jldoctest
julia> using CAP, CartesianCategories

julia> true
true

julia> T = TerminalCategoryWithMultipleObjects( );

julia> opposite = Opposite( T, "Opposite with all operations" );

julia> opposite_primitive = Opposite( T, "Opposite with primitive operations"; only_primitive_operations = true );

julia> DeactivateCachingOfCategory( T )

julia> DeactivateCachingOfCategory( opposite )

julia> DeactivateCachingOfCategory( opposite_primitive )

julia> a = "a" / T;

julia> b = "b" / T;

julia> c = "c" / T;

julia> d = "d" / T;

julia> alpha = MorphismConstructor( a, "f_ab", b );

julia> beta = MorphismConstructor( c, "f_cd", d );

julia> CartesianCategoriesTest( T, opposite, a, b, c, alpha, beta );

julia> CartesianCategoriesTest( T, opposite_primitive, a, b, c, alpha, beta );

julia> z = ZeroObject( T );

julia> alpha = UniversalMorphismFromZeroObject( a );

julia> beta = UniversalMorphismIntoZeroObject( a );

julia> CartesianCategoriesTest( T, opposite, z, a, a, alpha, beta );

julia> CartesianCategoriesTest( T, opposite_primitive, z, a, a, alpha, beta );

julia> CartesianCategoriesTest( T, opposite, a, z, z, beta, alpha );

julia> CartesianCategoriesTest( T, opposite_primitive, a, z, z, beta, alpha );

julia> a = "a" / T;

julia> L = [ "b" / T, "c" / T, "d" / T ];

julia> DistributiveCartesianCategoriesTest( T, opposite, a, L );

julia> DistributiveCartesianCategoriesTest( T, opposite_primitive, a, L );

julia> a = "a" / T;

julia> b = "b" / T;

julia> BraidedCartesianCategoriesTest( T, opposite, a, b );

julia> BraidedCartesianCategoriesTest( T, opposite_primitive, a, b );

julia> BraidedCartesianCategoriesTest( T, opposite, b, a );

julia> BraidedCartesianCategoriesTest( T, opposite_primitive, b, a );

julia> z = ZeroObject( T );

julia> BraidedCartesianCategoriesTest( T, opposite, z, a );

julia> BraidedCartesianCategoriesTest( T, opposite_primitive, z, a );

julia> BraidedCartesianCategoriesTest( T, opposite, a, z );

julia> BraidedCartesianCategoriesTest( T, opposite_primitive, a, z );

julia> a = "a" / T;

julia> b = "b" / T;

julia> c = "c" / T;

julia> d = "d" / T;

julia> u = TerminalObject( T );

julia> a_product_b = DirectProduct( a, b );

julia> c_product_d = DirectProduct( c, d );

julia> hom_ab = ExponentialOnObjects( a, b );

julia> hom_cd = ExponentialOnObjects( c, d );

julia> alpha = MorphismConstructor( a, "f_ab", b );

julia> beta = MorphismConstructor( c, "f_cd", d );

julia> gamma = MorphismConstructor( a_product_b, "f_abu", u );

julia> delta = MorphismConstructor( c_product_d, "f_cdu", u );

julia> epsilon = MorphismConstructor( u, "f_uhomab", hom_ab );

julia> zeta = MorphismConstructor( u, "f_uhomcd", hom_cd );

julia> CartesianClosedCategoriesTest( T, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );

julia> CartesianClosedCategoriesTest( T, opposite_primitive, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );

julia> z = ZeroObject( T );

julia> z_product_a = DirectProduct( z, a );

julia> a_product_z = DirectProduct( a, z );

julia> hom_za = ExponentialOnObjects( z, a );

julia> hom_az = ExponentialOnObjects( a, z );

julia> alpha = MorphismConstructor( z, "f_za", a );

julia> beta = MorphismConstructor( a, "f_az", z );

julia> gamma = MorphismConstructor( z_product_a, "f_zau", u );

julia> delta = MorphismConstructor( a_product_z, "f_azu", u );

julia> epsilon = MorphismConstructor( u, "f_uhomza", hom_za );

julia> zeta = MorphismConstructor( u, "f_uhomaz", hom_az );

julia> CartesianClosedCategoriesTest( T, opposite, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );

julia> CartesianClosedCategoriesTest( T, opposite_primitive, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );

```
