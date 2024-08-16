
```jldoctest
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP

julia> true
true

julia> QQ = HomalgFieldOfRationals( );

julia> vec = CategoryOfRows_as_AdditiveClosure_RingAsCategory( QQ )
Rows( Q )

julia> a = CategoryOfRowsObject( vec, 3 )
<A row module over Q of rank 3>

julia> IsProjective( a )
true

julia> b = CategoryOfRowsObject( vec, 4 )
<A row module over Q of rank 4>

julia> DirectSum( a, b )
<A row module over Q of rank 7>

julia> ZeroObject( vec )
<A row module over Q of rank 0>

julia> ZeroMorphism( a, b )
<A morphism in Rows( Q )>

julia> homalg_matrix = HomalgMatrix( [ [ 1, 0, 0, 0 ],
                                         [ 0, 1, 0, -1 ],
                                         [ -1, 0, 2, 1 ] ], 3, 4, QQ )
<A 3 x 4 matrix over an internal ring>

julia> alpha = CategoryOfRowsMorphism( a, homalg_matrix, b )
<A morphism in Rows( Q )>

julia> Display( alpha )
Source: 
A row module over Q of rank 3

Matrix: 
[ [   1,   0,   0,   0 ],
  [   0,   1,   0,  -1 ],
  [  -1,   0,   2,   1 ] ]

Range: 
A row module over Q of rank 4

A morphism in Rows( Q )

julia> homalg_matrix = HomalgMatrix( [ [ 1, 1, 0, 0 ],
                                         [ 0, 1, 0, -1 ],
                                         [ -1, 0, 2, 1 ] ], 3, 4, QQ )
<A 3 x 4 matrix over an internal ring>

julia> beta = CategoryOfRowsMorphism( a, homalg_matrix, b )
<A morphism in Rows( Q )>

julia> gamma = UniversalMorphismIntoDirectSum( [ alpha, alpha ] );

julia> Display( gamma )
Source: 
A row module over Q of rank 3

Matrix: 
[ [   1,   0,   0,   0,   1,   0,   0,   0 ],
  [   0,   1,   0,  -1,   0,   1,   0,  -1 ],
  [  -1,   0,   2,   1,  -1,   0,   2,   1 ] ]

Range: 
A row module over Q of rank 8

A morphism in Rows( Q )

julia> IsEqualForMorphisms( ComponentOfMorphismIntoDirectSum( gamma, [ b, b ], 1 ), alpha )
true

julia> IsEqualForMorphisms( ComponentOfMorphismIntoDirectSum( gamma, [ b, b ], 2 ), alpha )
true

julia> gamma = UniversalMorphismFromDirectSum( [ beta, beta ] );

julia> Display( gamma )
Source: 
A row module over Q of rank 6

Matrix: 
[ [   1,   1,   0,   0 ],
  [   0,   1,   0,  -1 ],
  [  -1,   0,   2,   1 ],
  [   1,   1,   0,   0 ],
  [   0,   1,   0,  -1 ],
  [  -1,   0,   2,   1 ] ]

Range: 
A row module over Q of rank 4

A morphism in Rows( Q )

julia> IsEqualForMorphisms( ComponentOfMorphismFromDirectSum( gamma, [ a, a ], 1 ), beta )
true

julia> IsEqualForMorphisms( ComponentOfMorphismFromDirectSum( gamma, [ a, a ], 2 ), beta )
true

julia> a = RandomObject( vec, 100 );

julia> b = RandomObject( vec, [100] );

julia> IsEqualForObjects( Range( RandomMorphismWithFixedSourceAndRange( a, b, 10 ) ), b ) && IsEqualForObjects( Source( RandomMorphismWithFixedSourceAndRange( a, b, [10] ) ), a )
true

julia> IsEqualForObjects( Source( RandomMorphismWithFixedSource( a, 10 ) ), a ) && IsEqualForObjects( Source( RandomMorphismWithFixedSource( a, [10] ) ), a )
true

julia> IsEqualForObjects( Range( RandomMorphismWithFixedRange( b, 10 ) ), b ) && IsEqualForObjects( Range( RandomMorphismWithFixedRange( b, [10] ) ), b )
true

julia> IsWellDefinedForMorphisms( RandomMorphism( vec, 10 ) ) && IsWellDefinedForMorphisms( RandomMorphism( vec, [10] ) )
true

julia> a = RandomObject( ModelingCategory( vec ), 20 );

julia> b = RandomObject( ModelingCategory( vec ), [[10],[5]] );

julia> IsEqualForObjects( Range( RandomMorphismWithFixedSourceAndRange( a, b, 10 ) ), b ) && IsEqualForObjects( Source( RandomMorphismWithFixedSourceAndRange( a, b, [10] ) ), a )
true

julia> IsEqualForObjects( Source( RandomMorphismWithFixedSource( a, 10 ) ), a ) && IsEqualForObjects( Source( RandomMorphismWithFixedSource( a, [[[10],[5]],[5]] ) ), a )
true

julia> IsEqualForObjects( Range( RandomMorphismWithFixedRange( b, 10 ) ), b ) && IsEqualForObjects( Range( RandomMorphismWithFixedRange( b, [[[10],[5]],[5]] ) ), b )
true

julia> IsWellDefinedForMorphisms( RandomMorphism( ModelingCategory( vec ), 10 ) ) && IsWellDefinedForMorphisms( RandomMorphism( ModelingCategory( vec ), [[[10],[5]],[[10],[5]],[10]] ) )
true

julia> QQ = HomalgFieldOfRationalsInSingular( );

julia> QQxy = QQ * "x,y";

julia> EQQxy = KoszulDualRing( QQxy );

julia> rows = CategoryOfRows( EQQxy );

julia> mor = IdentityMorphism( CategoryOfRowsObject( rows, 5 ) );

julia> distinguished_object = DistinguishedObjectOfHomomorphismStructure( rows );

julia> object = HomomorphismStructureOnObjects( Source( mor ), Source( mor ) );

julia> HomomorphismStructureOnMorphisms( mor, mor );

julia> HomomorphismStructureOnMorphismsWithGivenObjects( object, mor, mor, object );

julia> iota = InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( mor );

julia> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( distinguished_object, mor, object );

julia> beta = InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( mor ), Range( mor ), iota );

julia> IsCongruentForMorphisms( mor, beta )
true

```
