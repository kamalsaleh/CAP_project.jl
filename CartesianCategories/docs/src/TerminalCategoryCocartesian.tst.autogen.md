

```jldoctest
julia> using CAP, CartesianCategories

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

julia> a_coproduct_b = Coproduct( a, b );

julia> c_coproduct_d = Coproduct( c, d );

julia> cohom_ab = CoexponentialOnObjects( a, b );

julia> cohom_cd = CoexponentialOnObjects( c, d );

julia> alpha = MorphismConstructor( a, "f_ab", b );

julia> beta = MorphismConstructor( c, "f_cd", d );

julia> gamma = MorphismConstructor( u, "f_abu", a_coproduct_b );

julia> delta = MorphismConstructor( u, "f_cdu", c_coproduct_d );

julia> epsilon = MorphismConstructor( cohom_ab, "f_uhomab", u );

julia> zeta = MorphismConstructor( cohom_cd, "f_uhomcd", u );

julia> CocartesianCoclosedCategoriesTest( T, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );

julia> CocartesianCoclosedCategoriesTest( T, opposite_primitive, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );

julia> z = ZeroObject( T );

julia> z_coproduct_a = Coproduct( z, a );

julia> a_coproduct_z = Coproduct( a, z );

julia> cohom_za = CoexponentialOnObjects( z, a );

julia> cohom_az = CoexponentialOnObjects( a, z );

julia> alpha = MorphismConstructor( z, "f_za", a );

julia> beta = MorphismConstructor( a, "f_az", z );

julia> gamma = MorphismConstructor( u, "f_zau", z_coproduct_a );

julia> delta = MorphismConstructor( u, "f_azu", a_coproduct_z );

julia> epsilon = MorphismConstructor( cohom_za, "f_uhomza", u );

julia> zeta = MorphismConstructor( cohom_az, "f_uhomaz", u );

julia> CocartesianCoclosedCategoriesTest( T, opposite, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );

julia> CocartesianCoclosedCategoriesTest( T, opposite_primitive, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );

```
