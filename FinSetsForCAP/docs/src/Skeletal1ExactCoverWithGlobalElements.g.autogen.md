
```jldoctest Skeletal1ExactCoverWithGlobalElements.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1ExactCoverWithGlobalElements.g

julia> true
true

julia> L = FinSet1( 0 )
|0|

julia> M = FinSet1( 2 )
|2|

julia> Display( ExactCoverWithGlobalElements( L ) )
[  ]

julia> g = ExactCoverWithGlobalElements( M );

julia> Display( g )
[ [ 1 ] ⱶ[ 1 ]→ [ 1, 2 ], [ 1 ] ⱶ[ 2 ]→ [ 1, 2 ] ]

julia> IsOne( UniversalMorphismFromCoproduct( g ) )
true

```
