
```jldoctest IsEqualForElementsOfFinSets.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/doc/IsEqualForElementsOfFinSets.g

julia> true
true

julia> IsEqualForElementsOfFinSets( 2, 2 )
true

julia> IsEqualForElementsOfFinSets( 2, "2" )
false

julia> IsEqualForElementsOfFinSets( 'a', 'a' )
true

julia> IsEqualForElementsOfFinSets( 'a', 'b' )
false

julia> IsEqualForElementsOfFinSets( [ 2 ], [ 2 ] )
true

julia> IsEqualForElementsOfFinSets( [ 2 ], [ 2, 3 ] )
false

julia> IsEqualForElementsOfFinSets( @rec( a = "a", b = "b" ),
                                     @rec( b = "b", a = "a" )
                                   )
true

julia> IsEqualForElementsOfFinSets( @rec( a = "a", b = "b" ),
                                     @rec( a = "a" )
                                   )
false

julia> IsEqualForElementsOfFinSets( @rec( a = "a", b = "b" ),
                                     @rec( a = "a", b = "notb" )
                                   )
false

julia> M = FinSet( [ ] );

julia> N = FinSet( [ ] );

julia> m = FinSet( 0 );

julia> id_M = IdentityMorphism( M );

julia> id_N = IdentityMorphism( N );

julia> id_m = IdentityMorphism( m );

julia> IsEqualForElementsOfFinSets( M, N )
true

julia> IsEqualForElementsOfFinSets( M, m )
false

julia> IsEqualForElementsOfFinSets( id_M, id_N )
true

julia> IsEqualForElementsOfFinSets( id_M, id_m )
false

julia> IsEqualForElementsOfFinSets( FinSets, SkeletalFinSets )
false

```
