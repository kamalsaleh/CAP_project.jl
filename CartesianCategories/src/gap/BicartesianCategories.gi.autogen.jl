# SPDX-License-Identifier: GPL-2.0-or-later
# CartesianCategories: Cartesian and cocartesian categories and various subdoctrines
#
# Implementations
#

InstallTrueMethod( IsCartesianCategory, IsBicartesianCategory );
InstallTrueMethod( IsCocartesianCategory, IsBicartesianCategory );
#= comment for Julia
InstallTrueMethod( IsBicartesianCategory, IsCartesianCategory && IsCocartesianCategory );
# =#
InstallTrueMethod( IsBicartesianCategory, IsDistributiveCategory );
InstallTrueMethod( IsBicartesianCategory, IsCodistributiveCategory );

# https://ncatlab.org/nlab/show/bicartesian+closed+category
#= comment for Julia
InstallTrueMethod( IsBicartesianClosedCategory, IsBicartesianCategory && IsCartesianClosedCategory );
# =#
InstallTrueMethod( IsBicartesianCategory, IsBicartesianClosedCategory );
InstallTrueMethod( IsCartesianClosedCategory, IsBicartesianClosedCategory );
InstallTrueMethod( IsDistributiveCategory, IsBicartesianClosedCategory );

# https://ncatlab.org/nlab/show/bicartesian+coclosed+category
#= comment for Julia
InstallTrueMethod( IsBicartesianCoclosedCategory, IsBicartesianCategory && IsCocartesianCoclosedCategory );
# =#
InstallTrueMethod( IsBicartesianCategory, IsBicartesianCoclosedCategory );
InstallTrueMethod( IsCocartesianCoclosedCategory, IsBicartesianCoclosedCategory );
InstallTrueMethod( IsCodistributiveCategory, IsBicartesianCoclosedCategory );

InstallTrueMethod( IsCartesianCategory, IsFiniteCompleteCategory );
InstallTrueMethod( IsCocartesianCategory, IsFiniteCocompleteCategory );

InstallTrueMethod( IsBicartesianCategory, IsAdditiveCategory );

#= comment for Julia
InstallTrueMethod( IsFiniteBicompleteCategory, IsFiniteCompleteCategory && IsFiniteCocompleteCategory );
# =#
InstallTrueMethod( IsFiniteCompleteCategory, IsFiniteBicompleteCategory );
InstallTrueMethod( IsFiniteCocompleteCategory, IsFiniteBicompleteCategory );

InstallTrueMethod( IsFiniteBicompleteCategory, IsAbelianCategory );

##
@InstallMethod( BinaryDirectProduct,
        [ IsCapCategory, IsCapCategoryObject, IsCapCategoryObject ],
        
  function( cat, object_1, object_2 )
    
    return DirectProduct( cat, [ object_1, object_2 ] );
    
end );

##
@InstallMethod( BinaryCoproduct,
        [ IsCapCategory, IsCapCategoryObject, IsCapCategoryObject ],
        
  function( cat, object_1, object_2 )
    
    return Coproduct( cat, [ object_1, object_2 ] );
    
end );
