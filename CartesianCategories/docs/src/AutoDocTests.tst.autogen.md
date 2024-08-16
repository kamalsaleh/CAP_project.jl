
```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories

julia> true
true

julia> distributive = DummyCategory( @rec(
          list_of_operations_to_install =
            DuplicateFreeList( @Concatenation(
              CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCartesianClosedCategory,
              CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCocartesianCategory ) ),
          properties = [ "IsBicartesianClosedCategory", "IsSkeletalCategory" ] ) );

julia> InfoOfInstalledOperationsOfCategory( distributive )
21 primitive operations were used to derive 121 operations for this category which algorithmically
* IsBicartesianClosedCategory
and not yet algorithmically
* IsDistributiveCategory
and furthermore mathematically
* IsSkeletalCategory

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories

julia> I = InitialCategory( )
InitialCategory( )

julia> IsInitialCategory( I )
true

julia> Display( I )
A CAP category with name InitialCategory( ):

5 primitive operations were used to derive 13 operations for this category which not yet algorithmically
* IsEquippedWithHomomorphismStructure
and furthermore mathematically
* IsInitialCategory

julia> OI = Opposite( I )
Opposite( InitialCategory( ) )

julia> IsInitialCategory( OI )
true

julia> Display( OI )
A CAP category with name Opposite( InitialCategory( ) ):

17 primitive operations were used to derive 17 operations for this category which not yet algorithmically
* IsEquippedWithHomomorphismStructure
and furthermore mathematically
* IsInitialCategory

```
