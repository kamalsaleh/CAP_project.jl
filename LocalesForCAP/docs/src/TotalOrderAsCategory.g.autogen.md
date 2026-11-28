
```jldoctest TotalOrderAsCategory.g
julia> using CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FpCategories, LocalesForCAP

julia> # extracted from examples/TotalOrderAsCategory.g

julia> true
true

julia> D = TotalOrderAsCategory( "IsInt", (a,b) -> a <= b )
TotalOrderAsCategory( "IsInt" )

julia> Display( D )
A CAP category with name TotalOrderAsCategory( "IsInt" ):

8 primitive operations were used to derive 86 operations for this category
which algorithmically
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
* IsPosetCategory
* IsEquippedWithHomomorphismStructure
and furthermore mathematically
* IsTotalOrderCategory

julia> one = 1 / D
<An object in TotalOrderAsCategory( "IsInt" )>

julia> Display( one )
1

An object in TotalOrderAsCategory( "IsInt" ) given by the above data

julia> IsWellDefined( one )
true

julia> IsWellDefined( -1 / D )
true

julia> two = 2 / D
<An object in TotalOrderAsCategory( "IsInt" )>

julia> id_one = IdentityMorphism( one )
<A morphism in TotalOrderAsCategory( "IsInt" )>

julia> MorphismDatum( id_one )
fail

julia> IsOne( PreCompose( id_one, id_one ) )
true

julia> IsOne( UniqueMorphism( one, one ) )
true

julia> IsWellDefined( UniqueMorphism( one, two ) )
true

julia> HomStructure( one, one )
<(⊤)>

julia> IsHomSetInhabited( one, one )
true

julia> HomStructure( one, two )
<(⊤)>

julia> IsHomSetInhabited( one, two )
true

julia> HomStructure( two, one )
<(⊥)>

julia> IsHomSetInhabited( two, one )
false

julia> DirectProduct( [ one, two ] ) == one
true

julia> Coproduct( [ one, two ] ) == two
true

```
