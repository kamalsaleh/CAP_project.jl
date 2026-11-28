
```jldoctest SkeletalRandomMethods.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/SkeletalRandomMethods.g

julia> true
true

julia> L = [ 10, 20, 50, 100, 500 ];

julia> obj0 = RandomObjectByInteger( SkeletalFinSets, 0 );

julia> IsWellDefined( obj0 )
true

julia> obj1 = RandomObjectByList( SkeletalFinSets, L );

julia> IsWellDefined( obj1 )
true

julia> Cardinality( obj1 ) in L
true

julia> obj2 = RandomObjectByInteger( SkeletalFinSets, 10 );

julia> IsWellDefined( obj2 )
true

julia> mor0 = RandomMorphismWithFixedSourceAndRangeByInteger( 
                        SkeletalFinSets, obj0, obj0, 10 );

julia> IsWellDefined( mor0 )
true

julia> mor1 = RandomMorphismWithFixedSourceAndRangeByInteger( 
                        SkeletalFinSets, obj1, obj1, 10 );

julia> IsWellDefined( mor1 )
true

julia> mor2 = RandomMorphismByList( SkeletalFinSets, [ L, L ] );

julia> IsWellDefined( mor2 )
true

julia> Cardinality( Source( mor2 ) ) in L  &&
            Cardinality( Range( mor2 ) ) in L 
true

julia> mor03 = RandomMorphismByInteger( SkeletalFinSets, 0 );

julia> IsWellDefined( mor03 )
true

julia> mor4 = RandomMorphismByInteger( SkeletalFinSets, 10 );

julia> IsWellDefined( mor4 )
true

julia> mor5 = RandomMorphismWithFixedSourceByInteger( 
                        SkeletalFinSets, obj1, 10 );

julia> IsWellDefined( mor5 )
true

julia> mor06 = RandomMorphismWithFixedRangeByInteger( 
                         SkeletalFinSets, obj0, 10 );

julia> IsWellDefined( mor06 )
true

julia> mor7 = RandomMorphismWithFixedRangeByInteger( 
                        SkeletalFinSets, obj1, 10 );

julia> IsWellDefined( mor7 )
true

julia> mor8 = RandomMorphismWithFixedSourceByList( 
                        SkeletalFinSets, obj1, [ 10 ] );

julia> IsWellDefined( mor8 )
true

julia> mor09 = RandomMorphismWithFixedRangeByList( 
                         SkeletalFinSets, obj0, [ 0 ] );

julia> IsWellDefined( mor09 )
true

julia> mor10 = RandomMorphismWithFixedRangeByList( 
                         SkeletalFinSets, obj1, [ 10 ] );

julia> IsWellDefined( mor10 )
true

julia> mor11 = RandomMorphismWithFixedSourceAndRangeByList( 
                         SkeletalFinSets, obj2, obj2, [ 10 ] );

julia> IsWellDefined( mor11 )
true

```
