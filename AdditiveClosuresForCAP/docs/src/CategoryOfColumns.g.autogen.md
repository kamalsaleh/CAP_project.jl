
```jldoctest CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfColumns.g

julia> S = HomalgRingOfIntegers();

julia> cols = CategoryOfColumns( S )
Columns( Z )

julia> obj1 = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

julia> obj2 = CategoryOfColumnsObject( 8, cols )
<A column module over Z of rank 8>

```

```jldoctest CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfColumns.g

julia> obj3 = CategoryOfColumnsObject( 1, cols )
<A column module over Z of rank 1>

julia> IsWellDefined( obj1 )
true

julia> obj4 = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

julia> mor = CategoryOfColumnsMorphism( obj3, HomalgMatrix( [[1],[2]], 2, 1, S ), obj4 )
<A morphism in Columns( Z )>

julia> IsWellDefined( mor )
true

```

```jldoctest CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfColumns.g

julia> ZeroObject( cols )
<A column module over Z of rank 0>

julia> obj5 = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

```

```jldoctest CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfColumns.g

julia> obj6 = CategoryOfColumnsObject( 1, cols )
<A column module over Z of rank 1>

```

```jldoctest CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfColumns.g

julia> directSum = DirectSum( [ obj5, obj6 ] )
<A column module over Z of rank 3>

```

```jldoctest CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfColumns.g

julia> i1 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Columns( Z )>

```

```jldoctest CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfColumns.g

julia> i2 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Columns( Z )>

```

```jldoctest CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfColumns.g

julia> proj1 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Columns( Z )>

```

```jldoctest CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfColumns.g

julia> proj2 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Columns( Z )>

```

```jldoctest CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfColumns.g

julia> mor2 = IdentityMorphism( obj6 )
<A morphism in Columns( Z )>

```

```jldoctest CategoryOfColumns.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfColumns.g

julia> source = CategoryOfColumnsObject( 1, cols )
<A column module over Z of rank 1>

julia> range = CategoryOfColumnsObject( 2, cols )
<A column module over Z of rank 2>

julia> mor = CategoryOfColumnsMorphism( source, HomalgMatrix( [[ 2 ], [ 3 ]], 2, 1, S ), range )
<A morphism in Columns( Z )>

julia> colift = Colift( mor2, mor )
<A morphism in Columns( Z )>

```
