# SPDX-License-Identifier: GPL-2.0-or-later
# MonoidalCategories: Monoidal and monoidal (co)closed categories
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
#!  This is a legacy operation for `CoclosedMonoidalLeftCoevaluationMorphism`( <A>b</A>, <A>a</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b
@DeclareOperation( "CoclosedCoevaluationMorphism", [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  This is a legacy operation for `CoclosedMonoidalLeftCoevaluationMorphismWithGivenSource`( <A>b</A>, <A>a</A>, <A>s</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b, s
@DeclareOperation( "CoclosedCoevaluationMorphismWithGivenSource", [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  This is a legacy operation for `CoclosedMonoidalLeftEvaluationMorphism`( <A>b</A>, <A>a</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b
@DeclareOperation( "CoclosedEvaluationMorphism", [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  This is a legacy operation for `CoclosedMonoidalLeftEvaluationMorphismWithGivenRange`( <A>b</A>, <A>a</A>, <A>r</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b, r
@DeclareOperation( "CoclosedEvaluationMorphismWithGivenRange", [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  This is a legacy operation for `ClosedMonoidalLeftCoevaluationMorphism`( <A>b</A>, <A>a</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b
@DeclareOperation( "CoevaluationMorphism", [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  This is a legacy operation for `ClosedMonoidalLeftCoevaluationMorphismWithGivenRange`( <A>b</A>, <A>a</A>, <A>r</A> ),
#!  i.e., with the first and second argument interchanged.
#! @Arguments a, b, r
@DeclareOperation( "CoevaluationMorphismWithGivenRange", [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

####################################
##
#! @Section Synonyms for legacy operations
##
####################################

#! @Description
#!  This is a synonym for `ClosedMonoidalLeftEvaluationMorphism`.
# DeclareOperation( "EvaluationMorphism", [ IsCapCategoryObject, IsCapCategoryObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "EvaluationMorphism", ClosedMonoidalLeftEvaluationMorphism );

#! @Description
#!  This is a synonym for `ClosedMonoidalLeftEvaluationMorphismWithGivenSource`.
# DeclareOperation( "EvaluationMorphismWithGivenSource", [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "EvaluationMorphismWithGivenSource", ClosedMonoidalLeftEvaluationMorphismWithGivenSource );

#! @Description
#!  This is a synonym for `InternalCoHomToTensorProductLeftAdjunctMorphism`.
# DeclareOperation( "InternalCoHomToTensorProductAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "InternalCoHomToTensorProductAdjunctionMap", InternalCoHomToTensorProductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `InternalCoHomToTensorProductLeftAdjunctionMapWithGivenTensorProduct`.
# DeclareOperation( "InternalCoHomToTensorProductAdjunctionMapWithGivenTensorProduct", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "InternalCoHomToTensorProductAdjunctionMapWithGivenTensorProduct", InternalCoHomToTensorProductLeftAdjunctMorphismWithGivenTensorProduct );

#! @Description
#!  This is a synonym for `InternalHomToTensorProductLeftAdjunctMorphism`.
# DeclareOperation( "InternalHomToTensorProductAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "InternalHomToTensorProductAdjunctionMap", InternalHomToTensorProductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `InternalHomToTensorProductLeftAdjunctionMapWithGivenTensorProduct`.
# DeclareOperation( "InternalHomToTensorProductAdjunctionMapWithGivenTensorProduct", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "InternalHomToTensorProductAdjunctionMapWithGivenTensorProduct", InternalHomToTensorProductLeftAdjunctMorphismWithGivenTensorProduct );

#! @Description
#!  This is a synonym for `TensorProductToInternalCoHomLeftAdjunctMorphism`.
# DeclareOperation( "TensorProductToInternalCoHomAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "TensorProductToInternalCoHomAdjunctionMap", TensorProductToInternalCoHomLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `TensorProductToInternalCoHomLeftAdjunctMorphismWithGivenInternalCoHom`.
# DeclareOperation( "TensorProductToInternalCoHomAdjunctionMapWithGivenInternalCoHom", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "TensorProductToInternalCoHomAdjunctionMapWithGivenInternalCoHom", TensorProductToInternalCoHomLeftAdjunctMorphismWithGivenInternalCoHom );

#! @Description
#!  This is a synonym for `TensorProductToInternalHomLeftAdjunctMorphism`.
# DeclareOperation( "TensorProductToInternalHomAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "TensorProductToInternalHomAdjunctionMap", TensorProductToInternalHomLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `TensorProductToInternalHomLeftAdjunctMorphismWithGivenInternalHom`.
# DeclareOperation( "TensorProductToInternalHomAdjunctionMapWithGivenInternalHom", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "TensorProductToInternalHomAdjunctionMapWithGivenInternalHom", TensorProductToInternalHomLeftAdjunctMorphismWithGivenInternalHom );

## AdjunctionMap -> AdjunctMorphism

#! @Description
#!  This is a synonym for `InternalCoHomToTensorProductLeftAdjunctMorphism`.
# DeclareOperation( "InternalCoHomToTensorProductLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "InternalCoHomToTensorProductLeftAdjunctionMap", InternalCoHomToTensorProductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `InternalHomToTensorProductLeftAdjunctMorphism`.
# DeclareOperation( "InternalHomToTensorProductLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "InternalHomToTensorProductLeftAdjunctionMap", InternalHomToTensorProductLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `TensorProductToInternalCoHomLeftAdjunctMorphism`.
# DeclareOperation( "TensorProductToInternalCoHomLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "TensorProductToInternalCoHomLeftAdjunctionMap", TensorProductToInternalCoHomLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `TensorProductToInternalCoHomLeftAdjunctMorphismWithGivenInternalCoHom`.
# DeclareOperation( "TensorProductToInternalCoHomLeftAdjunctionMapWithGivenInternalCoHom", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "TensorProductToInternalCoHomLeftAdjunctionMapWithGivenInternalCoHom", TensorProductToInternalCoHomLeftAdjunctMorphismWithGivenInternalCoHom );

#! @Description
#!  This is a synonym for `TensorProductToInternalHomLeftAdjunctMorphism`.
# DeclareOperation( "TensorProductToInternalHomLeftAdjunctionMap", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "TensorProductToInternalHomLeftAdjunctionMap", TensorProductToInternalHomLeftAdjunctMorphism );

#! @Description
#!  This is a synonym for `TensorProductToInternalHomLeftAdjunctMorphismWithGivenInternalHom`.
# DeclareOperation( "TensorProductToInternalHomLeftAdjunctionMapWithGivenInternalHom", [ IsObject ] );
# this comment stops AutoDoc from trying to parse the next line (which it can't at the moment)
@BindGlobal( "TensorProductToInternalHomLeftAdjunctionMapWithGivenInternalHom", TensorProductToInternalHomLeftAdjunctMorphismWithGivenInternalHom );
