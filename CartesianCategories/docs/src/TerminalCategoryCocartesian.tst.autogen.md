

```jldoctest
julia> using CAP; using CartesianCategories

julia> true
true

julia> T = TerminalCategoryWithMultipleObjects( );

julia> opposite = Opposite( T, "Opposite with all operations" );

julia> opposite_primitive = Opposite( T, "Opposite with primitive operations"; only_primitive_operations = true );

julia> a = "a" / T;

julia> b = "b" / T;

julia> c = "c" / T;

julia> d = "d" / T;

julia> alpha = MorphismConstructor( a, "f_ab", b );

julia> beta = MorphismConstructor( c, "f_cd", d );

julia> CocartesianCategoriesTest( T, opposite, a, b, c, alpha, beta );

julia> CocartesianCategoriesTest( T, opposite_primitive, a, b, c, alpha, beta );

julia> z = ZeroObject( T );

julia> alpha = UniversalMorphismFromZeroObject( a );

julia> beta = UniversalMorphismIntoZeroObject( a );

julia> CocartesianCategoriesTest( T, opposite, z, a, a, alpha, beta );

julia> CocartesianCategoriesTest( T, opposite_primitive, z, a, a, alpha, beta );

julia> CocartesianCategoriesTest( T, opposite, a, z, z, beta, alpha );

julia> CocartesianCategoriesTest( T, opposite_primitive, a, z, z, beta, alpha );

julia> a = "a" / T;

julia> L = [ "b" / T, "c" / T, "d" / T ];

julia> CodistributiveCocartesianCategoriesTest( T, opposite, a, L );

julia> CodistributiveCocartesianCategoriesTest( T, opposite_primitive, a, L );

julia> a = "a" / T;

julia> b = "b" / T;

julia> BraidedCocartesianCategoriesTest( T, opposite, a, b );

julia> BraidedCocartesianCategoriesTest( T, opposite_primitive, a, b );

julia> BraidedCocartesianCategoriesTest( T, opposite, b, a );

julia> BraidedCocartesianCategoriesTest( T, opposite_primitive, b, a );

julia> z = ZeroObject( T );

julia> BraidedCocartesianCategoriesTest( T, opposite, z, a );

julia> BraidedCocartesianCategoriesTest( T, opposite_primitive, z, a );

julia> BraidedCocartesianCategoriesTest( T, opposite, a, z );

julia> BraidedCocartesianCategoriesTest( T, opposite_primitive, a, z );

julia> a = "a" / T;

julia> b = "b" / T;

julia> c = "c" / T;

julia> d = "d" / T;

julia> u = InitialObject( T );

julia> a_product_b = Coproduct( a, b );

julia> c_product_d = Coproduct( c, d );

julia> hom_ab = CoexponentialOnObjects( a, b );

julia> hom_cd = CoexponentialOnObjects( c, d );

julia> alpha = MorphismConstructor( a, "f_ab", b );

julia> beta = MorphismConstructor( c, "f_cd", d );

julia> gamma = MorphismConstructor( a_product_b, "f_abu", u );

julia> delta = MorphismConstructor( c_product_d, "f_cdu", u );

julia> epsilon = MorphismConstructor( u, "f_uhomab", hom_ab );

julia> zeta = MorphismConstructor( u, "f_uhomcd", hom_cd );

julia> CocartesianCoclosedCategoriesTest( T, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );

julia> CocartesianCoclosedCategoriesTest( T, opposite_primitive, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );

julia> z = ZeroObject( T );

julia> z_product_a = Coproduct( z, a );

julia> a_product_z = Coproduct( a, z );

julia> hom_za = CoexponentialOnObjects( z, a );

julia> hom_az = CoexponentialOnObjects( a, z );

julia> alpha = MorphismConstructor( z, "f_za", a );

julia> beta = MorphismConstructor( a, "f_az", z );

julia> gamma = MorphismConstructor( z_product_a, "f_zau", u );

julia> delta = MorphismConstructor( a_product_z, "f_azu", u );

julia> epsilon = MorphismConstructor( u, "f_uhomza", hom_za );

julia> zeta = MorphismConstructor( u, "f_uhomaz", hom_az );

julia> CocartesianCoclosedCategoriesTest( T, opposite, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );

julia> CocartesianCoclosedCategoriesTest( T, opposite_primitive, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );

```
