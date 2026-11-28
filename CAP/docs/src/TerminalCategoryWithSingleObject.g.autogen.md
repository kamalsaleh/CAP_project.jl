
```jldoctest TerminalCategoryWithSingleObject.g
julia> using CAP

julia> # extracted from examples/TerminalCategoryWithSingleObject.g

julia> true
true

julia> T = TerminalCategoryWithSingleObject( )
TerminalCategoryWithSingleObject( )

julia> i = InitialObject( T )
<An object in TerminalCategoryWithSingleObject( )>

julia> t = TerminalObject( T )
<An object in TerminalCategoryWithSingleObject( )>

julia> z = ZeroObject( T )
<An object in TerminalCategoryWithSingleObject( )>

julia> Display( i )
An object in TerminalCategoryWithSingleObject( ).

julia> Display( t )
An object in TerminalCategoryWithSingleObject( ).

julia> Display( z )
An object in TerminalCategoryWithSingleObject( ).

julia> IsIdenticalObj( i, z )
false

julia> IsIdenticalObj( t, z )
false

julia> IsWellDefined( z )
true

julia> Length( SetOfObjects( T ) )
1

julia> id_z = IdentityMorphism( z )
<A morphism in TerminalCategoryWithSingleObject( )>

julia> fn_z = ZeroObjectFunctorial( T )
<A morphism in TerminalCategoryWithSingleObject( )>

julia> IsWellDefined( fn_z )
true

julia> IsEqualForMorphisms( id_z, fn_z )
true

julia> IsCongruentForMorphisms( id_z, fn_z )
true

julia> Length( SetOfMorphisms( T ) )
1

julia> IsLiftable( id_z, fn_z )
true

julia> Lift( id_z, fn_z )
<A morphism in TerminalCategoryWithSingleObject( )>

julia> IsColiftable( id_z, fn_z )
true

julia> Colift( id_z, fn_z )
<A morphism in TerminalCategoryWithSingleObject( )>

julia> DirectProduct( T, [ ] )
<An object in TerminalCategoryWithSingleObject( )>

julia> Equalizer( T, z, [ ] )
<An object in TerminalCategoryWithSingleObject( )>

julia> Coproduct( T, [ ] )
<An object in TerminalCategoryWithSingleObject( )>

julia> Coequalizer( T, z, [ ] )
<An object in TerminalCategoryWithSingleObject( )>

```
