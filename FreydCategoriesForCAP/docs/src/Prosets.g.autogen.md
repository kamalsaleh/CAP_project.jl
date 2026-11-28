
```jldoctest Prosets.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP, LinearClosuresForCAP, CartesianCategories, Toposes, FinSetsForCAP, FreydCategoriesForCAP

julia> # extracted from examples/Prosets.g

julia> K = [ [1, 1, 1], [0, 1, 1], [0, 1, 1] ];

julia> L = [ [1, 1, 0], [0, 1, 1], [0, 0, 1] ];

julia> P_K = ProSetAsCategory(K);

julia> #ProSetAsCategory(L)

julia> a = 1/P_K;

julia> b = ProSetAsCategoryObject(2, P_K);

julia> c = ProSetAsCategoryObject(3, P_K);

julia> d = ProSetAsCategoryObject(4, P_K);

julia> delta = ProSetAsCategoryMorphism(b, a);

julia> IsWellDefined(a)
true

julia> IsWellDefined(d)
false

julia> IsWellDefined(delta)
false

julia> alpha = ProSetAsCategoryMorphism(a, b);

julia> beta = ProSetAsCategoryMorphism(b, c);

julia> gamma = ProSetAsCategoryMorphism(a, c);

julia> gamma == PreCompose(alpha, beta)
true

julia> id_a = IdentityMorphism(a);

julia> IsWellDefined(Inverse(alpha))
false

julia> beta*Inverse(beta) == IdentityMorphism(b)
true

julia> alpha == Lift(gamma, beta)
true

julia> IsLiftable(beta, gamma)
false

julia> Colift(alpha, gamma) == beta
true

julia> alpha == HomStructure(a, b, HomStructure(alpha))
true

```
