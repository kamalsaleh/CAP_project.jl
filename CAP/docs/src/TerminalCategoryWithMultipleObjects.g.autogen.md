
```jldoctest TerminalCategoryWithMultipleObjects.g
julia> using CAP

julia> # extracted from examples/TerminalCategoryWithMultipleObjects.g

julia> true
true

julia> T = TerminalCategoryWithMultipleObjects( )
TerminalCategoryWithMultipleObjects( )

julia> i = InitialObject( T )
<An object in TerminalCategoryWithMultipleObjects( )>

julia> t = TerminalObject( T )
<An object in TerminalCategoryWithMultipleObjects( )>

julia> z = ZeroObject( T )
<An object in TerminalCategoryWithMultipleObjects( )>

julia> Display( i )
InitialObject(  )

julia> Display( t )
TerminalObject(  )

julia> Display( z )
ZeroObject(  )

julia> IsIdenticalObj( i, z )
false

julia> IsIdenticalObj( t, z )
false

julia> id_z = IdentityMorphism( z )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> fn_z = ZeroObjectFunctorial( T )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> IsEqualForMorphisms( id_z, fn_z )
false

julia> IsCongruentForMorphisms( id_z, fn_z )
true

julia> a = "a" / T
<An object in TerminalCategoryWithMultipleObjects( )>

julia> Display( a )
a

julia> IsWellDefined( a )
true

julia> aa = ObjectConstructor( T, "a" )
<An object in TerminalCategoryWithMultipleObjects( )>

julia> Display( aa )
a

julia> IsEqualForObjects( a, aa )
true

julia> IsIsomorphicForObjects( a, aa )
true

julia> IsIsomorphism( SomeIsomorphismBetweenObjects( a, aa ) )
true

julia> b = "b" / T
<An object in TerminalCategoryWithMultipleObjects( )>

julia> Display( b )
b

julia> IsEqualForObjects( a, b )
false

julia> IsIsomorphicForObjects( a, b )
true

julia> mor_ab = SomeIsomorphismBetweenObjects( a, b )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> IsIsomorphism( mor_ab )
true

julia> Display( mor_ab )
a
|
| SomeIsomorphismBetweenObjects
v
b

julia> Hom_ab = MorphismsOfExternalHom( a, b );

julia> Length( Hom_ab )
1

julia> Hom_ab[1]
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> Display( Hom_ab[1] )
a
|
| InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism
v
b

julia> Hom_ab[1] == mor_ab
true

julia> HomStructure( mor_ab )
<A morphism in TerminalCategoryWithSingleObject( )>

julia> m = MorphismConstructor( a, "m", b )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> Display( m )
a
|
| m
v
b

julia> IsWellDefined( m )
true

julia> n = MorphismConstructor( a, "n", b )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> Display( n )
a
|
| n
v
b

julia> IsEqualForMorphisms( m, n )
false

julia> IsCongruentForMorphisms( m, n )
true

julia> m == n
true

julia> hom_mn = HomStructure( m, n )
<A morphism in TerminalCategoryWithSingleObject( )>

julia> id = IdentityMorphism( a )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> Display( id )
a
|
| IdentityMorphism( a )
v
a

julia> m == id
false

julia> id == MorphismConstructor( a, "xyz", a )
true

julia> zero = ZeroMorphism( a, a )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> Display( zero )
a
|
| ZeroMorphism( a, a )
v
a

julia> id == zero
true

julia> IsLiftable( m, n )
true

julia> lift = Lift( m, n )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> Display( lift )
a
|
| Lift( m, n )
v
a

julia> IsColiftable( m, n )
true

julia> colift = Colift( m, n )
<A morphism in TerminalCategoryWithMultipleObjects( )>

julia> Display( colift )
b
|
| Colift( m, n )
v
b

julia> DirectProduct( T, [ ] )
<An object in TerminalCategoryWithMultipleObjects( )>

julia> Equalizer( T, z, [ ] )
<An object in TerminalCategoryWithMultipleObjects( )>

julia> Coproduct( T, [ ] )
<An object in TerminalCategoryWithMultipleObjects( )>

julia> Coequalizer( T, z, [ ] )
<An object in TerminalCategoryWithMultipleObjects( )>

```
