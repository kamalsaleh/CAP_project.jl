
```jldoctest IsomorphismOntoCartesianSquareOfPowerObject.g
julia> using CAP, CartesianCategories, FinSetsForCAP, Toposes

julia> # extracted from examples/IsomorphismOntoCartesianSquareOfPowerObject.g

julia> true
true

julia> a = FinSet( 2 )
|2|

julia> ia = IsomorphismOntoCartesianSquareOfPowerObject( a )
|16| ⭇ |16|

julia> Display( ia )
[ 0,..., 15 ] ⱶ[ 0, 1, 4, 5, 2, 3, 6, 7, 8, 9, 12, 13, 10, 11, 14, 15 ]→ [ 0,..., 15 ]

```
