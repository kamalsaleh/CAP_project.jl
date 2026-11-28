
```jldoctest Skeletal1IsInjective.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1IsInjective.g

julia> true
true

julia> I = FinSet1( 0 )
|0|

julia> T = FinSet1( 1 )
|1|

julia> M = FinSet1( 2 )
|2|

julia> IsInjective( I )
false

julia> IsInjective( T )
true

julia> IsInjective( M )
true

julia> IsIsomorphism( MonomorphismIntoSomeInjectiveObject( I ) )
false

julia> IsMonomorphism( MonomorphismIntoSomeInjectiveObject( I ) )
true

julia> IsOne( MonomorphismIntoSomeInjectiveObject( M ) )
true

```
