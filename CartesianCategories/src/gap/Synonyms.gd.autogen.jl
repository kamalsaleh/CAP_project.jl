# SPDX-License-Identifier: GPL-2.0-or-later
# CartesianCategories: Cartesian and cocartesian categories and various subdoctrines
#
# Declarations
#

####################################
##
#! @Chapter Legacy Operations and Synonyms
##
####################################

####################################
##
#! @Section Legacy operations
##
####################################

#! @Description
#!  This is a legacy operation for `CocartesianLeftCoevaluationMorphism`( <A>b</A>, <A>a</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b
@DeclareOperation( "CocartesianCoevaluationMorphism", [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  This is a legacy operation for `CocartesianLeftCoevaluationMorphismWithGivenSource`( <A>b</A>, <A>a</A>, <A>s</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b, s
@DeclareOperation( "CocartesianCoevaluationMorphismWithGivenSource", [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  This is a legacy operation for `CocartesianLeftEvaluationMorphism`( <A>b</A>, <A>a</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b
@DeclareOperation( "CocartesianEvaluationMorphism", [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  This is a legacy operation for `CocartesianLeftEvaluationMorphismWithGivenRange`( <A>b</A>, <A>a</A>, <A>r</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b, r
@DeclareOperation( "CocartesianEvaluationMorphismWithGivenRange", [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  This is a legacy operation for `CartesianLeftCoevaluationMorphism`( <A>b</A>, <A>a</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b
@DeclareOperation( "CartesianCoevaluationMorphism", [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  This is a legacy operation for `CartesianLeftCoevaluationMorphismWithGivenRange`( <A>b</A>, <A>a</A>, <A>r</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b, r
@DeclareOperation( "CartesianCoevaluationMorphismWithGivenRange", [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

####################################
##
#! @Section Synonyms for legacy operations
##
####################################

#! @Description
#!  This is a synonym for `CartesianLeftEvaluationMorphism`.
# DeclareOperation( "CartesianEvaluationMorphism", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "CartesianEvaluationMorphism", CartesianLeftEvaluationMorphism );

#! @Description
#!  This is a synonym for `CartesianLeftEvaluationMorphismWithGivenSource`.
# DeclareOperation( "CartesianEvaluationMorphismWithGivenSource", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "CartesianEvaluationMorphismWithGivenSource", CartesianLeftEvaluationMorphismWithGivenSource );

#! @Description
#!  This is a synonym for `CoexponentialToCoproductLeftAdjunctMorphism`.
# DeclareOperation( "CoexponentialToCoproductAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "CoexponentialToCoproductAdjunctionMap", CoexponentialToCoproductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `CoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct`.
# DeclareOperation( "CoexponentialToCoproductAdjunctionMapWithGivenCoproduct", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "CoexponentialToCoproductAdjunctionMapWithGivenCoproduct", CoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct );

#! @Description
#!  This is a synonym for `ExponentialToDirectProductLeftAdjunctMorphism`.
# DeclareOperation( "ExponentialToDirectProductAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "ExponentialToDirectProductAdjunctionMap", ExponentialToDirectProductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `ExponentialToDirectProductLeftAdjunctMorphismWithGivenDirectProduct`.
# DeclareOperation( "ExponentialToDirectProductAdjunctionMapWithGivenDirectProduct", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "ExponentialToDirectProductAdjunctionMapWithGivenDirectProduct", ExponentialToDirectProductLeftAdjunctMorphismWithGivenDirectProduct );

#! @Description
#!  This is a synonym for `CoproductToCoexponentialLeftAdjunctMorphism`.
# DeclareOperation( "CoproductToCoexponentialAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "CoproductToCoexponentialAdjunctionMap", CoproductToCoexponentialLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `CoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential`.
# DeclareOperation( "CoproductToCoexponentialAdjunctionMapWithGivenCoexponential", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "CoproductToCoexponentialAdjunctionMapWithGivenCoexponential", CoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential );

#! @Description
#!  This is a synonym for `DirectProductToExponentialLeftAdjunctMorphism`.
# DeclareOperation( "DirectProductToExponentialAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "DirectProductToExponentialAdjunctionMap", DirectProductToExponentialLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential`.
# DeclareOperation( "DirectProductToExponentialAdjunctionMapWithGivenExponential", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "DirectProductToExponentialAdjunctionMapWithGivenExponential", DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential );

##
## Add-methods
##

#! @Description
#!  This is a synonym for `AddCartesianLeftEvaluationMorphism`.
# DeclareOperation( "AddCartesianEvaluationMorphism", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddCartesianEvaluationMorphism", AddCartesianLeftEvaluationMorphism );

#! @Description
#!  This is a synonym for `AddCartesianLeftEvaluationMorphismWithGivenSource`.
# DeclareOperation( "AddCartesianEvaluationMorphismWithGivenSource", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddCartesianEvaluationMorphismWithGivenSource", AddCartesianLeftEvaluationMorphismWithGivenSource );

#! @Description
#!  This is a synonym for `AddCoexponentialToCoproductLeftAdjunctMorphism`.
# DeclareOperation( "AddCoexponentialToCoproductAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddCoexponentialToCoproductAdjunctionMap", AddCoexponentialToCoproductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `AddCoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct`.
# DeclareOperation( "AddCoexponentialToCoproductAdjunctionMapWithGivenCoproduct", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddCoexponentialToCoproductAdjunctionMapWithGivenCoproduct", AddCoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct );

#! @Description
#!  This is a synonym for `AddExponentialToDirectProductLeftAdjunctMorphism`.
# DeclareOperation( "AddExponentialToDirectProductAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddExponentialToDirectProductAdjunctionMap", AddExponentialToDirectProductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `AddExponentialToDirectProductLeftAdjunctMorphismWithGivenDirectProduct`.
# DeclareOperation( "AddExponentialToDirectProductAdjunctionMapWithGivenDirectProduct", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddExponentialToDirectProductAdjunctionMapWithGivenDirectProduct", AddExponentialToDirectProductLeftAdjunctMorphismWithGivenDirectProduct );

#! @Description
#!  This is a synonym for `AddCoproductToCoexponentialLeftAdjunctMorphism`.
# DeclareOperation( "AddCoproductToCoexponentialAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddCoproductToCoexponentialAdjunctionMap", AddCoproductToCoexponentialLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `AddCoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential`.
# DeclareOperation( "AddCoproductToCoexponentialAdjunctionMapWithGivenCoexponential", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddCoproductToCoexponentialAdjunctionMapWithGivenCoexponential", AddCoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential );

#! @Description
#!  This is a synonym for `AddDirectProductToExponentialLeftAdjunctMorphism`.
# DeclareOperation( "AddDirectProductToExponentialAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddDirectProductToExponentialAdjunctionMap", AddDirectProductToExponentialLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `AddDirectProductToExponentialLeftAdjunctMorphismWithGivenExponential`.
# DeclareOperation( "AddDirectProductToExponentialAdjunctionMapWithGivenExponential", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddDirectProductToExponentialAdjunctionMapWithGivenExponential", AddDirectProductToExponentialLeftAdjunctMorphismWithGivenExponential );

## AdjunctionMap -> AdjunctMorphism

#! @Description
#!  This is a synonym for `CoexponentialToCoproductLeftAdjunctMorphism`.
# DeclareOperation( "CoexponentialToCoproductLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "CoexponentialToCoproductLeftAdjunctionMap", CoexponentialToCoproductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `CoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct`.
# DeclareOperation( "CoexponentialToCoproductLeftAdjunctionMapWithGivenCoproduct", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "CoexponentialToCoproductLeftAdjunctionMapWithGivenCoproduct", CoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct );

#! @Description
#!  This is a synonym for `ExponentialToDirectProductLeftAdjunctMorphism`.
# DeclareOperation( "ExponentialToDirectProductLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "ExponentialToDirectProductLeftAdjunctionMap", ExponentialToDirectProductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `ExponentialToDirectProductLeftAdjunctMorphismWithGivenDirectProduct`.
# DeclareOperation( "ExponentialToDirectProductLeftAdjunctionMapWithGivenDirectProduct", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "ExponentialToDirectProductLeftAdjunctionMapWithGivenDirectProduct", ExponentialToDirectProductLeftAdjunctMorphismWithGivenDirectProduct );

#! @Description
#!  This is a synonym for `CoproductToCoexponentialLeftAdjunctMorphism`.
# DeclareOperation( "CoproductToCoexponentialLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "CoproductToCoexponentialLeftAdjunctionMap", CoproductToCoexponentialLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `CoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential`.
# DeclareOperation( "CoproductToCoexponentialLeftAdjunctionMapWithGivenCoexponential", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "CoproductToCoexponentialLeftAdjunctionMapWithGivenCoexponential", CoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential );

#! @Description
#!  This is a synonym for `DirectProductToExponentialLeftAdjunctMorphism`.
# DeclareOperation( "DirectProductToExponentialLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "DirectProductToExponentialLeftAdjunctionMap", DirectProductToExponentialLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential`.
# DeclareOperation( "DirectProductToExponentialLeftAdjunctionMapWithGivenExponential", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "DirectProductToExponentialLeftAdjunctionMapWithGivenExponential", DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential );

#! @Description
#!  This is a synonym for `AddCoexponentialToCoproductLeftAdjunctMorphism`.
# DeclareOperation( "AddCoexponentialToCoproductLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddCoexponentialToCoproductLeftAdjunctionMap", AddCoexponentialToCoproductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `AddCoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct`.
# DeclareOperation( "AddCoexponentialToCoproductLeftAdjunctionMapWithGivenCoproduct", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddCoexponentialToCoproductLeftAdjunctionMapWithGivenCoproduct", AddCoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct );

#! @Description
#!  This is a synonym for `AddExponentialToDirectProductLeftAdjunctMorphism`.
# DeclareOperation( "AddExponentialToDirectProductLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddExponentialToDirectProductLeftAdjunctionMap", AddExponentialToDirectProductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `AddExponentialToDirectProductLeftAdjunctMorphismWithGivenDirectProduct`.
# DeclareOperation( "AddExponentialToDirectProductLeftAdjunctionMapWithGivenDirectProduct", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddExponentialToDirectProductLeftAdjunctionMapWithGivenDirectProduct", AddExponentialToDirectProductLeftAdjunctMorphismWithGivenDirectProduct );

#! @Description
#!  This is a synonym for `AddCoproductToCoexponentialLeftAdjunctMorphism`.
# DeclareOperation( "AddCoproductToCoexponentialLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddCoproductToCoexponentialLeftAdjunctionMap", AddCoproductToCoexponentialLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `AddCoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential`.
# DeclareOperation( "AddCoproductToCoexponentialLeftAdjunctionMapWithGivenCoexponential", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddCoproductToCoexponentialLeftAdjunctionMapWithGivenCoexponential", AddCoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential );

#! @Description
#!  This is a synonym for `AddDirectProductToExponentialLeftAdjunctMorphism`.
# DeclareOperation( "AddDirectProductToExponentialLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddDirectProductToExponentialLeftAdjunctionMap", AddDirectProductToExponentialLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `AddDirectProductToExponentialLeftAdjunctMorphismWithGivenExponential`.
# DeclareOperation( "AddDirectProductToExponentialLeftAdjunctionMapWithGivenExponential", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "AddDirectProductToExponentialLeftAdjunctionMapWithGivenExponential", AddDirectProductToExponentialLeftAdjunctMorphismWithGivenExponential );
