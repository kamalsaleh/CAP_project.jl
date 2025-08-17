# SPDX-License-Identifier: GPL-2.0-or-later
# LinearClosuresForCAP: Linear closures
#
# Reading the implementation part of the package.
#

include( "gap/LinearClosure.gi.autogen.jl" );

#= comment for Julia (Groups are not available in Julia)
include( "gap/LinearClosureForGroupAsCategory.gi.autogen.jl" );
# =#

# In GAP, `gap/HomomorphismStructure.gi` is loaded only if `FinSetsForCAP` is marked for loading (see PackageInfo.g).
# In Julia, `FinSetsForCAP` is always a dependency, so we can include this file unconditionally.
include( "gap/HomomorphismStructure.gi.autogen.jl" );
