
```jldoctest Skeletal1MorphismsOfExternalHom.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1MorphismsOfExternalHom.g

julia> true
true

julia> L = FinSet1( 0 )
|0|

julia> M = FinSet1( 2 )
|2|

julia> N = FinSet1( 3 )
|3|

julia> Display( MorphismsOfExternalHom( L, L ) )
[ ∅ ⱶ[  ]→ ∅ ]

julia> Display( MorphismsOfExternalHom( M, L ) )
[  ]

julia> Display( MorphismsOfExternalHom( L, M ) )
[ ∅ ⱶ[  ]→ [ 1, 2 ] ]

julia> Display( MorphismsOfExternalHom( M, N ) )
[ [ 1, 2 ] ⱶ[ 1, 1 ]→ [ 1, 2, 3 ], [ 1, 2 ] ⱶ[ 2, 1 ]→ [ 1, 2, 3 ], [ 1, 2 ] ⱶ[ 3, 1 ]→ [ 1, 2, 3 ], [ 1, 2 ] ⱶ[ 1, 2 ]→ [ 1, 2, 3 ], [ 1, 2 ] ⱶ[ 2, 2 ]→ [ 1, 2, 3 ], [ 1, 2 ] ⱶ[ 3, 2 ]→ [ 1, 2, 3 ], [ 1, 2 ] ⱶ[ 1, 3 ]→ [ 1, 2, 3 ], [ 1, 2 ] ⱶ[ 2, 3 ]→ [ 1, 2, 3 ], [ 1, 2 ] ⱶ[ 3, 3 ]→ [ 1, 2, 3 ] ]

```
