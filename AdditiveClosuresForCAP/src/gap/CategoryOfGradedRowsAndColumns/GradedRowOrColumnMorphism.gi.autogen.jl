#############################################################################
##
## AdditiveClosuresForCAP package
##
## Copyright 2019, Martin Bies,       ULB Brussels
##
## Chapter Morphisms
##
#############################################################################

####################################
##
## GAP Category
##
####################################

DeclareRepresentation( "IsGradedRowMorphismRep",
                       IsGradedRowMorphism && IsAttributeStoringRep,
                       [ ] );

DeclareRepresentation( "IsGradedColumnMorphismRep",
                       IsGradedColumnMorphism && IsAttributeStoringRep,
                       [ ] );

####################################
##
## Constructors
##
####################################

##
@InstallMethod( GradedRowOrColumnMorphism,
               [ IsGradedRowOrColumn, IsHomalgMatrix, IsGradedRowOrColumn ],
  function( source, homalg_matrix, range )
    local homalg_graded_ring, category, left, type;
    
    # get category of source
    category = CapCategory( source );
    
    # check that source and range are objects in the same category
    if (@not IsIdenticalObj( category, CapCategory( range ) ))
      
      Error( "Source and range are not defined over identical categories" );
      return;

    end;
    
    # extract the homalg_graded_ring
    homalg_graded_ring = HomalgRing( homalg_matrix );
    
    # make a number of sanity tests (for left presentations actually!)
    if (@not IsIdenticalObj( homalg_graded_ring, UnderlyingHomalgGradedRing( source ) ))
      
      Error( "The matrix is defined over a different ring than the objects" );
      return;

    end;

    # work out if we are considering left or right presentations
    left = IsGradedRow( source );
    
    # and correspondingly check the dimensions of the matrix
    if (left)
      
      if (NrRows( homalg_matrix ) != Rank( source ))
          
          Error( "The number of rows of the given matrix is incorrect" );
          return;

      end;
      
      if (NrColumns( homalg_matrix ) != Rank( range ))
        
        Error( "The number of columns of the given matrix is incorrect" );
        return;
        
      end;
      
    else
      
      if (NrColumns( homalg_matrix ) != Rank( source ))
        
        Error( "The number of columns of the given matrix is incorrect" );
        return;
        
      end;
      
      if (NrRows( homalg_matrix ) != Rank( range ))
        
        Error( "The number of rows of the given matrix is incorrect" );
        return;
        
      end;
      
    end;
    
    # now create the morphism
    return CreateCapCategoryMorphismWithAttributes( category,
                                                    source,
                                                    range,
                                                    UnderlyingHomalgGradedRing, homalg_graded_ring,
                                                    UnderlyingHomalgMatrix, homalg_matrix );
    
end );

##
@InstallMethod( GradedRowOrColumnMorphism,
               [ IsGradedRowOrColumn, IsHomalgMatrix, IsGradedRowOrColumn, IsBool ],
  function( source, homalg_matrix, range, checks_wished )
    local homalg_graded_ring, category, type;
    
    # if checks are wished, hand the input to the method above
    if (checks_wished)
      return GradedRowOrColumnMorphism( source, homalg_matrix, range );
    end;
    
    # checks not wished, so continue here and collect necessary data
    category = CapCategory( source );
    homalg_graded_ring = HomalgRing( homalg_matrix );
    
    # construct the morphism
    return CreateCapCategoryMorphismWithAttributes( category,
                                                    source,
                                                    range,
                                                    UnderlyingHomalgGradedRing, homalg_graded_ring,
                                                    UnderlyingHomalgMatrix, homalg_matrix );
    
end );



####################################
##
## StringGAP
##
####################################

##
@InstallMethod( StringGAP,
               [ IsGradedRowOrColumnMorphism ],
               999, # FIX ME FIX ME FIX ME!!!
  function( graded_row_or_column_morphism )

    if (IsGradedRowMorphism( graded_row_or_column_morphism ))

      return @Concatenation( "A morphism in Category of graded rows over ",
                            RingName( UnderlyingHomalgGradedRing( graded_row_or_column_morphism ) ) );

    else

      return @Concatenation( "A morphism in Category of graded columns over ",
                            RingName( UnderlyingHomalgGradedRing( graded_row_or_column_morphism ) ) );

    end;

end );



####################################
##
## Display
##
####################################

#= comment for Julia
##
@InstallMethod( Display,
               [ IsGradedRowOrColumnMorphism ], 
  function( graded_row_or_column_morphism )
    
    # source
    Print( "Source: \n" );
    Display( Source( graded_row_or_column_morphism ) );
    
    # mapping matrix
    Print( @Concatenation( "\n", "Matrix: \n" ) );
    Display( UnderlyingHomalgMatrix( graded_row_or_column_morphism ) );
    
    # range
    Print( @Concatenation( "\n", "Range: \n" ) );
    Display( Range( graded_row_or_column_morphism ) );
    Print( "\n" );
    
    # general information on morphism
    Print( StringMutable( graded_row_or_column_morphism ) );
    
end );
# =#


####################################
##
## View
##
####################################

##
@InstallMethod( ViewString,
               [ IsGradedRowOrColumnMorphism ], 
               999, # FIX ME FIX ME FIX ME!!!
function( graded_row_or_column_morphism )

      return @Concatenation( "<", StringGAP( graded_row_or_column_morphism ), ">" );

end );
