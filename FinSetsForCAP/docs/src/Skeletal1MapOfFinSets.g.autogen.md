
```jldoctest Skeletal1MapOfFinSets.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/doc/Skeletal1MapOfFinSets.g

julia> true
true

julia> s = FinSet1( 3 )
|3|

julia> t = FinSet1( 7 )
|7|

julia> phi = MapOfFinSets( s, [ 7, 5, 5 ], t )
|3| → |7|

julia> Display( AsList( phi ) )
[ 7, 5, 5 ]

julia> IsWellDefined( phi )
true

julia> Display( phi )
[ 1, 2, 3 ] ⱶ[ 7, 5, 5 ]→ [ 1,..., 7 ]

julia> StringGAP( phi )
"MapOfFinSets( SkeletalFinSets1, FinSet( SkeletalFinSets1, 3 ), [ 7, 5, 5 ], FinSet( SkeletalFinSets1, 7 ) )"

julia> s = ObjectConstructor( SkeletalFinSets1, BigInt( 3 ) )
|3|

julia> t = ObjectConstructor( SkeletalFinSets1, BigInt( 7 ) )
|7|

julia> phi = MorphismConstructor(
            s,
            [ BigInt( 7 ), BigInt( 5 ), BigInt( 5 ) ],
            t
        )
|3| → |7|

julia> Display( MorphismDatum( phi ) )
[ 7, 5, 5 ]

julia> IsWellDefined( phi )
true

julia> Display( phi )
[ 1, 2, 3 ] ⱶ[ 7, 5, 5 ]→ [ 1,..., 7 ]

```
