
```jldoctest PushoutComplement_SkeletalFinSets.g
julia> using CAP, CartesianCategories, FinSetsForCAP, Toposes

julia> # extracted from examples/PushoutComplement_SkeletalFinSets.g

julia> true
true

julia> K = FinSet( 3 )
|3|

julia> L = FinSet( 6 )
|6|

julia> l = MapOfFinSets( K, [ 2, 3, 4 ], L );; IsMonomorphism( l );; l
|3| ↪ |6|

julia> Display( l )
[ 0, 1, 2 ] ⱶ[ 2, 3, 4 ]→ [ 0,..., 5 ]

julia> G = FinSet( 8 )
|8|

julia> Display( G )
[ 0,..., 7 ]

julia> m = MapOfFinSets( L, [ 0, 1, 2, 3, 5, 6 ], G )
|6| → |8|

julia> Display( m )
[ 0,..., 5 ] ⱶ[ 0, 1, 2, 3, 5, 6 ]→ [ 0,..., 7 ]

```

```jldoctest PushoutComplement_SkeletalFinSets.g
julia> using CAP, CartesianCategories, FinSetsForCAP, Toposes

julia> # extracted from examples/PushoutComplement_SkeletalFinSets.g

julia> HasPushoutComplement( l, m )
true

julia> c = PushoutComplement( l, m )
|5| → |8|

julia> Display( c )
[ 0,..., 4 ] ⱶ[ 2, 3, 4, 5, 7 ]→ [ 0,..., 7 ]

```
