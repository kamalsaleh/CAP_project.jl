
```jldoctest InitialCategory.g
julia> using CAP, CartesianCategories

julia> # extracted from examples/InitialCategory.g

julia> I = InitialCategory( )
InitialCategory( )

julia> IsInitialCategory( I )
true

julia> Display( I )
A CAP category with name InitialCategory( ):

5 primitive operations were used to derive 15 operations for this category which not yet algorithmically
* IsEquippedWithHomomorphismStructure
and furthermore mathematically
* IsInitialCategory

julia> OI = Opposite( I )
Opposite( InitialCategory( ) )

julia> IsInitialCategory( OI )
true

julia> Display( OI )
A CAP category with name Opposite( InitialCategory( ) ):

19 primitive operations were used to derive 19 operations for this category which not yet algorithmically
* IsEquippedWithHomomorphismStructure
and furthermore mathematically
* IsInitialCategory

```
