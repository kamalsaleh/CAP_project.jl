# SPDX-License-Identifier: GPL-2.0-or-later
# AdditiveClosuresForCAP: Additive closures for pre-additive categories
#
# Reading the declaration part of the package.
#

include( "gap/MethodRecordDeclarations.autogen.gd.autogen.jl" );
include( "gap/AdditiveClosureMethodRecord.gd.autogen.jl" );

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

include( "gap/AdditiveClosure.gd.autogen.jl" );

include( "gap/RingsAsAbCats.gd.autogen.jl" );
