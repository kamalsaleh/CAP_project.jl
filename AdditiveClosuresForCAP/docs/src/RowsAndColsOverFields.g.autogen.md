
```jldoctest RowsAndColsOverFields.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/RowsAndColsOverFields.g

julia> Q = HomalgFieldOfRationals();

julia> RowsQ = CategoryOfRows( Q );

julia> a = 3/RowsQ;

julia> b = 4/RowsQ;

julia> IsProjective( a )
true

julia> homalg_matrix = HomalgMatrix( [ [ 1, 0, 0, 0 ],
                                          [ 0, 1, 0, -1 ],
                                          [ -1, 0, 2, 1 ] ], 3, 4, Q );

julia> alpha = homalg_matrix/RowsQ;

julia> homalg_matrix = HomalgMatrix( [ [ 1, 1, 0, 0 ],
                                          [ 0, 1, 0, -1 ],
                                          [ -1, 0, 2, 1 ] ], 3, 4, Q );

julia> beta = homalg_matrix/RowsQ;

julia> IsWellDefined( CokernelObject( alpha ) )
true

julia> c = CokernelProjection( alpha );

julia> gamma = UniversalMorphismIntoDirectSum( [ c, c ] );

julia> colift = CokernelColift( alpha, gamma );

julia> IsEqualForMorphisms( PreCompose( c, colift ), gamma )
true

julia> FiberProduct( alpha, beta );

julia> F = FiberProduct( alpha, beta );

julia> IsWellDefined( F )
true

julia> IsWellDefined( ProjectionInFactorOfFiberProduct( [ alpha, beta ], 1 ) )
true

julia> IsWellDefined( Pushout( alpha, beta ) )
true

julia> i1 = InjectionOfCofactorOfPushout( [ alpha, beta ], 1 );

julia> i2 = InjectionOfCofactorOfPushout( [ alpha, beta ], 2 );

julia> u = UniversalMorphismFromDirectSum( [ b, b ], [ i1, i2 ] );

julia> KernelObjectFunctorial( u, IdentityMorphism( Source( u ) ), u ) == IdentityMorphism( 3/RowsQ )
true

julia> IsZeroForMorphisms( CokernelObjectFunctorial( u, IdentityMorphism( Range( u ) ), u ) )
true

julia> DirectProductFunctorial( [ u, u ] ) == DirectSumFunctorial( [ u, u ] )
true

julia> CoproductFunctorial( [ u, u ] ) == DirectSumFunctorial( [ u, u ] )
true

julia> IsCongruentForMorphisms(
            FiberProductFunctorial( [ u, u ], [ IdentityMorphism( Source( u ) ), IdentityMorphism( Source( u ) ) ], [ u, u ] ),
            IdentityMorphism( FiberProduct( [ u, u ] ) )
        )
true

julia> IsCongruentForMorphisms(
            PushoutFunctorial( [ u, u ], [ IdentityMorphism( Range( u ) ), IdentityMorphism( Range( u ) ) ], [ u, u ] ),
            IdentityMorphism( Pushout( [ u, u ] ) )
        )
true

julia> IsCongruentForMorphisms( ((1/2) / Q) * alpha, alpha * ((1/2) / Q) )
true

julia> RankOfObject( HomomorphismStructureOnObjects( a, b ) ) == RankOfObject( a ) * RankOfObject( b )
true

julia> IsCongruentForMorphisms(
            PreCompose( [ u, DualOnMorphisms( i1 ), DualOnMorphisms( alpha ) ] ),
            InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( u ), Source( alpha ),
                 PreCompose(
                     InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( DualOnMorphisms( i1 ) ),
                     HomomorphismStructureOnMorphisms( u, DualOnMorphisms( alpha ) )
                 )
            )
        )
true

```

```jldoctest RowsAndColsOverFields.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/RowsAndColsOverFields.g

julia> Q = HomalgFieldOfRationals();

julia> ColsQ = CategoryOfColumns( Q );

julia> a = 3/ColsQ;

julia> b = 4/ColsQ;

julia> IsProjective( a )
true

julia> homalg_matrix = HomalgMatrix( [ [ 1, 0, 0, 0 ],
                                          [ 0, 1, 0, -1 ],
                                          [ -1, 0, 2, 1 ] ], 3, 4, Q );

julia> homalg_matrix = TransposedMatrix( homalg_matrix );

julia> alpha = homalg_matrix/ColsQ;

julia> homalg_matrix = HomalgMatrix( [ [ 1, 1, 0, 0 ],
                                          [ 0, 1, 0, -1 ],
                                          [ -1, 0, 2, 1 ] ], 3, 4, Q );

julia> homalg_matrix = TransposedMatrix( homalg_matrix );

julia> beta = homalg_matrix/ColsQ;

julia> IsWellDefined( CokernelObject( alpha ) )
true

julia> c = CokernelProjection( alpha );

julia> gamma = UniversalMorphismIntoDirectSum( [ c, c ] );

julia> colift = CokernelColift( alpha, gamma );

julia> IsEqualForMorphisms( PreCompose( c, colift ), gamma )
true

julia> FiberProduct( alpha, beta );

julia> F = FiberProduct( alpha, beta );

julia> IsWellDefined( F )
true

julia> IsWellDefined( ProjectionInFactorOfFiberProduct( [ alpha, beta ], 1 ) )
true

julia> IsWellDefined( Pushout( alpha, beta ) )
true

julia> i1 = InjectionOfCofactorOfPushout( [ alpha, beta ], 1 );

julia> i2 = InjectionOfCofactorOfPushout( [ alpha, beta ], 2 );

julia> u = UniversalMorphismFromDirectSum( [ b, b ], [ i1, i2 ] );

julia> KernelObjectFunctorial( u, IdentityMorphism( Source( u ) ), u ) == IdentityMorphism( 3/ColsQ )
true

julia> IsZeroForMorphisms( CokernelObjectFunctorial( u, IdentityMorphism( Range( u ) ), u ) )
true

julia> DirectProductFunctorial( [ u, u ] ) == DirectSumFunctorial( [ u, u ] )
true

julia> CoproductFunctorial( [ u, u ] ) == DirectSumFunctorial( [ u, u ] )
true

julia> IsCongruentForMorphisms(
            FiberProductFunctorial( [ u, u ], [ IdentityMorphism( Source( u ) ), IdentityMorphism( Source( u ) ) ], [ u, u ] ),
            IdentityMorphism( FiberProduct( [ u, u ] ) )
        )
true

julia> IsCongruentForMorphisms(
            PushoutFunctorial( [ u, u ], [ IdentityMorphism( Range( u ) ), IdentityMorphism( Range( u ) ) ], [ u, u ] ),
            IdentityMorphism( Pushout( [ u, u ] ) )
        )
true

julia> IsCongruentForMorphisms( ((1/2) / Q) * alpha, alpha * ((1/2) / Q) )
true

julia> RankOfObject( HomomorphismStructureOnObjects( a, b ) ) == RankOfObject( a ) * RankOfObject( b )
true

julia> IsCongruentForMorphisms(
            PreCompose( [ u, DualOnMorphisms( i1 ), DualOnMorphisms( alpha ) ] ),
            InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( u ), Source( alpha ),
                 PreCompose(
                     InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( DualOnMorphisms( i1 ) ),
                     HomomorphismStructureOnMorphisms( u, DualOnMorphisms( alpha ) )
                 )
            )
        )
true

```
