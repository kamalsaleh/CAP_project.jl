module FreydCategoriesForCAP

@nospecialize

using MatricesForHomalg

using CAP

using MonoidalCategories

using LinearAlgebraForCAP # this is not a GAP dependency but needed for various declarations not (yet) part of MatricesForHomalg

using CartesianCategories # packages which define new CAP operations currently have to be direct dependencies

using Toposes # packages which define new CAP operations currently have to be direct dependencies

include("init.jl")

end # module FreydCategoriesForCAP
