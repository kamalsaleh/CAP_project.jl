#############################################################################
##
## AdditiveClosuresForCAP package
##
## Copyright 2019, Martin Bies,       ULB Brussels
##
## Chapter Objects
##
#############################################################################

####################################
##
## Constructors
##
####################################

##
@InstallGlobalFunction( GradedRowOrColumn,
  function( degree_list, homalg_graded_ring, left )
    local A, nrGenerators, i, buffer, buffer_homalg_module_element, category, rank, type;

    # extract the degree group of the ring and its number of generators
    A = DegreeGroup( homalg_graded_ring );
    nrGenerators = NrGenerators( A );
    
    # next check that the degrees lie in the degree group
    for i in (1):(Length( degree_list ))
    
      if (@not Length( degree_list[ i ] ) == 2)
      
        Error( "The entries of the degree list have to consist of two entries - the degree and its multiplicity" );
        return;
      
      end;
      
      if (@not IsHomalgModuleElement( degree_list[ i ][ 1 ] ))
      
        # try to turn the first entry into a homalg module element
        buffer = ShallowCopy( degree_list[ i ][ 1 ] );
        if (@not Length( buffer ) == nrGenerators)
        
          Error( @Concatenation( "Entry 1 of the ", StringGAP( i ), 
                 "-th list in degree_list cannot be interpreted as element of the degree group of the graded ring" ) );
          return;

        end;
        buffer_homalg_module_element = HomalgModuleElement( HomalgMatrix( [ buffer ], HomalgRing( A ) ), A );
        
        # and replace the original entry
        degree_list[ i ][ 1 ] = buffer_homalg_module_element;
      
      end;
      
      if (@not SuperObject( degree_list[ i ][ 1 ] ) == A)
      
        Error( @Concatenation( "Entry 1 of the ", StringGAP( i )
                             ,"th list in degree_list is not an element of the degree group of the homalg graded ring" ) );
        return;
      
      end;
      
      if (( @not IsInt( degree_list[ i ][ 2 ] ) ) || ( degree_list[ i ][ 2 ] < 0 ))
      
        Error( @Concatenation( "Entry 2 of the ", StringGAP( i ), 
                                                        "-th list in degree_list has to be a non-negative integer" ) );
        return;
      
      end;
    
    end;
    
    # the entered degree_list has passed all consistency checks
    # now sort this data (unless it is trivial)
    if (Length( degree_list ) > 1)
    
      degree_list = CAP_CATEGORY_OF_GRADED_ROWS_AND_COLUMNS_INTERNAL_SIMPLIFY_DATA_STRUCTURE( degree_list );
    
    end;

    # now construct the correct category
    if (left == true)
        
        category = CategoryOfGradedRows( homalg_graded_ring );
        
    else
        
        category = CategoryOfGradedColumns( homalg_graded_ring );
        
    end;
    
    # now construct the object
    rank = Sum( List( degree_list, x -> x[ 2 ] ) );
    
    # check if the object is the zero object, and if so objectify it with the empty degree_list
    if (rank == 0)
        
        degree_list = [];
        
    end;
    
    return CreateCapCategoryObjectWithAttributes( category,
                                                  DegreeList, degree_list,
                                                  RankOfObject, rank,
                                                  UnderlyingHomalgGradedRing, homalg_graded_ring );
    
end );

##
@InstallGlobalFunction( GradedRowOrColumnLazy,
  function( degree_list, homalg_graded_ring, left )
    local A, nrGenerators, i, buffer, buffer_homalg_module_element, category, rank, type;
    
    # extract the degree group of the ring and its number of generators
    A = DegreeGroup( homalg_graded_ring );
    rank = 0;
    
    # next check that the degrees lie in the degree group
    for i in (1):(Length( degree_list ))
    
      if (@not IsHomalgModuleElement( degree_list[ i ][ 1 ] ))
      
        # try to turn the first entry into a homalg module element
        buffer = ShallowCopy( degree_list[ i ][ 1 ] );
        buffer_homalg_module_element = HomalgModuleElement( HomalgMatrix( [ buffer ], HomalgRing( A ) ), A );
        degree_list[ i ][ 1 ] = buffer_homalg_module_element;
      
      end;

      rank = rank + degree_list[ i ][ 2 ];
      
    end;
    
    # sort the degree list
    if (Length( degree_list ) > 1)
    
      degree_list = CAP_CATEGORY_OF_GRADED_ROWS_AND_COLUMNS_INTERNAL_SIMPLIFY_DATA_STRUCTURE( degree_list );
    
    end;

    # set the type
    if (left == true)
        
        category = CategoryOfGradedRows( homalg_graded_ring );
        
    else
        
        category = CategoryOfGradedColumns( homalg_graded_ring );
        
    end;
    
    # check if the object is the zero object, and if so objectify it with the empty degree_list
    if (rank == 0)
        
        degree_list = [];
        
    end;
    
    return CreateCapCategoryObjectWithAttributes( category,
                                                  DegreeList, degree_list,
                                                  RankOfObject, rank,
                                                  UnderlyingHomalgGradedRing, homalg_graded_ring );
    
end );

##
@InstallMethod( GradedRow,
               [ IsList, IsHomalgGradedRing ],
  function( degree_list, homalg_graded_ring )

    return GradedRowOrColumn( degree_list, homalg_graded_ring, true );

end );

##
@InstallMethod( GradedRow,
               [ IsList, IsHomalgGradedRing, IsBool ],
  function( degree_list, homalg_graded_ring, checks_wished )

    if (checks_wished)
      return GradedRowOrColumn( degree_list, homalg_graded_ring, true );
    else
      return GradedRowOrColumnLazy( degree_list, homalg_graded_ring, true );
    end;

end );

##
@InstallMethod( GradedColumn,
               [ IsList, IsHomalgGradedRing ],
  function( degree_list, homalg_graded_ring )

    return GradedRowOrColumn( degree_list, homalg_graded_ring, false );

end );

##
@InstallMethod( GradedColumn,
               [ IsList, IsHomalgGradedRing, IsBool ],
  function( degree_list, homalg_graded_ring, checks_wished )

    if (checks_wished)
      return GradedRowOrColumn( degree_list, homalg_graded_ring, false );
    else
      return GradedRowOrColumnLazy( degree_list, homalg_graded_ring, false );
    end;

end );



####################################
##
## StringGAP
##
####################################

@InstallMethod( StringGAP,
              [ IsGradedRowOrColumn ],
               999, #FIXME FIXME FIXME
  function( graded_row_or_column )

    if (IsGradedRow( graded_row_or_column ))

       return @Concatenation( "A graded row of rank ", 
                              StringGAP( RankOfObject( graded_row_or_column ) )
                            );

    else
    
       return @Concatenation( "A graded column of rank ", 
                              StringGAP( RankOfObject( graded_row_or_column ) )
                            );

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
               [ IsGradedRowOrColumn ], 
  function( graded_row_or_column )

    if (IsGradedRow( graded_row_or_column ))
    
      Print( @Concatenation( "A graded row over ",
                            RingName( UnderlyingHomalgGradedRing( graded_row_or_column ) ),
                            " of rank ", StringGAP( RankOfObject( graded_row_or_column ) ),
                            " and degrees: \n" ) 
                            );
    
      ViewObj( DegreeList( graded_row_or_column ) );
      Print( "\n" );
    
    else
    
      Print( @Concatenation( "A graded column over ",
                            RingName( UnderlyingHomalgGradedRing( graded_row_or_column ) ),
                            " of rank ", StringGAP( RankOfObject( graded_row_or_column ) ),
                            " and degrees: \n" )
                            );

      ViewObj( DegreeList( graded_row_or_column ) );
      Print( "\n" );

    end;

end );
# =#


####################################
##
## ViewObj
##
####################################

@InstallMethod( ViewString,
               [ IsGradedRowOrColumn ],
               999, # FIX ME FIX ME
  function( graded_row_or_column )

    return @Concatenation( "<", StringGAP( graded_row_or_column ), ">" );

end );



##################################################
##
## Convenience method to access "Rank" more easily
##
##################################################

@InstallMethod( Rank,
               [ IsGradedRowOrColumn ],

  RankOfObject );



##################################################
##
## Simplify internal data
##
##################################################

@InstallMethod( CAP_CATEGORY_OF_GRADED_ROWS_AND_COLUMNS_INTERNAL_SIMPLIFY_DATA_STRUCTURE,
               [ IsList ],
  function( unsorted_degree_list )
    local i, old_degree_list, new_degree_list, counter, comparer;
    
    # run once accross the degree list and add successive equal degrees
    # example:
    # [[ a,1 ], [ a,1 ], [ b,1 ], [a,2 ]] -> [[ a,2 ], [ b,1 ], [ a,2 ]]
    # BUT this gets not simplified to say [[ a,4 ], [ b,1 ]]
    
    # here is the algorithm
    new_degree_list = [];
    counter = unsorted_degree_list[ 1 ][ 2 ];
    comparer = unsorted_degree_list[ 1 ][ 1 ];
    for i in (2):(Length( unsorted_degree_list ))
    
      # compare with the next element
      if (unsorted_degree_list[ i ][ 1 ] != comparer)
      
        Add( new_degree_list, [ comparer, counter ] );
        comparer = unsorted_degree_list[ i ][ 1 ];
        counter = unsorted_degree_list[ i ][ 2 ];
      
      else
      
        counter = counter + unsorted_degree_list[ i ][ 2 ];
      
      end;
    
      # and now react to reaching the end of the list
      if (i == Length( unsorted_degree_list ))
      
        Add( new_degree_list, [ comparer, counter ] );
      
      end;
    
    end;
    
    # return new_degree_list
    return new_degree_list;
    
end );
