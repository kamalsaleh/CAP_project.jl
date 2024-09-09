

julia> true
true

julia> Length( ListInstalledOperationsOfCategory( SkeletalFinSets ) )
348

julia> BooleanAlgebras = Opposite( SkeletalFinSets )
Opposite( SkeletalFinSets )

julia> Length( ListPrimitivelyInstalledOperationsOfCategory( BooleanAlgebras ) )
257

julia> Length( ListInstalledOperationsOfCategory( BooleanAlgebras ) )
273

julia> Opposite( BooleanAlgebras )
SkeletalFinSets

julia> FS = Opposite( WrapperCategory( BooleanAlgebras, @rec( ) ) )
Opposite( WrapperCategory( Opposite( SkeletalFinSets ) ) )

julia> Length( ListPrimitivelyInstalledOperationsOfCategory( FS ) )
257

julia> Length( ListInstalledOperationsOfCategory( FS ) )
285
