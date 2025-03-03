
```jldoctest AutoDocTests
julia> using CAP; using MonoidalCategories; using CartesianCategories; using Toposes; using FinSetsForCAP; using ToolsForCategoricalTowers

julia> true
true

julia> D1 = DummyCategoryInDoctrines( [ "IsAbCategory" ] )
DummyCategoryInDoctrines( [ "IsAbCategory" ] )

julia> Display( D1 )
A CAP category with name DummyCategoryInDoctrines( [ "IsAbCategory" ] ):

16 primitive operations were used to derive 28 operations for this category which algorithmically
* IsAbCategory

julia> D2 = DummyCategoryInDoctrines( [ "IsAbCategory", "IsAbelianCategory" ] )
DummyCategoryInDoctrines( [ "IsAbelianCategory" ] )

julia> Display( D2 )
A CAP category with name DummyCategoryInDoctrines( [ "IsAbelianCategory" ] ):

32 primitive operations were used to derive 259 operations for this category which algorithmically
* IsAbelianCategory

julia> D3 = DummyCategoryInDoctrines(
                      [ "IsCategoryWithInitialObject",
                        "IsCategoryWithTerminalObject",
                        "IsCategoryWithZeroObject" ] )
DummyCategoryInDoctrines( [ "IsCategoryWithInitialObject", "IsCategoryWithTerminalObject", "IsCategoryWithZeroObject" ] )

julia> Display( D3 )
A CAP category with name DummyCategoryInDoctrines( [ "IsCategoryWithInitialObject", "IsCategoryWithTerminalObject", "IsCategoryWithZeroObject" ] ):

18 primitive operations were used to derive 41 operations for this category which algorithmically
* IsCategoryWithZeroObject

julia> D4 = DummyCategoryInDoctrines(
                      [ "IsCategoryWithInitialObject",
                        "IsCategoryWithTerminalObject",
                        "IsCategoryWithZeroObject" ]; minimal = true )
DummyCategoryInDoctrines( [ "IsCategoryWithZeroObject" ] )

julia> Display( D4 )
A CAP category with name DummyCategoryInDoctrines( [ "IsCategoryWithZeroObject" ] ):

14 primitive operations were used to derive 41 operations for this category which algorithmically
* IsCategoryWithZeroObject

```

```jldoctest AutoDocTests
julia> using CAP; using MonoidalCategories; using CartesianCategories; using Toposes; using FinSetsForCAP; using ToolsForCategoricalTowers

julia> true
true

julia> sFinSets = SkeletalCategoryOfFiniteSets( )
SkeletalFinSets

julia> Display( sFinSets )
A CAP category with name SkeletalFinSets:

58 primitive operations were used to derive 348 operations for this category which algorithmically
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
* IsEquippedWithHomomorphismStructure
* IsElementaryTopos
and furthermore mathematically
* IsSkeletalCategory
* IsStrictCartesianCategory
* IsStrictCocartesianCategory

julia> a = FinSet( sFinSets, BigInt( 2 ) )
|2|

julia> b = FinSet( sFinSets, BigInt( 3 ) )
|3|

julia> beta = CocartesianBraiding( a, b )
|5| → |5|

julia> Display( beta )
[ 0,..., 4 ] ⱶ[ 3, 4, 0, 1, 2 ]→ [ 0,..., 4 ]

julia> id_a = IdentityMorphism( a )
|2| → |2|

julia> id_b = IdentityMorphism( b )
|3| → |3|

julia> f = PairGAP( [ 1, 0 ], [ id_a, id_b ] );

julia> beta2 = MorphismBetweenCoproducts( [ a, b ], f, [ b, a ] )
|5| → |5|

julia> beta2 == beta
true

julia> W = WrapperCategory( sFinSets,
                     @rec( only_primitive_operations = false ) )
WrapperCategory( SkeletalFinSets )

julia> Display( W )
A CAP category with name WrapperCategory( SkeletalFinSets ):

324 primitive operations were used to derive 338 operations for this category which algorithmically
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
* IsEquippedWithHomomorphismStructure
* IsElementaryTopos
and furthermore mathematically
* IsSkeletalCategory
* IsStrictCartesianCategory
* IsStrictCocartesianCategory

julia> W_a = a / W
<An object in WrapperCategory( SkeletalFinSets )>

julia> W_b = b / W
<An object in WrapperCategory( SkeletalFinSets )>

julia> W_beta = CocartesianBraiding( W_a, W_b )
<A morphism in WrapperCategory( SkeletalFinSets )>

julia> MorphismDatum( W_beta ) == beta
true

julia> W_id_a = IdentityMorphism( W_a )
<A morphism in WrapperCategory( SkeletalFinSets )>

julia> W_id_b = IdentityMorphism( W_b )
<A morphism in WrapperCategory( SkeletalFinSets )>

julia> W_f = PairGAP( [ 1, 0 ], [ W_id_a, W_id_b ] );

julia> W_beta2 = MorphismBetweenCoproducts( [ W_a, W_b ], W_f, [ W_b, W_a ] )
<A morphism in WrapperCategory( SkeletalFinSets )>

julia> W_beta2 == W_beta
true

julia> O = Opposite( sFinSets )
Opposite( SkeletalFinSets )

julia> Display( O )
A CAP category with name Opposite( SkeletalFinSets ):

257 primitive operations were used to derive 273 operations for this category which algorithmically
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
* IsEquippedWithHomomorphismStructure
* IsBicartesianCoclosedCategory
* IsFiniteBicompleteCategory
and furthermore mathematically
* IsSkeletalCategory
* IsStrictCartesianCategory
* IsStrictCocartesianCategory

julia> O_a = a / O
<An object in Opposite( SkeletalFinSets )>

julia> O_b = b / O
<An object in Opposite( SkeletalFinSets )>

julia> O_beta = CartesianBraiding( O_b, O_a )
<A morphism in Opposite( SkeletalFinSets )>

julia> MorphismDatum( O_beta ) == beta
true

julia> O_id_a = IdentityMorphism( O_a )
<A morphism in Opposite( SkeletalFinSets )>

julia> O_id_b = IdentityMorphism( O_b )
<A morphism in Opposite( SkeletalFinSets )>

julia> O_f = PairGAP( [ 1, 0 ], [ O_id_a, O_id_b ] );

julia> O_beta2 = MorphismBetweenDirectProducts( [ O_b, O_a ], O_f, [ O_a, O_b ] )
<A morphism in Opposite( SkeletalFinSets )>

julia> O_beta2 == O_beta
true

```

```jldoctest AutoDocTests
julia> using CAP; using MonoidalCategories; using CartesianCategories; using Toposes; using FinSetsForCAP; using ToolsForCategoricalTowers

julia> true
true

julia> true
true

julia> true
true

julia> sFinSets = SkeletalCategoryOfFiniteSets( )
SkeletalFinSets

julia> Display( sFinSets )
A CAP category with name SkeletalFinSets:

58 primitive operations were used to derive 348 operations for this category which algorithmically
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
* IsEquippedWithHomomorphismStructure
* IsElementaryTopos
and furthermore mathematically
* IsSkeletalCategory
* IsStrictCartesianCategory
* IsStrictCocartesianCategory

julia> a = FinSet( sFinSets, BigInt( 2 ) )
|2|

julia> b = FinSet( sFinSets, BigInt( 3 ) )
|3|

julia> beta = CartesianBraiding( a, b )
|6| → |6|

julia> Display( beta )
[ 0,..., 5 ] ⱶ[ 0, 3, 1, 4, 2, 5 ]→ [ 0,..., 5 ]

julia> id_a = IdentityMorphism( a )
|2| → |2|

julia> id_b = IdentityMorphism( b )
|3| → |3|

julia> f = PairGAP( [ 1, 0 ], [ id_b, id_a ] );

julia> beta2 = MorphismBetweenDirectProducts( [ a, b ], f, [ b, a ] )
|6| → |6|

julia> beta2 == beta
true

julia> W = WrapperCategory( sFinSets,
                     @rec( only_primitive_operations = false ) )
WrapperCategory( SkeletalFinSets )

julia> Display( W )
A CAP category with name WrapperCategory( SkeletalFinSets ):

324 primitive operations were used to derive 338 operations for this category which algorithmically
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
* IsEquippedWithHomomorphismStructure
* IsElementaryTopos
and furthermore mathematically
* IsSkeletalCategory
* IsStrictCartesianCategory
* IsStrictCocartesianCategory

julia> W_a = a / W
<An object in WrapperCategory( SkeletalFinSets )>

julia> W_b = b / W
<An object in WrapperCategory( SkeletalFinSets )>

julia> W_beta = CartesianBraiding( W_a, W_b )
<A morphism in WrapperCategory( SkeletalFinSets )>

julia> MorphismDatum( W_beta ) == beta
true

julia> W_id_a = IdentityMorphism( W_a )
<A morphism in WrapperCategory( SkeletalFinSets )>

julia> W_id_b = IdentityMorphism( W_b )
<A morphism in WrapperCategory( SkeletalFinSets )>

julia> W_f = PairGAP( [ 1, 0 ], [ W_id_b, W_id_a ] );

julia> W_beta2 = MorphismBetweenDirectProducts( [ W_a, W_b ], W_f, [ W_b, W_a ] )
<A morphism in WrapperCategory( SkeletalFinSets )>

julia> W_beta2 == W_beta
true

julia> O = Opposite( sFinSets )
Opposite( SkeletalFinSets )

julia> Display( O )
A CAP category with name Opposite( SkeletalFinSets ):

257 primitive operations were used to derive 273 operations for this category which algorithmically
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
* IsEquippedWithHomomorphismStructure
* IsBicartesianCoclosedCategory
* IsFiniteBicompleteCategory
and furthermore mathematically
* IsSkeletalCategory
* IsStrictCartesianCategory
* IsStrictCocartesianCategory

julia> O_a = a / O
<An object in Opposite( SkeletalFinSets )>

julia> O_b = b / O
<An object in Opposite( SkeletalFinSets )>

julia> O_beta = CocartesianBraiding( O_b, O_a )
<A morphism in Opposite( SkeletalFinSets )>

julia> MorphismDatum( O_beta ) == beta
true

julia> O_id_a = IdentityMorphism( O_a )
<A morphism in Opposite( SkeletalFinSets )>

julia> O_id_b = IdentityMorphism( O_b )
<A morphism in Opposite( SkeletalFinSets )>

julia> O_f = PairGAP( [ 1, 0 ], [ O_id_b, O_id_a ] );

julia> O_beta2 = MorphismBetweenCoproducts( [ O_b, O_a ], O_f, [ O_a, O_b ] )
<A morphism in Opposite( SkeletalFinSets )>

julia> O_beta2 == O_beta
true

```
