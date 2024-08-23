# SPDX-License-Identifier: GPL-2.0-or-later
# FreydCategoriesForCAP: Freyd categories - Formal (co)kernels for additive categories
#
# Reading the declaration part of the package.
#

include( "gap/FreydCategoriesForCAP.gd.autogen.jl" );

include( "gap/CategoryOfRows.gd.autogen.jl" );
include( "gap/CategoryOfRows_as_AdditiveClosure_RingAsCategory.gd.autogen.jl" );

include( "gap/CategoryOfColumns.gd.autogen.jl" );
include( "gap/CategoryOfColumns_as_Opposite_CategoryOfRows.gd.autogen.jl" );

# include the packages for graded rows and columns
#= comment for Julia
include( "gap/CategoryOfGradedRowsAndColumns/GradedRowOrColumn.gd.autogen.jl" );
include( "gap/CategoryOfGradedRowsAndColumns/GradedRowOrColumnMorphism.gd.autogen.jl" );
include( "gap/CategoryOfGradedRowsAndColumns/CategoryOfGradedRows.gd.autogen.jl" );
include( "gap/CategoryOfGradedRowsAndColumns/CategoryOfGradedColumns.gd.autogen.jl" );
include( "gap/CategoryOfGradedRowsAndColumns/Tools.gd.autogen.jl" );
# =#

include( "gap/FreydCategory.gd.autogen.jl" );
include( "gap/CoFreydCategory.gd.autogen.jl" );
include( "gap/CoFreydCategory_as_Opposite_FreydCategory_Opposite.gd.autogen.jl" );

include( "gap/AdditiveClosure.gd.autogen.jl" );

include( "gap/CokernelImageClosure.gd.autogen.jl" );

include( "gap/AdelmanCategory.gd.autogen.jl" );

include( "gap/GradedModulePresentationsByFreyd/GradedModulePresentationsByFreyd.gd.autogen.jl" );

include( "gap/LinearClosure.gd.autogen.jl" );

include( "gap/ProSetsAsCats.gd.autogen.jl" );

include( "gap/GroupsAsCats.gd.autogen.jl" );

include( "gap/RingsAsAbCats.gd.autogen.jl" );

include( "gap/GradeFiltration.gd.autogen.jl" );

include( "gap/SerreSubcategoryFunctions.gd.autogen.jl" );

include( "gap/Relations.gd.autogen.jl" );
