
```jldoctest Skeletal1WellDefined.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1WellDefined.g

julia> true
true

julia> s = FinSet1( 7 )
|7|

julia> t = FinSet1( 4 )
|4|

julia> psi = MapOfFinSets( s, [ 1, 3, 2, 3, 2, 4 ], t )
|7| → |4|

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( s, [ 1, 3, 2, 3, 2, 4, -1 ], t )
|7| → |4|

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( s, [ 2, 3, 2, 5, 3, 2, 4 ], t )
|7| → |4|

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( s, [ 1, 3, 2, 4, 3, 2, 4 ], t )
|7| → |4|

julia> IsWellDefined( psi )
true

```
