
```jldoctest AdditiveClosureMonoidal.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/AdditiveClosureMonoidal.g

julia> true
true

julia> T = TerminalCategoryWithMultipleObjects( )
TerminalCategoryWithMultipleObjects( )

julia> A = "A" / T
<An object in TerminalCategoryWithMultipleObjects( )>

julia> B = "B" / T
<An object in TerminalCategoryWithMultipleObjects( )>

julia> AT = AdditiveClosure( T )
AdditiveClosure( TerminalCategoryWithMultipleObjects( ) )

julia> ABAA = [ A, B, A, A ] / AT
<An object in AdditiveClosure( TerminalCategoryWithMultipleObjects( ) ) defined by 4 underlying objects>

julia> BAB = [ B, A, B ] / AT
<An object in AdditiveClosure( TerminalCategoryWithMultipleObjects( ) ) defined by 3 underlying objects>

julia> AB = [ A, B ] / AT
<An object in AdditiveClosure( TerminalCategoryWithMultipleObjects( ) ) defined by 2 underlying objects>

julia> mor_AB = MorphismConstructor( A, "A -> B", B )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> mor_BA = MorphismConstructor( B, "B -> A", A )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> id_A = IdentityMorphism( A )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> id_B = IdentityMorphism( B )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> alpha = MorphismConstructor( ABAA,
          [ [ mor_AB, id_A, mor_AB ],
            [ id_B, mor_BA, id_B ],
            [ mor_AB, id_A, mor_AB ],
            [ mor_AB, id_A, mor_AB ] ],
            BAB )
<A morphism in AdditiveClosure( TerminalCategoryWithMultipleObjects( ) ) defined by a 4 x 3 matrix of underlying morphisms>

julia> IsWellDefined( alpha )
true

julia> alpha2 = TensorProduct( alpha, alpha )
<A morphism in AdditiveClosure( TerminalCategoryWithMultipleObjects( ) ) defined by a 16 x 9 matrix of underlying morphisms>

julia> IsWellDefined( alpha2 )
true

julia> IsIsomorphism( alpha2 )
true

julia> left = LeftUnitor( ABAA )
<A morphism in AdditiveClosure( TerminalCategoryWithMultipleObjects( ) ) defined by a 4 x 4 matrix of underlying morphisms>

julia> IsWellDefined( left )
true

julia> left_inv = LeftUnitorInverse( ABAA )
<A morphism in AdditiveClosure( TerminalCategoryWithMultipleObjects( ) ) defined by a 4 x 4 matrix of underlying morphisms>

julia> PreCompose( left, left_inv ) == IdentityMorphism( Source( left ) )
true

julia> PreCompose( left_inv, left ) == IdentityMorphism( Range( left ) )
true

julia> right = RightUnitor( BAB )
<A morphism in AdditiveClosure( TerminalCategoryWithMultipleObjects( ) ) defined by a 3 x 3 matrix of underlying morphisms>

julia> IsWellDefined( right )
true

julia> right_inv = RightUnitorInverse( BAB )
<A morphism in AdditiveClosure( TerminalCategoryWithMultipleObjects( ) ) defined by a 3 x 3 matrix of underlying morphisms>

julia> PreCompose( right, right_inv ) == IdentityMorphism( Source( right ) )
true

julia> PreCompose( right_inv, right ) == IdentityMorphism( Range( right ) )
true

julia> aslr = AssociatorLeftToRight( AB, BAB, AB )
<A morphism in AdditiveClosure( TerminalCategoryWithMultipleObjects( ) ) defined by a 12 x 12 matrix of underlying morphisms>

julia> IsWellDefined( aslr )
true

julia> asrl = AssociatorRightToLeft( AB, BAB, AB )
<A morphism in AdditiveClosure( TerminalCategoryWithMultipleObjects( ) ) defined by a 12 x 12 matrix of underlying morphisms>

julia> PreCompose( aslr, asrl ) == IdentityMorphism( Source( aslr ) )
true

julia> PreCompose( asrl, aslr ) == IdentityMorphism( Range( aslr ) )
true

```
