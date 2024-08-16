# SPDX-License-Identifier: GPL-2.0-or-later
# LinearAlgebraForCAP: Category of Matrices over a Field for CAP
#
# Implementations
#

####################################
##
## Constructors
##
####################################

##
@InstallMethod( AsVectorSpaceMorphism,
               [ IsHomalgMatrix ],
               
  function( homalg_matrix )
    local field;
    
    Print( "WARNING: AsVectorSpaceMorphism is deprecated and will not be supported after 2025.08.14. Use `<homalg_matrix> / <matrix_category>` instead.\n" );
    
    field = HomalgRing( homalg_matrix );
    
    return VectorSpaceMorphism(
      VectorSpaceObject( NrRows( homalg_matrix ), field ),
      homalg_matrix,
      VectorSpaceObject( NrColumns( homalg_matrix ), field )
    );
    
end );

##
# convenience
@InstallMethod( VectorSpaceMorphism,
               [ IsVectorSpaceObject, IsList, IsVectorSpaceObject ],
               
  function( source, element_list, range )
    local field, homalg_matrix;
    
    field = UnderlyingRing( CapCategory( source ) );
    
    homalg_matrix = HomalgMatrix( element_list, AsInteger( source ), AsInteger( range ), field );
    
    return VectorSpaceMorphism( source, homalg_matrix, range );
    
end );

##
# convenience
@InstallMethod( VectorSpaceMorphism,
               [ IsVectorSpaceObject, IsHomalgMatrix, IsVectorSpaceObject ],
               
  function( source, homalg_matrix, range )
    
    return VectorSpaceMorphism( CapCategory( source ), source, homalg_matrix, range );
    
end );

##
@InstallMethod( VectorSpaceMorphism,
                                     [ IsMatrixCategory, IsVectorSpaceObject, IsHomalgMatrix, IsVectorSpaceObject ],
                                     
  function( cat, source, homalg_matrix, range )
    
    if (@not IsHomalgMatrix( homalg_matrix ))
        
        Error( "the morphism datum must be a homalg matrix" );
        
    end;
    
    if (@not IsIdenticalObj( HomalgRing( homalg_matrix ), UnderlyingRing( cat ) ))
        
        Error( "the matrix is defined over a different ring than the category" );
        
    end;
    
    if (NrRows( homalg_matrix ) != AsInteger( source ))
        
        Error( "the number of rows has to be equal to the dimension of the source" );
        
    end;
    
    if (NrColumns( homalg_matrix ) != AsInteger( range ))
        
        Error( "the number of columns has to be equal to the dimension of the range" );
        
    end;
    
    return AsCapCategoryMorphism( cat, source, homalg_matrix, range );
    
end );

####################################
##
## Attributes
##
####################################

##
@InstallMethod( UnderlyingFieldForHomalg,
               [ IsVectorSpaceMorphism ],
               
  function( morphism )
    
    return UnderlyingRing( CapCategory( morphism ) );
    
end );

##
@InstallMethod( UnderlyingMatrix,
               [ IsVectorSpaceMorphism ],
               
  function( morphism )
    
    return AsHomalgMatrix( morphism );
    
end );

####################################
##
## View
##
####################################

##
@InstallMethod( DisplayString,
               [ IsVectorSpaceMorphism ],
               
  function( vector_space_morphism )
    
    return @Concatenation( StringDisplay( AsHomalgMatrix( vector_space_morphism ) ), "\n", StringMutable( vector_space_morphism ), "\n" );
    
end );

##
#= comment for Julia
@InstallMethod( LaTeXOutput,
          [ IsVectorSpaceMorphism ],
          
  function( vector_space_morphism )
    local matrix;
    
    matrix = LaTeXOutput( AsHomalgMatrix( vector_space_morphism ) );
    
    if (ValueOption( "OnlyDatum" ) == true)
       
       return @Concatenation(
        """[\color[blue][""",
        matrix,
        """]]"""
      );
      
    else
      
      return @Concatenation(
        LaTeXOutput( Source( vector_space_morphism ) ),
        """[\color[blue][\xrightarrow[""",
        matrix,
        """]]]""",
        LaTeXOutput( Range( vector_space_morphism ) )
      );
      
    end;
    
end );
# =#

####################################
##
## Convenience
##
####################################

##
@InstallMethod( /,
               [ IsHomalgMatrix, IsMatrixCategory ],
  function( homalg_matrix, category )
    local field;
    
    field = HomalgRing( homalg_matrix );
    
    return VectorSpaceMorphism(
      MatrixCategoryObject( category, NrRows( homalg_matrix ) ),
      homalg_matrix,
      MatrixCategoryObject( category, NrColumns( homalg_matrix ) )
    );
    
end );
