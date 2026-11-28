
```jldoctest DPO_FinSets.g
julia> using CAP, CartesianCategories, FinSetsForCAP, Toposes

julia> # extracted from examples/DPO_FinSets.g

julia> true
true

julia> K = FinSet( [ 2, 3, 5 ] );

julia> Length( K )
3

julia> Display( K )
[ 2, 3, 5 ]

julia> L = FinSet( [ 0, 1, 2, 3, 5, 6 ] );

julia> Length( L )
6

julia> Display( L )
[ 0, 1, 2, 3, 5, 6 ]

julia> R = FinSet( [ 2, 3, 4, 5, 7 ] );

julia> Length( R )
5

julia> Display( R )
[ 2, 3, 4, 5, 7 ]

julia> l = EmbeddingOfFinSets( K, L )
<A morphism in FinSets>

julia> r = EmbeddingOfFinSets( K, R )
<A morphism in FinSets>

```

```jldoctest DPO_FinSets.g
julia> using CAP, CartesianCategories, FinSetsForCAP, Toposes

julia> # extracted from examples/DPO_FinSets.g

julia> G = FinSet( [ 0, 1, 2, 3, 4, 5, 6, 10 ] );

julia> Length( G )
8

julia> Display( G )
[ 0, 1, 2, 3, 4, 5, 6, 10 ]

julia> m = EmbeddingOfFinSets( L, G )
<A morphism in FinSets>

```

```jldoctest DPO_FinSets.g
julia> using CAP, CartesianCategories, FinSetsForCAP, Toposes

julia> # extracted from examples/DPO_FinSets.g

julia> p = DPO( m, l, r );

julia> h = p[1]
<A morphism in FinSets>

julia> p = p[2]
<A morphism in FinSets>

julia> H = Target( p );

julia> Length( H )
7

julia> Display( H )
[ [ [ 1, 2 ], [ 2, 2 ] ], [ [ 1, 3 ], [ 2, 3 ] ], [ [ 1, 4 ] ], [ [ 1, 5 ], [ 2, 5 ] ], [ [ 1, 10 ] ], [ [ 2, 4 ] ], [ [ 2, 7 ] ] ]

```
