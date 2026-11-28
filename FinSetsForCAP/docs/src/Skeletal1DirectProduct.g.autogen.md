
```jldoctest Skeletal1DirectProduct.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1DirectProduct.g

julia> true
true

julia> m = FinSet1( 7 )
|7|

julia> n = FinSet1( 3 )
|3|

julia> p = FinSet1( 4 )
|4|

julia> d = DirectProduct( [ m, n, p ] )
|84|

julia> Display( AsList( d ) )
[ 1 .. 84 ]

julia> pi1 = ProjectionInFactorOfDirectProduct( [ m, n, p ], 1 )
|84| → |7|

julia> Display( pi1 )
[ 1,..., 84 ] ⱶ[ 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7 ]→ [ 1,..., 7 ]

julia> pi2 = ProjectionInFactorOfDirectProduct( [ m, n, p ], 2 )
|84| → |3|

julia> Display( pi2 )
[ 1,..., 84 ] ⱶ[ 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3 ]→ [ 1, 2, 3 ]

julia> pi3 = ProjectionInFactorOfDirectProduct( [ m, n, p ], 3 )
|84| → |4|

julia> Display( pi3 )
[ 1,..., 84 ] ⱶ[ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 ]→ [ 1,..., 4 ]

julia> psi = UniversalMorphismIntoDirectProduct( [ m, n, p ], [ pi1, pi2, pi3 ] )
|84| → |84|

julia> psi == IdentityMorphism( d )
true

```
