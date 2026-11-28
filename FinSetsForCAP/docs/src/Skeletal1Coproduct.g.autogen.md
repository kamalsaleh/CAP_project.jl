
```jldoctest Skeletal1Coproduct.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1Coproduct.g

julia> true
true

julia> m = FinSet1( 7 )
|7|

julia> n = FinSet1( 3 )
|3|

julia> p = FinSet1( 4 )
|4|

julia> c = Coproduct( m, n, p )
|14|

julia> Display( AsList( c ) )
[ 1 .. 14 ]

julia> iota1 = InjectionOfCofactorOfCoproduct( [ m, n, p ], 1 )
|7| → |14|

julia> IsWellDefined( iota1 )
true

julia> Display( iota1 )
[ 1,..., 7 ] ⱶ[ 1, 2, 3, 4, 5, 6, 7 ]→ [ 1,..., 14 ]

julia> iota2 = InjectionOfCofactorOfCoproduct( [ m, n, p ], 2 )
|3| → |14|

julia> IsWellDefined( iota2 )
true

julia> Display( iota2 )
[ 1, 2, 3 ] ⱶ[ 8, 9, 10 ]→ [ 1,..., 14 ]

julia> iota3 = InjectionOfCofactorOfCoproduct( [ m, n, p ], 3 )
|4| → |14|

julia> IsWellDefined( iota3 )
true

julia> Display( iota3 )
[ 1,..., 4 ] ⱶ[ 11, 12, 13, 14 ]→ [ 1,..., 14 ]

julia> psi = UniversalMorphismFromCoproduct(
                       [ m, n, p ], [ iota1, iota2, iota3 ] )
|14| → |14|

julia> id = IdentityMorphism( Coproduct( [ m, n, p ] ) )
|14| → |14|

julia> psi == id
true

```
