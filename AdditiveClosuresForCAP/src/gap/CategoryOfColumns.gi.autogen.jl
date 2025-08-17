# SPDX-License-Identifier: GPL-2.0-or-later
# AdditiveClosuresForCAP: Additive closures for pre-additive categories
#
# Implementations
#

# read precompiled categories
include( "precompiled_categories/CategoryOfColumns_as_Opposite_CategoryOfRows_Field_precompiled.gi.autogen.jl" );
include( "precompiled_categories/CategoryOfColumns_as_Opposite_CategoryOfRows_CommutativeRing_precompiled.gi.autogen.jl" );
include( "precompiled_categories/CategoryOfColumns_as_Opposite_CategoryOfRows_HomalgExteriorRingOverField_precompiled.gi.autogen.jl" );
include( "precompiled_categories/CategoryOfColumns_as_Opposite_CategoryOfRows_ArbitraryRing_precompiled.gi.autogen.jl" );

####################################
##
## Constructors
##
####################################

##
@InstallMethod( CategoryOfColumns,
               [ IsHomalgRing ],
               
  @FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, homalg_ring )
    local cat;
    
    cat = CategoryOfColumns_as_Opposite_CategoryOfRows( homalg_ring; FinalizeCategory = false );
    
    if (ValueOption( "no_precompiled_code" ) != true)
        
        if (HasIsFieldForHomalg( homalg_ring ) && IsFieldForHomalg( homalg_ring ))
            
            ADD_FUNCTIONS_FOR_CategoryOfColumns_as_Opposite_CategoryOfRows_Field_precompiled( cat );
            
        elseif (HasIsCommutative( homalg_ring ) && IsCommutative( homalg_ring ))
            
            ADD_FUNCTIONS_FOR_CategoryOfColumns_as_Opposite_CategoryOfRows_CommutativeRing_precompiled( cat );
            
        #= comment for Julia
        elseif (HasIsExteriorRing( homalg_ring ) && IsExteriorRing( homalg_ring ) && IsField( BaseRing( homalg_ring ) ))
            
            ADD_FUNCTIONS_FOR_CategoryOfColumns_as_Opposite_CategoryOfRows_HomalgExteriorRingOverField_precompiled( cat );
            
        # =#
        else
            
            ADD_FUNCTIONS_FOR_CategoryOfColumns_as_Opposite_CategoryOfRows_ArbitraryRing_precompiled( cat );
            
        end;
        
    end;
    
    if (FinalizeCategory)
        
        Finalize( cat );
        
    end;
    
    return cat;
    
end ) );

##
@InstallMethod( CategoryOfColumnsObject,
                    [ IsInt, IsCategoryOfColumns ],
               
  function( rank, category )
    
    return CategoryOfColumnsObject( category, rank );
    
end );

##
@InstallMethod( CategoryOfColumnsObjectOp,
                                [ IsCategoryOfColumns, IsInt ],
               
  function( cat, rank )
    
    if (!(IsInt( rank )) || rank < 0)
        
        Error( "the object datum must be a non-negative integer" );
        
    end;
    
    return CreateCapCategoryObjectWithAttributes( cat,
                                                  RankOfObject, rank );
    
end );

##
@InstallMethod( AsCategoryOfColumnsMorphism,
               [ IsHomalgMatrix, IsCategoryOfColumns ],
               
  function( homalg_matrix, category )
    
    return AsCategoryOfColumnsMorphism( category, homalg_matrix );
    
end );

##
@InstallMethod( AsCategoryOfColumnsMorphism,
               [ IsCategoryOfColumns, IsHomalgMatrix ],
               
  function( category, homalg_matrix )
    local source, range;
    
    source = CategoryOfColumnsObject( category, NrColumns( homalg_matrix ) );
    
    range = CategoryOfColumnsObject( category, NrRows( homalg_matrix ) );
    
    return CategoryOfColumnsMorphism( category, source, homalg_matrix, range );
    
end );

##
@InstallMethod( CategoryOfColumnsMorphism,
               [ IsCategoryOfColumnsObject, IsHomalgMatrix, IsCategoryOfColumnsObject ],
               
  function( source, homalg_matrix, range )
    
    return CategoryOfColumnsMorphism( CapCategory( source ), source, homalg_matrix, range );
    
end );

##
@InstallMethod( CategoryOfColumnsMorphism,
                                     [ IsCategoryOfColumns, IsCategoryOfColumnsObject, IsHomalgMatrix, IsCategoryOfColumnsObject ],
                                     
  function( cat, source, homalg_matrix, range )
    
    if (@not IsHomalgMatrix( homalg_matrix ))
        
        Error( "the morphism datum must be a homalg matrix" );
        
    end;
    
    if (@not IsIdenticalObj( HomalgRing( homalg_matrix ), UnderlyingRing( cat ) ))
        
        Error( "the matrix is defined over a different ring than the category" );
        
    end;
    
    if (NrColumns( homalg_matrix ) != RankOfObject( source ))
        
        Error( "the number of columns has to be equal to the dimension of the source" );
        
    end;
    
    if (NrRows( homalg_matrix ) != RankOfObject( range ))
        
        Error( "the number of rows has to be equal to the dimension of the range" );
        
    end;
    
    return CreateCapCategoryMorphismWithAttributes( cat,
                                                    source,
                                                    range,
                                                    UnderlyingMatrix, homalg_matrix );
    
end );

####################################
##
## Attributes
##
####################################

## "1 round of ByASmallerPresentation"
##
@InstallMethod( CATEGORY_OF_COLUMNS_ReductionBySplitEpiSummandTuple,
               [ IsCategoryOfColumnsMorphism ],
               
  function( alpha )
    local M, cols, R, T, TI, U, UI, S;
    
    M = UnderlyingMatrix( alpha );
    
    cols = CapCategory( alpha );
    
    R = UnderlyingRing( cols );
    
    ## homalg's recipe:
    ## 1) OnLessGenerators
    ## 2) if no improvement in terms of number of generators, then:
    ##  2.1) BasisOfModule
    ##  2.2) OnLessGenerators
    
    T = HomalgVoidMatrix( R );
    
    TI = HomalgVoidMatrix( R );
    
    S = SimplerEquivalentMatrix( M, T, TI, "", "", "" );
    
    if (NrRows( S ) == RankOfObject( Range( alpha ) ))
      
      S = BasisOfColumnModule( S );
      
      U = HomalgVoidMatrix( R );
    
      UI = HomalgVoidMatrix( R );
      
      S = SimplerEquivalentMatrix( S, U, UI, "", "", "" );
      
      T = U * T;
      
      TI = TI * UI;
      
    end;
    
    ## add the following line to homalg's recipe in order to minimize the number of relations
    S = ReducedBasisOfColumnModule( S );
    
    return [ S, T, TI ];
    
end );

####################################
##
## View
##
####################################

#= comment for Julia
##
@InstallMethod( Display,
               [ IsCategoryOfColumnsMorphism ],
               
  function( category_of_columns_morphism )
    
    # source
    Print( "Source: \n" );
    Display( Source( category_of_columns_morphism ) );
    
    # mapping matrix
    Print( @Concatenation( "\n", "Matrix: \n" ) );
    Display( UnderlyingMatrix( category_of_columns_morphism ) );
    
    # range
    Print( @Concatenation( "\n", "Range: \n" ) );
    Display( Range( category_of_columns_morphism ) );
    Print( "\n" );
    
    # general information on morphism
    Display( StringMutable( category_of_columns_morphism ) );
    
end );
# =#

##
@InstallMethod( StringGAP,
              [ IsCategoryOfColumnsObject ],
              
  function( category_of_columns_object )
    
    return @Concatenation( "A column module over ",
                          RingName( UnderlyingRing( CapCategory( category_of_columns_object ) ) ),
                          " of rank ", StringGAP( RankOfObject( category_of_columns_object ) ) );
    
end );
##
@InstallMethod( ViewString,
               [ IsCategoryOfColumnsObject ],

  function( category_of_columns_object )

    return @Concatenation( "<", StringGAP( category_of_columns_object ), ">" );

end );

##
@InstallMethod( DisplayString,
               [ IsCategoryOfColumnsObject ],
               
  function( category_of_columns_object )
    
    return @Concatenation( StringGAP( category_of_columns_object ), "\n" );
    
end );

####################################
##
## Convenience
##
####################################

##
@InstallMethod( /,
               [ IsHomalgMatrix, IsCategoryOfColumns ],
               AsCategoryOfColumnsMorphism
);

####################################
##
## Down
##
####################################

##
@InstallMethod( Down,
               [ IsCategoryOfColumnsObject ],
  function( obj )
    
    return RankOfObject( obj );
    
end );

##
@InstallMethod( DownOnlyMorphismData,
               [ IsCategoryOfColumnsMorphism ],
  function( mor )
    
    return UnderlyingMatrix( mor );
    
end );
