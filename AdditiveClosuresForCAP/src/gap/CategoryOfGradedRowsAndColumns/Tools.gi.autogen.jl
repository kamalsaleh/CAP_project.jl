#############################################################################
##
## AdditiveClosuresForCAP package
##
## Copyright 2019, Martin Bies,       ULB Brussels
##
## Chapter Tool methods
##
#############################################################################

############################################
##
## @Section Tools to simplify the code
##
############################################

@InstallGlobalFunction( DEDUCE_MAP_FROM_MATRIX_AND_RANGE_FOR_GRADED_ROWS,
  function( matrix, range_object, is_strict )
    local homalg_graded_ring, source_object, non_zero_entries_index, expanded_degree_list, j, k,
           degrees_of_matrix_rows, degrees_of_source_object, positions_of_non_trivial_rows;

      # check if the input is valid
      if (@not IsIdenticalObj( HomalgRing( matrix ), UnderlyingHomalgGradedRing( range_object ) ))

        Error( "The matrix must be defined over the same ring that the range_object was defined over" );
        return;

      elseif (@not Rank( range_object ) == NrColumns( matrix ))

        Error( "The rank of the range object and the number of columns of the desired mapping matrix do not match ");
        return;

      elseif (is_strict && NrRows( matrix ) != 0 && NrColumns( matrix) == 0)

        Error( "The source_object cannot be determined uniquely" );
        return;

      elseif (is_strict && NrRows( matrix ) != 0 && NrColumns( matrix) != 0 && Length( ZeroRows( matrix ) ) != 0)

        Error( "The source_object cannot be determined uniquely" );
        return;

      end;

      # the input is valid, so continue by setting the homalg_graded_ring
      homalg_graded_ring = HomalgRing( matrix );

      # if the range is zero then return well-defined map that complies with the input
      if (NrRows( matrix ) != 0 && NrColumns( matrix) == 0)

        source_object = GradedRow( [ [ Degree( One( homalg_graded_ring ) ), NrRows( matrix ) ] ], homalg_graded_ring );

        return ZeroMorphism( source_object, range_object );

      # check if the source is the zero object
      elseif (NrRows( matrix ) == 0)

        # if so, then the source is the zero module
        return ZeroMorphism( ZeroObject( CapCategory( range_object ) ), range_object );

      else

        # source and range are non-trivial and the mapping matrix has no zero rows, therefore the following is well-defined
        non_zero_entries_index = PositionOfFirstNonZeroEntryPerRow( matrix );

        # expand the degree_list of the range_object
        expanded_degree_list = [];
        for j in (1):(Length( DegreeList( range_object ) ))

          for k in (1):(DegreeList( range_object )[ j ][ 2 ] )

            Add( expanded_degree_list, DegreeList( range_object )[ j ][ 1 ] );

          end;

        end;

        # compute the degrees of the rows of the mapping_matrix
        degrees_of_matrix_rows = NonTrivialDegreePerRow( matrix );

        # initialise the degree list of the source_object.
        # The degrees for now are all equal to the degree of the unit in the homalg graded ring.
        degrees_of_source_object = ListWithIdenticalEntries( Length( degrees_of_matrix_rows ), [ Degree( One( homalg_graded_ring ) ), 1 ] );

        # indices of degrees that need to be adjusted
        positions_of_non_trivial_rows = PositionsProperty( non_zero_entries_index, index -> @not IsZero( index ) );

        # and now compute the degrees of the source_object
        for j in positions_of_non_trivial_rows

          degrees_of_source_object[ j ] = [ expanded_degree_list[ non_zero_entries_index[ j ] ]
                                                                                 - degrees_of_matrix_rows[ j ], 1 ];

        end;

        # and compute the source object
        source_object = GradedRow( degrees_of_source_object, homalg_graded_ring,
                                        CapCategory( range_object ).constructor_checks_wished );

        # and return the mapping
        return GradedRowOrColumnMorphism( source_object, matrix, range_object,
                                            CapCategory( range_object ).constructor_checks_wished );

      end;

end );

@InstallGlobalFunction( DEDUCE_MAP_FROM_MATRIX_AND_SOURCE_FOR_GRADED_ROWS,
  function( matrix, source_object, is_strict )
    local homalg_graded_ring, range_object, non_zero_entries_index, expanded_degree_list, j, k,
           degrees_of_matrix_columns, degrees_of_range_object, positions_of_non_trivial_cols;

      # check if the input is valid
      if (@not IsIdenticalObj( HomalgRing( matrix ), UnderlyingHomalgGradedRing( source_object ) ))

        Error( "The matrix must be defined over the same ring that the source_object was defined over" );
        return;

      elseif (@not Rank( source_object ) == NrRows( matrix ))

        Error( "The rank of the source object and the number of rows of the desired mapping matrix do not match ");
        return;

      elseif (is_strict && NrRows( matrix ) == 0 && NrColumns( matrix) != 0)

        Error( "The range_object cannot be determined uniquely" );
        return;

      elseif (is_strict && NrRows( matrix ) != 0 && NrColumns( matrix) != 0 && Length( ZeroColumns( matrix ) ) != 0)

        Error( "The range_object cannot be determined uniquely" );
        return;

      end;

      # the input is valid, so continue by setting the homalg_graded_ring
      homalg_graded_ring = HomalgRing( matrix );

      # if the source is zero then return well-defined map that complies with the input
      if (NrRows( matrix ) == 0 && NrColumns( matrix) != 0)

        range_object = GradedRow( [ [ Degree( One( homalg_graded_ring ) ), NrCols( matrix ) ] ], homalg_graded_ring );

        return ZeroMorphism( source_object, range_object );

      # check if the range is the zero object
      elseif (NrColumns( matrix ) == 0)

        # if so, then the range is the zero module
        return ZeroMorphism( source_object, ZeroObject( CapCategory( source_object ) ) );

      else

        # the source and range and non-trivial and the mapping_matrix has no zero columns
        non_zero_entries_index = PositionOfFirstNonZeroEntryPerColumn( matrix );

        # expand the degree_list of the range of the morphism
        expanded_degree_list = [];
        for j in (1):(Length( DegreeList( source_object ) ))

          for k in (1):(DegreeList( source_object )[ j ][ 2 ] )

            Add( expanded_degree_list, DegreeList( source_object )[ j ][ 1 ] );

          end;

        end;

        # compute the degrees of the columns of the mapping_matrix
        degrees_of_matrix_columns = NonTrivialDegreePerColumn( matrix );

        # initialise the degree list of the range_object
        # The degrees for now are all equal to the degree of the unit in the homalg graded ring.
        degrees_of_range_object = ListWithIdenticalEntries( Length( degrees_of_matrix_columns ), [ Degree( One( homalg_graded_ring ) ), 1 ] );

        # indices of degrees that need to be adjusted
        positions_of_non_trivial_cols = PositionsProperty( non_zero_entries_index, index -> @not IsZero( index ) );

        # and now compute the degrees of the range_object
        for j in positions_of_non_trivial_cols

          degrees_of_range_object[ j ] = [ expanded_degree_list[ non_zero_entries_index[ j ] ]
                                                                                 + degrees_of_matrix_columns[ j ], 1 ];

        end;

        # and compute the range object
        range_object = GradedRow( degrees_of_range_object, homalg_graded_ring,
                                    CapCategory( source_object ).constructor_checks_wished );

        # and return the mapping
        return GradedRowOrColumnMorphism( source_object, matrix, range_object,
                                           CapCategory( source_object ).constructor_checks_wished );

      end;

end );

@InstallGlobalFunction( DEDUCE_MAP_FROM_MATRIX_AND_RANGE_FOR_GRADED_COLS,
  function( matrix, range_object, is_strict )
    local homalg_graded_ring, source_object, non_zero_entries_index, expanded_degree_list, j, k,
           degrees_of_matrix_columns, degrees_of_source_object, positions_of_non_trivial_cols;

      # check if the input is valid
      if (@not IsIdenticalObj( HomalgRing( matrix ), UnderlyingHomalgGradedRing( range_object ) ))

        Error( "The matrix must be defined over the same ring that the range_object was defined over" );
        return;

      elseif (@not Rank( range_object ) == NrRows( matrix ))

        Error( "The rank of the range object and the number of rows of the desired mapping matrix do not match ");
        return;

      elseif (is_strict && NrColumns( matrix ) != 0 && NrRows( matrix) == 0)

        Error( "The source_object cannot be determined uniquely" );
        return;

      elseif (is_strict && NrRows( matrix ) != 0 && NrColumns( matrix) != 0 && Length( ZeroColumns( matrix ) ) != 0)

        Error( "The source_object cannot be determined uniquely" );
        return;

      end;

      # the input is valid, so continue by setting the homalg_graded_ring
      homalg_graded_ring = HomalgRing( matrix );

      # if the range is zero then return well-defined map that complies with the input
      if (NrColumns( matrix ) != 0 && NrRows( matrix) == 0)

        source_object = GradedColumn( [ [ Degree( One( homalg_graded_ring ) ), NrColumns( matrix ) ] ], homalg_graded_ring );

        return ZeroMorphism( source_object, range_object );


      # check if the source is the zero object
      elseif (NrColumns( matrix ) == 0)

        # if so, then the source is the zero object
        return ZeroMorphism( ZeroObject( CapCategory( range_object ) ), range_object );

      else

        # both source and range are non-trivial and the mapping_matrix has no zero columns
        non_zero_entries_index = PositionOfFirstNonZeroEntryPerColumn( matrix );

        # expand the degree_list of the range of the morphism
        expanded_degree_list = [];
        for j in (1):(Length( DegreeList( range_object ) ))

          for k in (1):(DegreeList( range_object )[ j ][ 2 ] )

            Add( expanded_degree_list, DegreeList( range_object )[ j ][ 1 ] );

          end;

        end;

        # compute the degrees of the rows of the mapping_matrix
        degrees_of_matrix_columns = NonTrivialDegreePerColumn( matrix );

        # initialise the degree list of the source_object
        # The degrees for now are all equal to the degree of the unit in the homalg graded ring.
        degrees_of_source_object = ListWithIdenticalEntries( Length( degrees_of_matrix_columns ), [ Degree( One( homalg_graded_ring ) ), 1 ] );

        # indices of degrees that need to be adjusted
        positions_of_non_trivial_cols = PositionsProperty( non_zero_entries_index, index -> @not IsZero( index ) );

        # and now compute the degrees of the source_object
        for j in positions_of_non_trivial_cols

          degrees_of_source_object[ j ] = [ expanded_degree_list[ non_zero_entries_index[ j ] ]
                                                                                 - degrees_of_matrix_columns[ j ], 1 ];

        end;

        # construct the kernel_object
        source_object = GradedColumn( degrees_of_source_object, homalg_graded_ring,
                                        CapCategory( range_object ).constructor_checks_wished );

        # and return the kernel embedding
        return GradedRowOrColumnMorphism( source_object, matrix, range_object,
                                           CapCategory( range_object ).constructor_checks_wished );

      end;

end );

@InstallGlobalFunction( DEDUCE_MAP_FROM_MATRIX_AND_SOURCE_FOR_GRADED_COLS,
  function( matrix, source_object, is_strict )
    local homalg_graded_ring, range_object, non_zero_entries_index, expanded_degree_list, j, k,
           degrees_of_matrix_rows, degrees_of_range_object, positions_of_non_trivial_rows;

      # check if the input is valid
      if (@not IsIdenticalObj( HomalgRing( matrix ), UnderlyingHomalgGradedRing( source_object ) ))

        Error( "The matrix must be defined over the same ring that the source_object was defined over" );
        return;

      elseif (@not Rank( source_object ) == NrColumns( matrix ))

        Error( "The rank of the source object and the number of columns of the desired mapping matrix do not match ");
        return;

      elseif (is_strict && NrColumns( matrix ) == 0 && NrRows( matrix) != 0)

        Error( "The range_object cannot be determined uniquely" );
        return;

      elseif (is_strict && NrRows( matrix ) != 0 && NrColumns( matrix) != 0 && Length( ZeroRows( matrix ) ) != 0)

        Error( "The range_object cannot be determined uniquely" );
        return;

      end;

      # the input is valid, so continue by setting the homalg_graded_ring
      homalg_graded_ring = HomalgRing( matrix );

      # if the source is zero then return well-defined map that complies with the input
      if (NrColumns( matrix ) == 0 && NrRows( matrix) != 0)

        range_object = GradedColumn( [ [ Degree( One( homalg_graded_ring ) ), NrRows( matrix ) ] ], homalg_graded_ring );

        return ZeroMorphism( source_object, range_object );


      # check if the range is the zero object
      elseif (IsZero( matrix ))

        # if so, then the range is the zero module
        return ZeroMorphism( source_object, ZeroObject( CapCategory( source_object ) ) );

      else

        # source and range are non-trivial and the mapping_matrix has no zero rows
        non_zero_entries_index = PositionOfFirstNonZeroEntryPerRow( matrix );

        # expand the degree_list of the range of the morphism
        expanded_degree_list = [];
        for j in (1):(Length( DegreeList( source_object ) ))

          for k in (1):(DegreeList( source_object )[ j ][ 2 ] )

            Add( expanded_degree_list, DegreeList( source_object )[ j ][ 1 ] );

          end;

        end;

        # compute the degrees of the rows of the cokernel matrix
        degrees_of_matrix_rows = NonTrivialDegreePerRow( matrix );

        # initialise the degree list of the cokernel_object
        # The degrees for now are all equal to the degree of the unit in the homalg graded ring.
        degrees_of_range_object = ListWithIdenticalEntries( Length( degrees_of_matrix_rows ), [ Degree( One( homalg_graded_ring ) ), 1 ] );

        positions_of_non_trivial_rows = PositionsProperty( non_zero_entries_index, index -> @not IsZero( index ) );

        # and now compute the degrees of the cokernel_object
        for j in positions_of_non_trivial_rows

          degrees_of_range_object[ j ] = [ expanded_degree_list[ non_zero_entries_index[ j ] ]
                                                                                 + degrees_of_matrix_rows[ j ], 1 ];

        end;

        # and from them the cokernel object
        range_object = GradedColumn( degrees_of_range_object, homalg_graded_ring,
                                       CapCategory( source_object ).constructor_checks_wished );

        # and return the mapping morphism
        return GradedRowOrColumnMorphism( source_object, matrix, range_object,
                                           CapCategory( source_object ).constructor_checks_wished );

      end;

end );

## Methods

##
@InstallMethod( DeduceMapFromMatrixAndRangeForGradedRows,
            [ IsHomalgMatrix, IsGradedRow ],
  function( mat, range_object )

    return DEDUCE_MAP_FROM_MATRIX_AND_RANGE_FOR_GRADED_ROWS( mat, range_object, true );

end );

##
@InstallMethod( DeduceSomeMapFromMatrixAndRangeForGradedRows,
            [ IsHomalgMatrix, IsGradedRow ],
  function( mat, range_object )

    return DEDUCE_MAP_FROM_MATRIX_AND_RANGE_FOR_GRADED_ROWS( mat, range_object, false );

end );

##
@InstallMethod( DeduceMapFromMatrixAndSourceForGradedRows,
            [ IsHomalgMatrix, IsGradedRow ],
  function( mat, source_object )

    return DEDUCE_MAP_FROM_MATRIX_AND_SOURCE_FOR_GRADED_ROWS( mat, source_object, true );

end );

##
@InstallMethod( DeduceSomeMapFromMatrixAndSourceForGradedRows,
            [ IsHomalgMatrix, IsGradedRow ],
  function( mat, source_object )

    return DEDUCE_MAP_FROM_MATRIX_AND_SOURCE_FOR_GRADED_ROWS( mat, source_object, false );

end );

##
@InstallMethod( DeduceMapFromMatrixAndRangeForGradedCols,
            [ IsHomalgMatrix, IsGradedColumn ],
  function( mat, range_object )

    return DEDUCE_MAP_FROM_MATRIX_AND_RANGE_FOR_GRADED_COLS( mat, range_object, true );

end );

##
@InstallMethod( DeduceSomeMapFromMatrixAndRangeForGradedCols,
            [ IsHomalgMatrix, IsGradedColumn ],
  function( mat, range_object )

    return DEDUCE_MAP_FROM_MATRIX_AND_RANGE_FOR_GRADED_COLS( mat, range_object, false );

end );

##
@InstallMethod( DeduceMapFromMatrixAndSourceForGradedCols,
            [ IsHomalgMatrix, IsGradedColumn ],
  function( mat, source_object )

    return DEDUCE_MAP_FROM_MATRIX_AND_SOURCE_FOR_GRADED_COLS( mat, source_object, true );

end );

##
@InstallMethod( DeduceSomeMapFromMatrixAndSourceForGradedCols,
            [ IsHomalgMatrix, IsGradedColumn ],
  function( mat, source_object )

    return DEDUCE_MAP_FROM_MATRIX_AND_SOURCE_FOR_GRADED_COLS( mat, source_object, false );

end );


##
@InstallMethod( UnzipDegreeList,
               [ IsGradedRowOrColumn ],
  function( rowOrCol )
    local old_degree_list, i, j, new_degree_list;

    old_degree_list = DegreeList( rowOrCol );
    new_degree_list = [];

    for i in (1):(Length( old_degree_list ))

      new_degree_list = @Concatenation( new_degree_list, 
                                        List( (1):(old_degree_list[ i ][ 2 ] ), k -> old_degree_list[ i ][ 1 ] ) );

    end;

    return new_degree_list;

end );

