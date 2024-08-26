module FreydCategoriesForCAPFinSetsForCAPExtension

@nospecialize

using CAP

using FreydCategoriesForCAP

using FinSetsForCAP

@IMPORT_THE_WORLD()

push!(ModulesForEvaluationStack, @__MODULE__)

#include("../src/gap/GroupsAsCats.gi.autogen.jl") # groups are not yet supported
include("../src/gap/LinearClosure.gi.autogen.jl")
include("../src/gap/ProSetsAsCats.gi.autogen.jl")

push!(ModulesForEvaluationStack)

end # module FreydCategoriesForCAPFinSetsForCAPExtension
