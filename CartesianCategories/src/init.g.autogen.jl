# SPDX-License-Identifier: GPL-2.0-or-later
# CartesianCategories: Cartesian and cocartesian categories and various subdoctrines
#
# Reading the declaration part of the package.
#

include( "gap/Tools.gd.autogen.jl" );

## Initial category

include( "gap/InitialCategory.gd.autogen.jl" );
include( "gap/InitialCategoryProperties.gd.autogen.jl" );

## Cartesian and Cocartesian

include( "gap/CartesianCategories.gd.autogen.jl" );
include( "gap/CocartesianCategories.gd.autogen.jl" );

include( "gap/CartesianCategories_extra.gd.autogen.jl" );
include( "gap/CocartesianCategories_extra.gd.autogen.jl" );

include( "gap/CartesianCategoriesProperties.gd.autogen.jl" );
include( "gap/CocartesianCategoriesProperties.gd.autogen.jl" );

include( "gap/CartesianCategoriesMethodRecordDeclarations.autogen.gd.autogen.jl" );
include( "gap/CocartesianCategoriesMethodRecordDeclarations.autogen.gd.autogen.jl" );

include( "gap/DistributiveCartesianCategories.gd.autogen.jl" );
include( "gap/CodistributiveCocartesianCategories.gd.autogen.jl" );

include( "gap/DistributiveCartesianCategoriesProperties.gd.autogen.jl" );
include( "gap/CodistributiveCocartesianCategoriesProperties.gd.autogen.jl" );

include( "gap/DistributiveCartesianCategoriesMethodRecordDeclarations.autogen.gd.autogen.jl" );
include( "gap/CodistributiveCocartesianCategoriesMethodRecordDeclarations.autogen.gd.autogen.jl" );

include( "gap/BraidedCartesianCategories.gd.autogen.jl" );
include( "gap/BraidedCocartesianCategories.gd.autogen.jl" );

include( "gap/BraidedCartesianCategoriesMethodRecordDeclarations.autogen.gd.autogen.jl" );
include( "gap/BraidedCocartesianCategoriesMethodRecordDeclarations.autogen.gd.autogen.jl" );

## Cartesian Closed and Cocartesian Coclosed

include( "gap/CartesianClosedCategoriesProperties.gd.autogen.jl" );
include( "gap/CocartesianCoclosedCategoriesProperties.gd.autogen.jl" );

include( "gap/CartesianClosedCategories.gd.autogen.jl" );
include( "gap/CocartesianCoclosedCategories.gd.autogen.jl" );

include( "gap/CartesianClosedCategoriesMethodRecordDeclarations.autogen.gd.autogen.jl" );
include( "gap/CocartesianCoclosedCategoriesMethodRecordDeclarations.autogen.gd.autogen.jl" );

## Bicartesian and finite (co)complete categories

include( "gap/BicartesianCategories.gd.autogen.jl" );

## Synonyms

#= comment for Julia
include( "gap/Synonyms.gd.autogen.jl" );
# =#

## Test methods

include( "gap/CartesianCategoriesTest.gd.autogen.jl" );
include( "gap/CocartesianCategoriesTest.gd.autogen.jl" );

include( "gap/DistributiveCartesianCategoriesTest.gd.autogen.jl" );
include( "gap/CodistributiveCocartesianCategoriesTest.gd.autogen.jl" );

include( "gap/BraidedCartesianCategoriesTest.gd.autogen.jl" );
include( "gap/BraidedCocartesianCategoriesTest.gd.autogen.jl" );

include( "gap/CartesianClosedCategoriesTest.gd.autogen.jl" );
include( "gap/CocartesianCoclosedCategoriesTest.gd.autogen.jl" );
