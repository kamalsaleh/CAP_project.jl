# SPDX-License-Identifier: GPL-2.0-or-later
# CartesianCategories: Cartesian and cocartesian categories and various subdoctrines
#
# Implementations
#
# THIS FILE WAS AUTOMATICALLY GENERATED



##
@InstallMethod( TestCartesianBraidingCompatibility,
              [ IsCapCategory, IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ],
              
  function( cat, object_1, object_2, object_3 )
    local morphism_left, morphism_right;
    
    @Assert( 0, HasIsCartesianCategory( cat ) && IsCartesianCategory( cat ) );
    @Assert( 0, IsIdenticalObj( cat, CapCategory( object_1 ) ) );
    @Assert( 0, IsIdenticalObj( cat, CapCategory( object_2 ) ) );
    @Assert( 0, IsIdenticalObj( cat, CapCategory( object_3 ) ) );
    
    morphism_left = CartesianBraiding( BinaryDirectProduct( cat, object_1, object_2 ), object_3 );
    
    morphism_left = PreCompose( morphism_left, CartesianAssociatorRightToLeft( object_3, object_1, object_2 ) );
    
    morphism_left = PreCompose( morphism_left,
                    DirectProductOnMorphisms( CartesianBraiding( object_3, object_1 ), IdentityMorphism( object_2 ) ) );
    
    morphism_right = CartesianAssociatorLeftToRight( object_1, object_2, object_3 );
    
    morphism_right = PreCompose( morphism_right,
                    DirectProductOnMorphisms( IdentityMorphism( object_1 ), CartesianBraiding( object_2, object_3 ) ) );
    
    morphism_right = PreCompose( morphism_right, CartesianAssociatorRightToLeft( object_1, object_3, object_2 ) );
    
    if (!( morphism_left == morphism_right ))
        
        return false;
        
    end;
    
    morphism_left = CartesianBraiding( object_1, BinaryDirectProduct( cat, object_2, object_3 ) );
    
    morphism_left = PreCompose( morphism_left, CartesianAssociatorLeftToRight( object_2, object_3, object_1 ) );
    
    morphism_left = PreCompose( morphism_left,
                    DirectProductOnMorphisms( IdentityMorphism( object_2 ), CartesianBraiding( object_3, object_1 ) ) );
    
    morphism_right = CartesianAssociatorRightToLeft( object_1, object_2, object_3 );
    
    morphism_right = PreCompose( morphism_right,
                    DirectProductOnMorphisms( CartesianBraiding( object_1, object_2 ), IdentityMorphism( object_3 ) ) );
    
    morphism_right = PreCompose( morphism_right, CartesianAssociatorLeftToRight( object_2, object_1, object_3 ) );
    
    return morphism_left == morphism_right;
    
end );

##
@InstallMethod( TestCartesianBraidingCompatibilityForAllTriplesInList,
               [ IsCapCategory, IsList ],
               
  function( cat, object_list )
    local a, b, c, size, list, test;
    
    size = Length( object_list );
    
    list = (1):(size);
    
    for a in list
        
        for b in list
            
            for c in list
                
                test = TestCartesianBraidingCompatibility( cat, object_list[a], object_list[b], object_list[c] );
                
                if (@not test)
                    
                    Print( "indices of failing triple: ", [ a, b, c ], "\n" );
                    
                    return false;
                    
                end;
                
            end;
            
        end;
        
    end;
    
end );

##
@InstallGlobalFunction( "BraidedCartesianCategoriesTest",
    function( cat, opposite, a, b )
        local verbose,
              
              a_op, braiding_a_b, braiding_a_b_op, braiding_inverse_a_b, braiding_inverse_a_b_op, 
              b_op, braiding_b_a, braiding_b_a_op, braiding_inverse_b_a, braiding_inverse_b_a_op;
        
        a_op = Opposite( opposite, a );
        b_op = Opposite( opposite, b );
        
        verbose = ValueOption( "verbose" ) == true;
        
        if (IsEmpty( MissingOperationsForConstructivenessOfCategory( cat, "IsCartesianCategory" ) ))
            
            @Assert( 0, TestCartesianBraidingCompatibility( cat, a, b, a ) );
            
        end;
        
        if (IsEmpty( MissingOperationsForConstructivenessOfCategory( opposite, "IsCartesianCategory" ) ))
            
            @Assert( 0, TestCartesianBraidingCompatibility( opposite, a_op, b_op, a_op ) );
            
        end;
        
        if (CanCompute( cat, "CartesianBraiding" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianBraiding' ..." );
                
            end;
            
            braiding_a_b = CartesianBraiding( a, b );
            braiding_b_a = CartesianBraiding( b, a );
            
            braiding_inverse_a_b_op = CocartesianBraidingInverse( opposite, a_op, b_op );
            braiding_inverse_b_a_op = CocartesianBraidingInverse( opposite, b_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( braiding_inverse_a_b_op, Opposite( opposite, braiding_a_b ) ) );
            @Assert( 0, IsCongruentForMorphisms( braiding_inverse_b_a_op, Opposite( opposite, braiding_b_a ) ) );
            
        end;
        
        if (CanCompute( cat, "CartesianBraidingInverse" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianBraidingInverse' ..." );
                
            end;
            
            braiding_inverse_a_b = CartesianBraidingInverse( a, b );
            braiding_inverse_b_a = CartesianBraidingInverse( b, a );
            
            braiding_a_b_op = CocartesianBraiding( opposite, a_op, b_op );
            braiding_b_a_op = CocartesianBraiding( opposite, b_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( braiding_a_b_op, Opposite( opposite, braiding_inverse_a_b ) ) );
            @Assert( 0, IsCongruentForMorphisms( braiding_b_a_op, Opposite( opposite, braiding_inverse_b_a ) ) );
            
        end;

end );
