
```jldoctest Skeletal1MonoEpi.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1MonoEpi.g

julia> true
true

julia> m = FinSet1( 3 )
|3|

julia> n = FinSet1( 5 )
|5|

julia> p = FinSet1( 7 )
|7|

julia> psi = MapOfFinSets( m, [ 1, 3, 5 ], n )
|3| → |5|

julia> IsEpimorphism( psi )
false

julia> IsSplitEpimorphism( psi )
false

julia> IsMonomorphism( psi )
true

julia> IsSplitMonomorphism( psi )
true

julia> psi
|3| ↪ |5|

julia> psi = MapOfFinSets( p, [ 1, 3, 2, 3, 3, 2, 1 ], m )
|7| → |3|

julia> IsEpimorphism( psi )
true

julia> IsSplitEpimorphism( psi )
true

julia> IsMonomorphism( psi )
false

julia> IsSplitMonomorphism( psi )
false

julia> psi
|7| ↠ |3|

julia> id = IdentityMorphism( m )
|3| → |3|

julia> IsIsomorphism( id )
true

julia> id
|3| ⭇ |3|

```
