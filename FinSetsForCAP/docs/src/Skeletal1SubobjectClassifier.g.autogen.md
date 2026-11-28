
```jldoctest Skeletal1SubobjectClassifier.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1SubobjectClassifier.g

julia> true
true

julia> SubobjectClassifier( SkeletalFinSets1 )
|2|

julia> Display( TruthMorphismOfFalse( SkeletalFinSets1 ) )
[ 1 ] ⱶ[ 1 ]→ [ 1, 2 ]

julia> Display( TruthMorphismOfTrue( SkeletalFinSets1 ) )
[ 1 ] ⱶ[ 2 ]→ [ 1, 2 ]

julia> Display( TruthMorphismOfNot( SkeletalFinSets1 ) )
[ 1, 2 ] ⱶ[ 2, 1 ]→ [ 1, 2 ]

julia> CartesianSquareOfSubobjectClassifier( SkeletalFinSets1 )
|4|

julia> Display( TruthMorphismOfAnd( SkeletalFinSets1 ) )
[ 1,..., 4 ] ⱶ[ 1, 1, 1, 2 ]→ [ 1, 2 ]

julia> Display( TruthMorphismOfOr( SkeletalFinSets1 ) )
[ 1,..., 4 ] ⱶ[ 1, 2, 2, 2 ]→ [ 1, 2 ]

julia> Display( TruthMorphismOfImplies( SkeletalFinSets1 ) )
[ 1,..., 4 ] ⱶ[ 2, 1, 2, 2 ]→ [ 1, 2 ]

julia> S = FinSet1( 5 )
|5|

julia> A = FinSet1( 2 )
|2|

julia> m = MapOfFinSets( A, [ 1, 5 ], S )
|2| → |5|

julia> Display( ClassifyingMorphismOfSubobject( m ) )
[ 1,..., 5 ] ⱶ[ 2, 1, 1, 1, 2 ]→ [ 1, 2 ]

```
