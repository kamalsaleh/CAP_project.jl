
```jldoctest MapOfFinSets.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/doc/MapOfFinSets.g

julia> true
true

julia> S = FinSet( [ 1, 3, 2, 2, 1 ] )
<An object in FinSets>

julia> T = FinSet( [ "a", "b", "c" ] )
<An object in FinSets>

julia> G = [ [ 1, "b" ], [ 3, "b" ], [ 2, "a" ] ];

julia> phi = MapOfFinSets( S, G, T )
<A morphism in FinSets>

julia> IsWellDefined( phi )
true

julia> Display( AsList( phi ) )
[ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ]

julia> phi2 = MorphismConstructor( S, G, T )
<A morphism in FinSets>

julia> Display( MorphismDatum( phi2 ) )
[ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ]

julia> phi == phi2
true

julia> phi( 1 )
"b"

julia> phi( 2 )
"a"

julia> phi( 3 )
"b"

julia> Display( List( S, phi ) )
[ "b", "a", "b" ]

julia> psi = [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];

julia> psi = MapOfFinSets( S, psi, T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
true

julia> phi == psi
true

julia> psi = MapOfFinSets( S, [ [ 1, "d" ], [ 3, "b" ] ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( S, [ 1, 2, 3 ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( S, [ [ 1, "b" ], [ 3, "b" ], [ 2, "a", "b" ] ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( S, [ [ 5, "b" ], [ 3, "b" ], [ 2, "a" ] ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( S, [ [ 1, "d" ], [ 3, "b" ], [ 2, "a" ] ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( S, [ [ 1, "b" ], [ 2, "b" ], [ 2, "a" ] ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

```
