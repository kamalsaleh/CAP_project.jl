
```jldoctest Skeletal1ImageObject.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1ImageObject.g

julia> true
true

julia> m = FinSet1( 7 )
|7|

julia> n = FinSet1( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 7, 5, 5 ], m )
|3| → |7|

julia> IsWellDefined( phi )
true

julia> ImageObject( phi )
|2|

julia> Cardinality( ImageObject( phi ) )
2

julia> s = FinSet1( 2 )
|2|

julia> I = ImageObject( phi, s )
|2|

julia> Cardinality( I )
2

```
