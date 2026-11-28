
```jldoctest Skeletal1CoastrictionToImage.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1CoastrictionToImage.g

julia> true
true

julia> m = FinSet1( 7 )
|7|

julia> n = FinSet1( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 7, 5, 5 ], m )
|3| → |7|

julia> IsWellDefined( phi )
true

julia> f = CoastrictionToImage( phi )
|3| → |2|

julia> Display( f )
[ 1, 2, 3 ] ⱶ[ 2, 1, 1 ]→ [ 1, 2 ]

julia> IsWellDefined( f )
true

julia> IsEpimorphism( f )
true

julia> IsSplitEpimorphism( f )
true

julia> m = FinSet1( 77 )
|77|

julia> n = FinSet1( 4 )
|4|

julia> phi = MapOfFinSets( n, [ 77, 2, 25, 2 ], m )
|4| → |77|

julia> IsWellDefined( phi )
true

julia> iota = ImageEmbedding( phi )
|3| → |77|

julia> pi = CoastrictionToImage( phi )
|4| → |3|

julia> Display( pi )
[ 1,..., 4 ] ⱶ[ 3, 1, 2, 1 ]→ [ 1, 2, 3 ]

julia> IsWellDefined( pi )
true

julia> IsEpimorphism( pi )
true

julia> IsSplitEpimorphism( pi )
true

julia> PreCompose( pi, iota ) == phi
true

```
