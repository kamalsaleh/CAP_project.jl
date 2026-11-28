
```jldoctest OppositeCategory.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/OppositeCategory.g

julia> true
true

julia> QQ = HomalgFieldOfRationals();

julia> vec = MatrixCategory( QQ );

julia> op = Opposite( vec );

julia> Perform( ListKnownCategoricalProperties( op ), Display )
IsAbCategory
IsAbelianCategory
IsAbelianCategoryWithEnoughInjectives
IsAbelianCategoryWithEnoughProjectives
IsAdditiveCategory
IsAdditiveMonoidalCategory
IsBraidedMonoidalCategory
IsCategoryWithCoequalizers
IsCategoryWithCoequalizersOfIdentityAndAutomorphisms
IsCategoryWithCokernels
IsCategoryWithEqualizers
IsCategoryWithEqualizersOfIdentityAndAutomorphisms
IsCategoryWithInitialObject
IsCategoryWithKernels
IsCategoryWithTerminalObject
IsCategoryWithZeroObject
IsClosedMonoidalCategory
IsCoclosedMonoidalCategory
IsEnrichedOverCommutativeRegularSemigroup
IsEquippedWithHomomorphismStructure
IsLinearCategoryOverCommutativeRing
IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms
IsLinearCategoryOverCommutativeSemiring
IsLinearCategoryOverCommutativeSemiringWithFinitelyGeneratedFreeExternalHoms
IsMonoidalCategory
IsPreAbelianCategory
IsRigidSymmetricClosedMonoidalCategory
IsRigidSymmetricCoclosedMonoidalCategory
IsSkeletalCategory
IsStrictMonoidalCategory
IsSymmetricClosedMonoidalCategory
IsSymmetricCoclosedMonoidalCategory
IsSymmetricMonoidalCategory

julia> V1 = Opposite( TensorUnit( vec ) );

julia> V2 = DirectSum( V1, V1 );

julia> V3 = DirectSum( V1, V2 );

julia> V4 = DirectSum( V1, V3 );

julia> V5 = DirectSum( V1, V4 );

julia> IsWellDefined( MorphismBetweenDirectSums( op, [ ], [ ], [ V1 ] ) )
true

julia> IsWellDefined( MorphismBetweenDirectSums( op, [ V1 ], [ [ ] ], [ ] ) )
true

julia> alpha13 = InjectionOfCofactorOfDirectSum( [ V1, V2 ], 1 );

julia> alpha14 = InjectionOfCofactorOfDirectSum( [ V1, V2, V1 ], 3 );

julia> alpha15 = InjectionOfCofactorOfDirectSum( [ V2, V1, V2 ], 2 );

julia> alpha23 = InjectionOfCofactorOfDirectSum( [ V2, V1 ], 1 );

julia> alpha24 = InjectionOfCofactorOfDirectSum( [ V1, V2, V1 ], 2 );

julia> alpha25 = InjectionOfCofactorOfDirectSum( [ V2, V2, V1 ], 1 );

julia> mat = [
            [ alpha13, alpha14, alpha15 ],
            [ alpha23, alpha24, alpha25 ]
        ];

julia> mor = MorphismBetweenDirectSums( mat );

julia> IsWellDefined( mor )
true

julia> IsWellDefined( Opposite( mor ) )
true

julia> IsCongruentForMorphisms(
            UniversalMorphismFromImage( mor, [ CoastrictionToImage( mor ), ImageEmbedding( mor ) ] ),
            IdentityMorphism( ImageObject( mor ) )
        )
true

```
