

```jldoctest
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> true
true


julia> SkeletalFinSets
SkeletalFinSets

julia> TensorUnit( SkeletalFinSets ) == TerminalObject( SkeletalFinSets )
true


julia> sFinSets = SkeletalCategoryOfFiniteSets(; cocartesian_monoidal_structure = true )
SkeletalFinSets

julia> TensorUnit( sFinSets ) == InitialObject( sFinSets )
true


julia> oFinSets = SkeletalCategoryOfFiniteSets(; cartesian_monoidal_structure = false )
SkeletalFinSets

julia> HasIsSymmetricMonoidalCategoryStructureGivenByDirectProduct( oFinSets )
false

julia> HasIsSymmetricMonoidalCategoryStructureGivenByCoproduct( oFinSets )
false
