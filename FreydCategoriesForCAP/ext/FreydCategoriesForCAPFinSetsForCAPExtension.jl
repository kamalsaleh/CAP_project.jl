module FreydCategoriesForCAPFinSetsForCAPExtension

@nospecialize

using CAP

using FreydCategoriesForCAP

using FinSetsForCAP

@IMPORT_THE_WORLD()

CAP.IS_PRECOMPILING = true

push!(ModulesForEvaluationStack, @__MODULE__)

#include("../src/gap/GroupsAsCats.gi.autogen.jl") # groups are not yet supported
include("../src/gap/LinearClosure.gi.autogen.jl")
include("../src/gap/ProSetsAsCats.gi.autogen.jl")

push!(ModulesForEvaluationStack)

CAP.IS_PRECOMPILING = false

end # module FreydCategoriesForCAPFinSetsForCAPExtension
