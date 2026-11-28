
```jldoctest Skeletal1CoimageObject.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1CoimageObject.g

julia> true
true

julia> m = FinSet1( 3 )
|3|

julia> n = FinSet1( 3 )
|3|

julia> phi = MapOfFinSets( m, [ 2, 1, 2 ], n )
|3| → |3|

julia> I = CoimageObject( phi )
|2|

julia> IsMonomorphism( phi )
false

julia> IsSplitMonomorphism( phi )
false

julia> IsEpimorphism( phi )
false

julia> IsSplitEpimorphism( phi )
false

julia> pi = CoimageProjection( phi )
|3| → |2|

julia> iota = AstrictionToCoimage( phi )
|2| → |3|

julia> PreCompose( pi, iota ) == phi
true

julia> Display( iota )
[ 1, 2 ] ⱶ[ 2, 1 ]→ [ 1, 2, 3 ]

julia> Display( ImageEmbedding( phi ) )
[ 1, 2 ] ⱶ[ 1, 2 ]→ [ 1, 2, 3 ]

```
