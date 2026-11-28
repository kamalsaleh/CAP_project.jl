
```jldoctest WeakHomomorphismTheorem.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/WeakHomomorphismTheorem.g

julia> true
true

julia> zz = HomalgRingOfIntegers( );

julia> Zmat = CategoryOfRows( zz )
Rows( Z )

julia> Display( Zmat )
A CAP category with name Rows( Z ):

83 primitive operations were used to derive 447 operations for this category which algorithmically
* IsEquippedWithHomomorphismStructure
* IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms
* IsPreAbelianCategory
* IsRigidSymmetricClosedMonoidalCategory
* IsRigidSymmetricCoclosedMonoidalCategory
* IsAdditiveMonoidalCategory
and furthermore mathematically
* IsSkeletalCategory
* IsStrictMonoidalCategory

julia> mat = HomalgMatrix(
                       [ [  -36,   18,  -80,  -54,   28 ],
                         [   90,  -45,  140,   45,  -40 ],
                         [  -24,   12,  -32,   -4,    8 ],
                         [   -6,    3,   -4,    5,    0 ] ], 4, 5, zz );

julia> mor = mat / Zmat
<A morphism in Rows( Z )>

julia> split_epi = CoimageProjection( mor )
<A morphism in Rows( Z )>

julia> IsSplitEpimorphism( split_epi )
true

julia> split_mono = ImageEmbedding( mor )
<A morphism in Rows( Z )>

julia> IsSplitMonomorphism( split_mono )
true

julia> epimono = MorphismFromCoimageToImage( mor )
<A morphism in Rows( Z )>

julia> IsEpimorphism( epimono )
true

julia> IsMonomorphism( epimono )
true

julia> LiftAlongMonomorphism( split_mono, AstrictionToCoimage( mor ) ) == epimono
true

julia> ColiftAlongEpimorphism( split_epi, CoastrictionToImage( mor ) ) == epimono
true

julia> PreCompose( [ split_epi, epimono, split_mono ] ) == mor
true

```
