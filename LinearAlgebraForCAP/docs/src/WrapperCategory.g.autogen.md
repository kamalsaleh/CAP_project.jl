
```jldoctest WrapperCategory.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP

julia> # extracted from examples/WrapperCategory.g

julia> true
true

julia> Q = HomalgFieldOfRationals( );

julia> Qmat = MatrixCategory( Q )
Category of matrices over Q

julia> Wrapper = WrapperCategory( Qmat, @rec( ) )
WrapperCategory( Category of matrices over Q )

julia> mor = ZeroMorphism( ZeroObject( Wrapper ), ZeroObject( Wrapper ) );

julia> (2 / Q) * mor;

julia> BasisOfExternalHom( Source( mor ), Range( mor ) );

julia> CoefficientsOfMorphism( mor );

julia> distinguished_object = DistinguishedObjectOfHomomorphismStructure( Wrapper );

julia> object = HomomorphismStructureOnObjects( Source( mor ), Source( mor ) );

julia> HomomorphismStructureOnMorphisms( mor, mor );

julia> HomomorphismStructureOnMorphismsWithGivenObjects( object, mor, mor, object );

julia> iota = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( mor );

julia> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( distinguished_object, mor, object );

julia> beta = InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( mor ), Range( mor ), iota );

julia> IsCongruentForMorphisms( mor, beta )
true

```
