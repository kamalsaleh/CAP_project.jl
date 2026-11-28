
```jldoctest Skeletal1FinSet.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/doc/Skeletal1FinSet.g

julia> true
true

julia> m = FinSet1( 7 )
|7|

julia> Display( m )
[ 1,..., 7 ]

julia> IsWellDefined( m )
true

julia> StringGAP( m )
"FinSet( SkeletalFinSets1, 7 )"

julia> Display( List( m, x -> x^2 ) )
[ 1, 4, 9, 16, 25, 36, 49 ]

julia> L = ObjectDatum( m )
7

julia> mm = ObjectConstructor( SkeletalFinSets1, BigInt( 7 ) )
|7|

julia> m == mm
true

julia> n = FinSet1( -2 )
|-2|

julia> IsWellDefined( n )
false

julia> n = FinSet1( 3 )
|3|

julia> IsWellDefined( n )
true

julia> p = FinSet1( 4 )
|4|

julia> IsWellDefined( p )
true

julia> IsEqualForObjects( m, n )
false

```
