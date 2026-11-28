
```jldoctest ImportExport.g
julia> using CAP, MonoidalCategories, ZXCalculusForCAP

julia> # extracted from examples/ImportExport.g

julia> true
true

julia> ZX
CategoryOfZXDiagrams( )

julia> X_1_2 = X_Spider( 1, 2 )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefinedForMorphisms( X_1_2 )
true

julia> Z_2_1 = Z_Spider( 2, 1 )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefinedForMorphisms( Z_2_1 )
true

julia> X_1_2_Z_2_1 = PreCompose( X_1_2, Z_2_1 )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefinedForMorphisms( X_1_2_Z_2_1 )
true

julia> tmp_dir = DirectoryTemporary( );

julia> ExportAsQGraphFile( X_1_2_Z_2_1, Filename( tmp_dir, "X_1_2_Z_2_1" ) )

julia> reimported = ImportFromQGraphFile( ZX, Filename( tmp_dir, "X_1_2_Z_2_1" ) )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefinedForMorphisms( reimported )
true

julia> json = ExportAsQGraphString( X_1_2_Z_2_1 );

julia> mor1 = ImportFromQGraphString( ZX, json );

julia> json2 = ExportAsQGraphString( mor1 );

julia> mor2 = ImportFromQGraphString( ZX, json2 );

julia> json3 = ExportAsQGraphString( mor2 );

julia> mor3 = ImportFromQGraphString( ZX, json3 );

julia> IsEqualForMorphisms( mor2, mor3 ) && json2 == json3
true

```
