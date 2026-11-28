
```jldoctest InfoStringOfInstalledOperationsOfCategory.g
julia> using CAP, CartesianCategories

julia> # extracted from examples/InfoStringOfInstalledOperationsOfCategory.g

julia> true
true

julia> distributive = DummyCategory( @rec(
          list_of_operations_to_install =
            ListOfDefiningOperations( "IsBicartesianClosedCategory" ),
          properties = [ "IsBicartesianClosedCategory", "IsSkeletalCategory" ] ) );

julia> InfoOfInstalledOperationsOfCategory( distributive )
21 primitive operations were used to derive 142 operations for this category which algorithmically
* IsBicartesianClosedCategory
and not yet algorithmically
* IsDistributiveCategory
and furthermore mathematically
* IsSkeletalCategory

```
