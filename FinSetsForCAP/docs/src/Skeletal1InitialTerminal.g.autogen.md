
```jldoctest Skeletal1InitialTerminal.g
julia> using CAP, MonoidalCategories, CartesianCategories, Toposes, FinSetsForCAP

julia> # extracted from examples/Skeletal1InitialTerminal.g

julia> true
true

julia> m = FinSet1( 8 )
|8|

julia> IsInitial( m )
false

julia> IsTerminal( m )
false

julia> i = InitialObject( SkeletalFinSets1 )
|0|

julia> Display( i )
∅

julia> IsInitial( i )
true

julia> IsTerminal( i )
false

julia> iota = UniversalMorphismFromInitialObject( m )
|0| → |8|

julia> Display( AsList( i ) )
[  ]

julia> t = TerminalObject( SkeletalFinSets1 )
|1|

julia> Display( AsList( t ) )
[ 1 ]

julia> IsInitial( t )
false

julia> IsTerminal( t )
true

julia> pi = UniversalMorphismIntoTerminalObject( m )
|8| → |1|

julia> IsIdenticalObj( Range( pi ), t )
true

julia> pi_t = UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( m, t )
|8| → |1|

julia> Display( AsList( pi_t ) )
[ 1, 1, 1, 1, 1, 1, 1, 1 ]

julia> pi == pi_t
true

```
