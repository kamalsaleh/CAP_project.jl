
```jldoctest FiniteSkeletalDiscreteCategory.g
julia> using CAP

julia> # extracted from examples/FiniteSkeletalDiscreteCategory.g

julia> true
true

julia> D = FiniteSkeletalDiscreteCategory( (1):(5) )
FiniteSkeletalDiscreteCategory( [ 1 .. 5 ] )

julia> one = ObjectConstructor( D, 1 )
<An object in FiniteSkeletalDiscreteCategory( [ 1 .. 5 ] )>

julia> IsWellDefinedForObjects( one )
true

julia> ObjectDatum( one ) == 1
true

julia> Display( one )
1

julia> IsEqualForObjects( one, D[1] )
true

julia> id_one = IdentityMorphism( D, one )
<A morphism in FiniteSkeletalDiscreteCategory( [ 1 .. 5 ] )>

julia> IsWellDefinedForMorphisms( id_one )
true

julia> MorphismDatum( id_one ) == fail
true

julia> Display( id_one )
1
|
| A morphism in FiniteSkeletalDiscreteCategory( [ 1 .. 5 ] )
v
1

julia> IsEqualForMorphisms( PreCompose( id_one, id_one ), id_one )
true

julia> Length( SetOfObjectsOfCategory( D ) )
5

julia> Length( SetOfMorphismsOfFiniteCategory( D ) )
5

```
