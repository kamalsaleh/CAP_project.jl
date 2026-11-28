
```jldoctest ProsetOfCategory.g
julia> using CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FpCategories, LocalesForCAP

julia> # extracted from examples/ProsetOfCategory.g

julia> true
true

julia> q = FinQuiver( "q(a,b)[f:a->b,g:b->a]" )
FinQuiver( "q(a,b)[f:a→b,g:b→a]" )

julia> F = PathCategory( q )
PathCategory( FinQuiver( "q(a,b)[f:a→b,g:b→a]" ) )

julia> C = F / [ [ F.fg, F.id_a ], [ F.gf, F.id_b ] ]
PathCategory( FinQuiver( "q(a,b)[f:a→b,g:b→a]" ) )
/ [ f⋅g == id(a), g⋅f == id(b) ]

julia> P = ProsetOfCategory( C )
ProsetOfCategory( PathCategory( FinQuiver( "q(a,b)[f:a→b,g:b→a]" ) )
/ [ f⋅g == id(a), g⋅f == id(b) ] )

julia> Display( P )
A CAP category with name
ProsetOfCategory( PathCategory( FinQuiver( "q(a,b)[f:a→b,g:b→a]" ) )
/ [ f⋅g == id(a), g⋅f == id(b) ] ):

11 primitive operations were used to derive 85 operations for this category
which algorithmically
* IsThinCategory
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
* IsFiniteCategory
* IsEquippedWithHomomorphismStructure

julia> Display( SetOfObjects( P ) )
[ An object in the proset given by: (a), An object in the proset given by: (b) ]

julia> P.a == P.b
false

julia> Length( SetOfMorphisms( P ) )
4

julia> Size( P )
4

julia> Display( SetOfGeneratingMorphisms( P ) )
[ A morphism in the proset given by: [f]:(a) → (b),
  A morphism in the proset given by: [g]:(b) → (a) ]

```
