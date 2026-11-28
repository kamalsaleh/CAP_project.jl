
```jldoctest RelativeTruthMorphisms.g
julia> using CAP, CartesianCategories, FinSetsForCAP, Toposes

julia> # extracted from examples/RelativeTruthMorphisms.g

julia> true
true

julia> sFinSets = SkeletalFinSets
SkeletalFinSets

julia> t = TerminalObject( sFinSets )
|1|

julia> TruthMorphismOfFalse( sFinSets ) == RelativeTruthMorphismOfFalse( t )
true

julia> TruthMorphismOfTrue( sFinSets ) == RelativeTruthMorphismOfTrue( t )
true

julia> TruthMorphismOfNot( sFinSets ) == RelativeTruthMorphismOfNot( t )
true

julia> TruthMorphismOfAnd( sFinSets ) == RelativeTruthMorphismOfAnd( t )
true

julia> TruthMorphismOfOr( sFinSets ) == RelativeTruthMorphismOfOr( t )
true

julia> TruthMorphismOfImplies( sFinSets ) == RelativeTruthMorphismOfImplies( t )
true

julia> a = FinSet( 2 )
|2|

julia> fPa = RelativeTruthMorphismOfFalse( a )
|1| → |4|

julia> Display( fPa )
[ 0 ] ⱶ[ 0 ]→ [ 0,..., 3 ]

julia> tPa = RelativeTruthMorphismOfTrue( a )
|1| → |4|

julia> Display( tPa )
[ 0 ] ⱶ[ 3 ]→ [ 0,..., 3 ]

julia> nPa = RelativeTruthMorphismOfNot( a )
|4| → |4|

julia> Display( nPa )
[ 0,..., 3 ] ⱶ[ 3, 2, 1, 0 ]→ [ 0,..., 3 ]

julia> aPa = RelativeTruthMorphismOfAnd( a )
|16| → |4|

julia> Display( aPa )
[ 0,..., 15 ] ⱶ[ 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 2, 2, 0, 1, 2, 3 ]→ [ 0,..., 3 ]

julia> oPa = RelativeTruthMorphismOfOr( a )
|16| → |4|

julia> Display( oPa )
[ 0,..., 15 ] ⱶ[ 0, 1, 2, 3, 1, 1, 3, 3, 2, 3, 2, 3, 3, 3, 3, 3 ]→ [ 0,..., 3 ]

julia> iPa = RelativeTruthMorphismOfImplies( a )
|16| → |4|

julia> Display( iPa )
[ 0,..., 15 ] ⱶ[ 3, 2, 1, 0, 3, 3, 1, 1, 3, 2, 3, 2, 3, 3, 3, 3 ]→ [ 0,..., 3 ]

```
