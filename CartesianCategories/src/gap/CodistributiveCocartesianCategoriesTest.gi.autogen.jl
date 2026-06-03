# SPDX-License-Identifier: GPL-2.0-or-later
# CartesianCategories: Cartesian and cocartesian categories and various subdoctrines
#
# Implementations
#
# THIS FILE WAS AUTOMATICALLY GENERATED



@InstallGlobalFunction( "CodistributiveCocartesianCategoriesTest",
    
    function( cat, opposite, a, L, M )
        
        local verbose,
              
              a_op, left_expanding_a_L, left_expanding_a_L_op, left_factoring_a_L, left_factoring_a_L_op, 
              L_op, right_expanding_L_a, right_expanding_L_a_op, right_factoring_L_a, right_factoring_L_a_op;
        
        a_op = Opposite( opposite, a );
        L_op = List( L, l -> Opposite( opposite, l ) );
        
        verbose = ValueOption( "verbose" ) == true;
        
        if (CanCompute( cat, "LeftCocartesianCodistributivityExpanding" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'LeftCocartesianCodistributivityExpanding' ..." );
                
            end;
            
            left_expanding_a_L = LeftCocartesianCodistributivityExpanding( a, L );
            left_factoring_a_L_op = LeftCartesianDistributivityFactoring( opposite, a_op, L_op );
            
            @Assert( 0, IsCongruentForMorphisms( left_expanding_a_L, Opposite( left_factoring_a_L_op ) ) );
            
        end;
        
        if (CanCompute( cat, "LeftCocartesianCodistributivityExpandingUsingMultiplicities" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'LeftCocartesianCodistributivityExpandingUsingMultiplicities' ..." );
                
            end;
            
            left_expanding_a_L = LeftCocartesianCodistributivityExpandingUsingMultiplicities( a, L, M );
            left_factoring_a_L_op = LeftCocartesianCodistributivityFactoringUsingMultiplicities( opposite, a_op, L_op, M );
            
            @Assert( 0, IsCongruentForMorphisms( left_expanding_a_L, Opposite( left_factoring_a_L_op ) ) );
            
        end;
        
        if (CanCompute( cat, "LeftCocartesianCodistributivityFactoring" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'LeftCocartesianCodistributivityFactoring' ..." );
                
            end;
            
            left_factoring_a_L = LeftCocartesianCodistributivityFactoring( a, L );
            left_expanding_a_L_op = LeftCartesianDistributivityExpanding( opposite, a_op, L_op );
            
            @Assert( 0, IsCongruentForMorphisms( left_factoring_a_L, Opposite( left_expanding_a_L_op ) ) );
            
        end;
        
        if (CanCompute( cat, "LeftCocartesianCodistributivityFactoringUsingMultiplicities" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'LeftCocartesianCodistributivityFactoringUsingMultiplicities' ..." );
                
            end;
            
            left_factoring_a_L = LeftCocartesianCodistributivityFactoringUsingMultiplicities( a, L, M );
            left_expanding_a_L_op = LeftCocartesianCodistributivityExpandingUsingMultiplicities( opposite, a_op, L_op, M );
            
            @Assert( 0, IsCongruentForMorphisms( left_factoring_a_L, Opposite( left_expanding_a_L_op ) ) );
            
        end;
        
        if (CanCompute( cat, "RightCocartesianCodistributivityExpanding" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'RightCocartesianCodistributivityExpanding' ..." );
                
            end;
            
            right_expanding_L_a = RightCocartesianCodistributivityExpanding( L, a );
            right_factoring_L_a_op = RightCartesianDistributivityFactoring( opposite, L_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( right_expanding_L_a, Opposite( right_factoring_L_a_op ) ) );
            
        end;
        
        if (CanCompute( cat, "RightCocartesianCodistributivityExpandingUsingMultiplicities" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'RightCocartesianCodistributivityExpandingUsingMultiplicities' ..." );
                
            end;
            
            right_expanding_L_a = RightCocartesianCodistributivityExpandingUsingMultiplicities( L, M, a );
            right_factoring_L_a_op = RightCocartesianCodistributivityFactoringUsingMultiplicities( opposite, L_op, M, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( right_expanding_L_a, Opposite( right_factoring_L_a_op ) ) );
            
        end;
        
        if (CanCompute( cat, "RightCocartesianCodistributivityFactoring" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'RightCocartesianCodistributivityFactoring' ..." );
                
            end;
            
            right_factoring_L_a = RightCocartesianCodistributivityFactoring( L, a );
            right_expanding_L_a_op = RightCartesianDistributivityExpanding( opposite, L_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( right_factoring_L_a, Opposite( right_expanding_L_a_op ) ) );
            
        end;
        
        if (CanCompute( cat, "RightCocartesianCodistributivityFactoringUsingMultiplicities" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'RightCocartesianCodistributivityFactoringUsingMultiplicities' ..." );
                
            end;
            
            right_factoring_L_a = RightCocartesianCodistributivityFactoringUsingMultiplicities( L, M, a );
            right_expanding_L_a_op = RightCocartesianCodistributivityExpandingUsingMultiplicities( opposite, L_op, M, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( right_factoring_L_a, Opposite( right_expanding_L_a_op ) ) );
            
        end;
end );
