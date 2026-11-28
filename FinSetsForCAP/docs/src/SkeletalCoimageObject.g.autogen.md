
```jldoctest SkeletalCoimageObject.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SkeletalCoimageObject.g

julia> true
true

julia> m = FinSet( 3 )
|3|

julia> n = FinSet( 3 )
|3|

julia> phi = MapOfFinSets( m, [ 1, 0, 1 ], n )
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
[ 0, 1 ] ⱶ[ 1, 0 ]→ [ 0, 1, 2 ]

julia> Display( ImageEmbedding( phi ) )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1, 2 ]

```
