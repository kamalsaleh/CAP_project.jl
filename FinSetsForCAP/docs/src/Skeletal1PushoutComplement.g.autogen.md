
```jldoctest Skeletal1PushoutComplement.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1PushoutComplement.g

julia> true
true

julia> K = FinSet1( 3 )
|3|

julia> L = FinSet1( 6 )
|6|

julia> l = MapOfFinSets( K, (3):(5), L );; IsMonomorphism( l );; l
|3| ↪ |6|

julia> Display( l )
[ 1, 2, 3 ] ⱶ[ 3 .. 5 ]→ [ 1,..., 6 ]

julia> G = FinSet1( 8 )
|8|

julia> Display( G )
[ 1,..., 8 ]

julia> m = MapOfFinSets( L, [ 1, 2, 3, 4, 6, 7 ], G )
|6| → |8|

julia> Display( m )
[ 1,..., 6 ] ⱶ[ 1, 2, 3, 4, 6, 7 ]→ [ 1,..., 8 ]

```

```jldoctest Skeletal1PushoutComplement.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1PushoutComplement.g

julia> true
true

julia> HasPushoutComplement( l, m )
true

julia> c = PushoutComplement( l, m )
|5| → |8|

julia> Display( c )
[ 1,..., 5 ] ⱶ[ 3, 4, 5, 6, 8 ]→ [ 1,..., 8 ]

```
