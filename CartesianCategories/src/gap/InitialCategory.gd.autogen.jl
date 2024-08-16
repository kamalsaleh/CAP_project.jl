# SPDX-License-Identifier: GPL-2.0-or-later
# CartesianCategories: Cartesian and cocartesian categories and various subdoctrines
#
# Declarations
#

#! @Chapter The initial category

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; type of an initial category.
#! @Arguments T
@DeclareFilter( "IsInitialCapCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; type of an object in an initial category.
#! @Arguments T
@DeclareFilter( "IsObjectInInitialCapCategory",
        IsCapCategoryObject );

#! @Description
#!  The &GAP; type of a morphism in an initial category.
#! @Arguments T
@DeclareFilter( "IsMorphismInInitialCapCategory",
        IsCapCategoryMorphism );

####################################
#
#! @Section Constructor
#
####################################

#! @Description
#!  Construct a initial category.
#! @Arguments
@DeclareGlobalFunction( "InitialCategory" );
#! @InsertChunk InitialCategory
