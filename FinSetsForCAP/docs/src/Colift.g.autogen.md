
```jldoctest Colift.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Colift.g

julia> true
true

julia> m = FinSet( (1):(3) )
<An object in FinSets>

julia> n = FinSet( (1):(4) )
<An object in FinSets>

julia> alpha = MapOfFinSets( m, [ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ] ], n )
<A morphism in FinSets>

julia> beta = MapOfFinSets( m, [ [ 1, 2 ], [ 2, 2 ], [ 3, 1 ] ], m )
<A morphism in FinSets>

julia> IsColiftable( alpha, beta )
true

julia> chi = Colift( alpha, beta )
<A morphism in FinSets>

julia> Display( chi )
[ [ 1 .. 4 ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 1 ], [ 4, 1 ] ], [ 1 .. 3 ] ]

julia> PreCompose( alpha, Colift( alpha, beta ) ) == beta
true

julia> IsColiftable( beta, alpha )
false

julia> k = FinSet( (1):(3) )
<An object in FinSets>

julia> h = MapOfFinSets( m, [ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ] ], k )
<A morphism in FinSets>

julia> IsColiftable( h, beta )
true

julia> IsColiftable( beta, h )
false

```
