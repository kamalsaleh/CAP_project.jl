# SPDX-License-Identifier: GPL-2.0-or-later
# CartesianCategories: Cartesian and cocartesian categories and various subdoctrines
#
# Implementations
#
# THIS FILE WAS AUTOMATICALLY GENERATED



@InstallGlobalFunction( "BraidedCocartesianCategoriesTest",
    
    function( cat, opposite, a, b )
        
        local verbose,
              
              a_op, braiding_a_b, braiding_a_b_op, braiding_inverse_a_b, braiding_inverse_a_b_op, 
              b_op, braiding_b_a, braiding_b_a_op, braiding_inverse_b_a, braiding_inverse_b_a_op;
        
        a_op = Opposite( opposite, a );
        b_op = Opposite( opposite, b );
        
        verbose = ValueOption( "verbose" ) == true;
        
        if (CanCompute( cat, "CocartesianBraiding" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CocartesianBraiding' ..." );
                
            end;
            
            braiding_a_b = CocartesianBraiding( a, b );
            braiding_b_a = CocartesianBraiding( b, a );
            
            braiding_inverse_a_b_op = CartesianBraidingInverse( opposite, a_op, b_op );
            braiding_inverse_b_a_op = CartesianBraidingInverse( opposite, b_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( braiding_inverse_a_b_op, Opposite( opposite, braiding_a_b ) ) );
            @Assert( 0, IsCongruentForMorphisms( braiding_inverse_b_a_op, Opposite( opposite, braiding_b_a ) ) );
            
        end;
        
        if (CanCompute( cat, "CocartesianBraidingInverse" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CocartesianBraidingInverse' ..." );
                
            end;
            
            braiding_inverse_a_b = CocartesianBraidingInverse( a, b );
            braiding_inverse_b_a = CocartesianBraidingInverse( b, a );
            
            braiding_a_b_op = CartesianBraiding( opposite, a_op, b_op );
            braiding_b_a_op = CartesianBraiding( opposite, b_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( braiding_a_b_op, Opposite( opposite, braiding_inverse_a_b ) ) );
            @Assert( 0, IsCongruentForMorphisms( braiding_b_a_op, Opposite( opposite, braiding_inverse_b_a ) ) );
            
        end;

end );
