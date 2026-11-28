
```jldoctest AdditiveClosureKronecker.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/AdditiveClosureKronecker.g

julia> true
true

julia> Q = HomalgFieldOfRationals();

julia> R = RingAsCategory( Q )
RingAsCategory( Q )

julia> A = AdditiveClosure( R )
AdditiveClosure( RingAsCategory( Q ) )

julia> u = TensorUnit( A )
<An object in AdditiveClosure( RingAsCategory( Q ) ) defined by 1 underlying objects>

julia> mor1 = [ [ 1 / R, 2 / R ] ] / A
<A morphism in AdditiveClosure( RingAsCategory( Q ) ) defined by a 1 x 2 matrix of underlying morphisms>

julia> mor2 = [ [ 3 / R, 4 / R ] ] / A
<A morphism in AdditiveClosure( RingAsCategory( Q ) ) defined by a 1 x 2 matrix of underlying morphisms>

julia> T = TensorProduct( mor1, mor2 )
<A morphism in AdditiveClosure( RingAsCategory( Q ) ) defined by a 1 x 4 matrix of underlying morphisms>

julia> Display( T )
A 1 x 4 matrix with entries in RingAsCategory( Q )

[1,1]: <3>
[1,2]: <4>
[1,3]: <6>
[1,4]: <8>

julia> Display( Range( T ) )
A formal direct sum consisting of 4 objects.
*
*
*
*

```
