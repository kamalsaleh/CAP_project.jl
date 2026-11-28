
```jldoctest CategoryOfRows.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfRows.g

julia> S = HomalgRingOfIntegers();

julia> rows = CategoryOfRows( S )
Rows( Z )

julia> obj1 = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

julia> obj2 = CategoryOfRowsObject( 8, rows )
<A row module over Z of rank 8>

```

```jldoctest CategoryOfRows.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfRows.g

julia> obj3 = CategoryOfRowsObject( 1, rows )
<A row module over Z of rank 1>

julia> IsWellDefined( obj1 )
true

julia> obj4 = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

julia> mor = CategoryOfRowsMorphism( obj3, HomalgMatrix( [[1,2]], 1, 2, S ), obj4 )
<A morphism in Rows( Z )>

julia> IsWellDefined( mor )
true

```

```jldoctest CategoryOfRows.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfRows.g

julia> Length( AdditiveGenerators( rows ) )
1

julia> ZeroObject( rows )
<A row module over Z of rank 0>

julia> obj5 = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

```

```jldoctest CategoryOfRows.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfRows.g

julia> obj6 = CategoryOfRowsObject( 1, rows )
<A row module over Z of rank 1>

```

```jldoctest CategoryOfRows.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfRows.g

julia> directSum = DirectSum( [ obj5, obj6 ] )
<A row module over Z of rank 3>

```

```jldoctest CategoryOfRows.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfRows.g

julia> i1 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Rows( Z )>

```

```jldoctest CategoryOfRows.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfRows.g

julia> i2 = InjectionOfCofactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Rows( Z )>

```

```jldoctest CategoryOfRows.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfRows.g

julia> proj1 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 1 )
<A morphism in Rows( Z )>

```

```jldoctest CategoryOfRows.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfRows.g

julia> proj2 = ProjectionInFactorOfDirectSum( [ obj5, obj6 ], 2 )
<A morphism in Rows( Z )>

```

```jldoctest CategoryOfRows.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfRows.g

julia> mor2 = IdentityMorphism( obj6 )
<A morphism in Rows( Z )>

```

```jldoctest CategoryOfRows.g
julia> using MatricesForHomalg, CAP, MonoidalCategories, LinearAlgebraForCAP, AdditiveClosuresForCAP

julia> # extracted from examples/CategoryOfRows.g

julia> source = CategoryOfRowsObject( 1, rows )
<A row module over Z of rank 1>

julia> range = CategoryOfRowsObject( 2, rows )
<A row module over Z of rank 2>

julia> mor = CategoryOfRowsMorphism( source, HomalgMatrix( [[ 2, 3 ]], 1, 2, S ), range )
<A morphism in Rows( Z )>

julia> colift = Colift( mor2, mor )
<A morphism in Rows( Z )>

```
