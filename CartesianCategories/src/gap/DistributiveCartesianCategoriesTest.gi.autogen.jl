# SPDX-License-Identifier: GPL-2.0-or-later
# CartesianCategories: Cartesian and cocartesian categories and various subdoctrines
#
# Implementations
#
# THIS FILE WAS AUTOMATICALLY GENERATED



@InstallGlobalFunction( "DistributiveCartesianCategoriesTest",
    
    function( cat, opposite, a, L )
        
        local verbose,
              
              a_op, left_expanding_a_L, left_expanding_a_L_op, left_factoring_a_L, left_factoring_a_L_op, 
              L_op, right_expanding_L_a, right_expanding_L_a_op, right_factoring_L_a, right_factoring_L_a_op;
        
        a_op = Opposite( opposite, a );
        L_op = List( L, l -> Opposite( opposite, l ) );
        
        verbose = ValueOption( "verbose" ) == true;
        
        if (CanCompute( cat, "LeftCartesianDistributivityExpanding" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'LeftCartesianDistributivityExpanding' ..." );
                
            end;
            
            left_expanding_a_L = LeftCartesianDistributivityExpanding( a, L );
            left_factoring_a_L_op = LeftCocartesianCodistributivityFactoring( opposite, a_op, L_op );
            
            @Assert( 0, IsCongruentForMorphisms( left_expanding_a_L, Opposite( left_factoring_a_L_op ) ) );
            
        end;
        
        if (CanCompute( cat, "LeftCartesianDistributivityFactoring" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'LeftCartesianDistributivityFactoring' ..." );
                
            end;
            
            left_factoring_a_L = LeftCartesianDistributivityFactoring( a, L );
            left_expanding_a_L_op = LeftCocartesianCodistributivityExpanding( opposite, a_op, L_op );
            
            @Assert( 0, IsCongruentForMorphisms( left_factoring_a_L, Opposite( left_expanding_a_L_op ) ) );
            
        end;
        
        if (CanCompute( cat, "RightCartesianDistributivityExpanding" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'RightCartesianDistributivityExpanding' ..." );
                
            end;
            
            right_expanding_L_a = RightCartesianDistributivityExpanding( L, a );
            right_factoring_L_a_op = RightCocartesianCodistributivityFactoring( opposite, L_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( right_expanding_L_a, Opposite( right_factoring_L_a_op ) ) );
            
        end;
        
        if (CanCompute( cat, "RightCartesianDistributivityFactoring" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'RightCartesianDistributivityFactoring' ..." );
                
            end;
            
            right_factoring_L_a = RightCartesianDistributivityFactoring( L, a );
            right_expanding_L_a_op = RightCocartesianCodistributivityExpanding( opposite, L_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( right_factoring_L_a, Opposite( right_expanding_L_a_op ) ) );
            
        end;
        
end );
