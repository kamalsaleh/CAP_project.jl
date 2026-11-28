
```jldoctest Skeletal1IsProjective.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1IsProjective.g

julia> true
true

julia> I = FinSet1( 0 )
|0|

julia> T = FinSet1( 1 )
|1|

julia> M = FinSet1( 2 )
|2|

julia> IsProjective( I )
true

julia> IsProjective( T )
true

julia> IsProjective( M )
true

julia> IsOne( EpimorphismFromSomeProjectiveObject( I ) )
true

julia> IsOne( EpimorphismFromSomeProjectiveObject( M ) )
true

```
