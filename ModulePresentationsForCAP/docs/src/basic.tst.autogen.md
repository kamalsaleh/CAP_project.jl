
```jldoctest
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using LinearAlgebraForCAP; using ModulePresentationsForCAP

julia> true
true

julia> R = HomalgRingOfIntegers( );

julia> fpres = LeftPresentations( R );

julia> M = AsLeftPresentation( fpres, HomalgMatrix( [ [ 2 ] ], 1, 1, R ) )
<An object in Category of left presentations of Z>

julia> N = AsLeftPresentation( fpres, HomalgMatrix( [ [ 3 ] ], 1, 1, R ) )
<An object in Category of left presentations of Z>

julia> id = IdentityMorphism( M )
<A morphism in Category of left presentations of Z>

julia> IsEqualForMorphisms( id, PreCompose( id, id ) )
true

```
