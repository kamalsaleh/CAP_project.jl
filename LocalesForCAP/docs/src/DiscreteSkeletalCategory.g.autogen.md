
```jldoctest DiscreteSkeletalCategory.g
julia> using CAP, MonoidalCategories, CartesianCategories, ToolsForCategoricalTowers, Toposes, FpCategories, LocalesForCAP

julia> # extracted from examples/DiscreteSkeletalCategory.g

julia> true
true

julia> D = SkeletalDiscreteCategory( "IsPosInt" )
SkeletalDiscreteCategory( "IsPosInt" )

julia> Display( D )
A CAP category with name SkeletalDiscreteCategory( "IsPosInt" ):

8 primitive operations were used to derive 84 operations for this category
which algorithmically
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
* IsPosetCategory
* IsEquippedWithHomomorphismStructure
and furthermore mathematically
* IsDiscreteCategory

julia> one = 1 / D
<An object in SkeletalDiscreteCategory( "IsPosInt" )>

julia> Display( one )
1

An object in SkeletalDiscreteCategory( "IsPosInt" ) given by the above data

julia> IsWellDefined( one )
true

julia> two = 2 / D
<An object in SkeletalDiscreteCategory( "IsPosInt" )>

julia> id_one = IdentityMorphism( one )
<A morphism in SkeletalDiscreteCategory( "IsPosInt" )>

julia> MorphismDatum( id_one )
fail

julia> IsOne( PreCompose( id_one, id_one ) )
true

julia> IsOne( UniqueMorphism( one, one ) )
true

julia> IsWellDefined( UniqueMorphism( one, two ) )
false

julia> HomStructure( one, one )
<(⊤)>

julia> HomStructure( one, two )
<(⊥)>

julia> HomStructure( two, one )
<(⊥)>

```
