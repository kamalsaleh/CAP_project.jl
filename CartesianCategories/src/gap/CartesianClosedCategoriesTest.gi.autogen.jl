# SPDX-License-Identifier: GPL-2.0-or-later
# CartesianCategories: Cartesian and cocartesian categories and various subdoctrines
#
# Implementations
#
# THIS FILE WAS AUTOMATICALLY GENERATED



@InstallGlobalFunction( "CartesianClosedCategoriesTest",
    
    function( cat, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta )
        
        local verbose,
              
              a_op, c_op,
              b_op, d_op,
              
              id_a_tensor_b, id_b_tensor_a,
              
              exp_ab, coexp_ab_op, id_exp_ab,
              exp_ba, coexp_ba_op, id_exp_ba,
              
              alpha_op, exp_alpha_beta, coexp_alpha_beta_op,
              beta_op,  exp_beta_alpha, coexp_beta_alpha_op,
              
              ev_ab, coev_ab, coca_ev_ab_op, coca_coev_ab_op,
              ev_ba, coev_ba, coca_ev_ba_op, coca_coev_ba_op,
              
              raiso, laiso, H_ab_ba_c,
              
              alpha_tensor_beta, alpha_tensor_beta_op,
              beta_tensor_alpha, beta_tensor_alpha_op,
              
              exp_to_tensor_adjunction_on_id_exp_ab, tensor_to_exp_adjunction_on_id_a_tensor_b,
              exp_to_tensor_adjunction_on_id_exp_ba, tensor_to_exp_adjunction_on_id_b_tensor_a,

              tensor_to_exp_adjunction_on_alpha_tensor_beta, tensor_to_coexp_adjunction_on_alpha_tensor_beta_op,
              tensor_to_exp_adjunction_on_beta_tensor_alpha, tensor_to_coexp_adjunction_on_beta_tensor_alpha_op,
              
              exp_to_tensor_adjunction_on_exp_alpha_beta, coexp_to_tensor_adjunction_on_coexp_alpha_beta_op,
              exp_to_tensor_adjunction_on_exp_beta_alpha, coexp_to_tensor_adjunction_on_coexp_beta_alpha_op,
              
              precompose_abc, precocompose_abc_op, postcompose_abc, postcocompose_abc_op, 
              precompose_cba, precocompose_cba_op, postcompose_cba, postcocompose_cba_op,
              
              a_dual, a_codual_op, dual_alpha, codual_alpha_op,
              b_dual, b_codual_op, dual_beta, codual_beta_op,
              
              ev_for_dual_a, coca_ev_for_codual_a_op,
              ev_for_dual_b, coca_ev_for_codual_b_op,
                  
              morphism_to_bidual_a, morphism_from_cobidual_a_op,
              morphism_to_bidual_b, morphism_from_cobidual_b_op,
              
              tensor_to_exp_compatibility_abcd, coexp_to_tensor_compatibility_abcd_op,
              tensor_to_exp_compatibility_cadb, coexp_to_tensor_compatibility_bdac_op,
              
              direct_product_duality_compatibility_ab, coduality_direct_product_compatibility_ab_op,
              direct_product_duality_compatibility_ba, coduality_direct_product_compatibility_ba_op,
              
              morphism_from_direct_product_to_exp_ab, morphism_from_coexp_to_direct_product_ab_op,
              morphism_from_direct_product_to_exp_ba, morphism_from_coexp_to_direct_product_ba_op,
              
              isomorphism_from_dual_to_exp_a, isomorphism_from_exp_to_dual_a,
              isomorphism_from_dual_to_exp_b, isomorphism_from_exp_to_dual_b,
              
              isomorphism_from_codual_to_coexp_a_op, isomorphism_from_coexp_to_codual_a_op,
              isomorphism_from_codual_to_coexp_b_op, isomorphism_from_coexp_to_codual_b_op,
              
              gamma_op, universal_property_of_dual_gamma, universal_property_of_codual_gamma_op,
              delta_op, universal_property_of_dual_delta, universal_property_of_codual_delta_op,
              
              lambda_intro_alpha, colambda_intro_alpha_op,
              lambda_intro_beta,  colambda_intro_beta_op,
              
              epsilon_op, lambda_elim_epsilon, colambda_elim_epsilon_op,
              zeta_op,    lambda_elim_zeta,    colambda_elim_zeta_op,
              
              isomorphism_from_a_to_hom, isomorphism_from_exp_to_a, isomorphism_from_a_to_coexp_op, isomorphism_from_coexp_to_a_op,
              isomorphism_from_b_to_hom, isomorphism_from_exp_to_b, isomorphism_from_b_to_coexp_op, isomorphism_from_coexp_to_b_op;
        
        a_op = Opposite( opposite, a );
        b_op = Opposite( opposite, b );
        c_op = Opposite( opposite, c );
        d_op = Opposite( opposite, d );
        
        alpha_op = Opposite( opposite, alpha );
        beta_op = Opposite( opposite, beta );
        
        verbose = ValueOption( "verbose" ) == true;
        
        if (CanCompute( cat, "ExponentialOnObjects" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'ExponentialOnObjects' ..." );
                
            end;
            
            exp_ab = ExponentialOnObjects( a, b );
            exp_ba = ExponentialOnObjects( b, a );
            
            coexp_ab_op = CoexponentialOnObjects( a_op, b_op );
            coexp_ba_op = CoexponentialOnObjects( b_op, a_op );
            
            @Assert( 0, IsEqualForObjects( coexp_ab_op, Opposite( opposite, exp_ba ) ) );
            @Assert( 0, IsEqualForObjects( coexp_ba_op, Opposite( opposite, exp_ab ) ) );
            
            # Opposite must be self-inverse
            
            @Assert( 0, IsEqualForObjects( exp_ab, Opposite( coexp_ba_op ) ) );
            @Assert( 0, IsEqualForObjects( exp_ba, Opposite( coexp_ab_op ) ) );
            
            # Convenience methods in the opposite category
            
            @Assert( 0, IsEqualForObjects( coexp_ab_op, Coexponential( a_op, b_op ) ) );
            @Assert( 0, IsEqualForObjects( coexp_ba_op, Coexponential( b_op, a_op ) ) );
            
        end;
        
        if (CanCompute( cat, "ExponentialOnMorphisms" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'ExponentialOnMorphisms' ..." );
                
            end;
            
            exp_alpha_beta = ExponentialOnMorphisms( alpha, beta );
            exp_beta_alpha = ExponentialOnMorphisms( beta, alpha );
            
            coexp_alpha_beta_op = CoexponentialOnMorphisms( alpha_op, beta_op );
            coexp_beta_alpha_op = CoexponentialOnMorphisms( beta_op, alpha_op );
            
            @Assert( 0, IsCongruentForMorphisms( coexp_alpha_beta_op, Opposite( opposite, exp_beta_alpha ) ) );
            @Assert( 0, IsCongruentForMorphisms( coexp_beta_alpha_op, Opposite( opposite, exp_alpha_beta ) ) );
            
            # Opposite must be self-inverse
            
            @Assert( 0, IsCongruentForMorphisms( exp_alpha_beta, Opposite( coexp_beta_alpha_op ) ) );
            @Assert( 0, IsCongruentForMorphisms( exp_beta_alpha, Opposite( coexp_alpha_beta_op ) ) );
            
            # Convenience methods in the opposite category
            
            @Assert( 0, IsCongruentForMorphisms( coexp_alpha_beta_op, Coexponential( alpha_op, beta_op ) ) );
            @Assert( 0, IsCongruentForMorphisms( coexp_beta_alpha_op, Coexponential( beta_op, alpha_op ) ) );
            
        end;
        
        if (CanCompute( cat, "CartesianRightEvaluationMorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianRightEvaluationMorphism' ..." );
                
            end;
            
            ev_ab = CartesianRightEvaluationMorphism( a, b );
            ev_ba = CartesianRightEvaluationMorphism( b, a );
            
            coca_ev_ab_op = CocartesianRightEvaluationMorphism( a_op, b_op );
            coca_ev_ba_op = CocartesianRightEvaluationMorphism( b_op, a_op );
            
            # Arguments must be reversed for evaluations
            @Assert( 0, IsCongruentForMorphisms( coca_ev_ab_op, Opposite( opposite, ev_ab ) ) );
            @Assert( 0, IsCongruentForMorphisms( coca_ev_ba_op, Opposite( opposite, ev_ba ) ) );
            
        end;
        
        if (CanCompute( cat, "CartesianRightCoevaluationMorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianRightEvaluationMorphism' ..." );
                
            end;
            
            coev_ab = CartesianRightCoevaluationMorphism( a, b );
            coev_ba = CartesianRightCoevaluationMorphism( b, a );
            
            coca_coev_ab_op = CocartesianRightCoevaluationMorphism( a_op, b_op );
            coca_coev_ba_op = CocartesianRightCoevaluationMorphism( b_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( coca_coev_ab_op, Opposite( opposite, coev_ab ) ) );
            @Assert( 0, IsCongruentForMorphisms( coca_coev_ba_op, Opposite( opposite, coev_ba ) ) );
            
        end;
        
        if (CanCompute( cat, "CartesianLeftEvaluationMorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianLeftEvaluationMorphism' ..." );
                
            end;
            
            ev_ab = CartesianLeftEvaluationMorphism( a, b );
            ev_ba = CartesianLeftEvaluationMorphism( b, a );
            
            coca_ev_ab_op = CocartesianLeftEvaluationMorphism( a_op, b_op );
            coca_ev_ba_op = CocartesianLeftEvaluationMorphism( b_op, a_op );
            
            # Arguments must be reversed for evaluations
            @Assert( 0, IsCongruentForMorphisms( coca_ev_ab_op, Opposite( opposite, ev_ab ) ) );
            @Assert( 0, IsCongruentForMorphisms( coca_ev_ba_op, Opposite( opposite, ev_ba ) ) );
            
        end;
        
        if (CanCompute( cat, "CartesianLeftCoevaluationMorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianLeftEvaluationMorphism' ..." );
                
            end;
            
            coev_ab = CartesianLeftCoevaluationMorphism( a, b );
            coev_ba = CartesianLeftCoevaluationMorphism( b, a );
            
            coca_coev_ab_op = CocartesianLeftCoevaluationMorphism( a_op, b_op );
            coca_coev_ba_op = CocartesianLeftCoevaluationMorphism( b_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( coca_coev_ab_op, Opposite( opposite, coev_ab ) ) );
            @Assert( 0, IsCongruentForMorphisms( coca_coev_ba_op, Opposite( opposite, coev_ba ) ) );
            
        end;
        
        if (CanCompute( cat, "DirectProductToExponentialRightAdjunctionIsomorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'DirectProductToExponentialRightAdjunctionIsomorphism' ..." );
                
            end;
            
            raiso = DirectProductToExponentialRightAdjunctionIsomorphism( a, b, c );
            
            @Assert( 0, IsIsomorphism( raiso ) );
            
            if (CanCompute( cat, "DirectProductToExponentialLeftAdjunctionIsomorphism" ))
                
                laiso = DirectProductToExponentialLeftAdjunctionIsomorphism( b, a, c );
                
                @Assert( 0, IsIsomorphism( laiso ) );
                
                if (CanCompute( cat, "CartesianBraiding" ))
                    
                    H_ab_ba_c = HomStructure( CartesianBraiding( a, b ), c );
                    
                    @Assert( 0, IsIsomorphism( H_ab_ba_c ) );
                    
                    @Assert( 0, IsEqualForMorphisms( laiso, PreCompose( H_ab_ba_c, raiso ) ) );
                    
                end;
                
            end;
            
        end;
        
        if (CanCompute( cat, "ExponentialToDirectProductRightAdjunctionIsomorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'ExponentialToDirectProductRightAdjunctionIsomorphism' ..." );
                
            end;
            
            raiso = ExponentialToDirectProductRightAdjunctionIsomorphism( a, b, c );
            
            @Assert( 0, IsIsomorphism( raiso ) );
            
            if (CanCompute( cat, "ExponentialToDirectProductLeftAdjunctionIsomorphism" ))
                
                laiso = ExponentialToDirectProductLeftAdjunctionIsomorphism( b, a, c );
                
                @Assert( 0, IsIsomorphism( laiso ) );
                
                if (CanCompute( cat, "CartesianBraiding" ))
                    
                    H_ab_ba_c = HomStructure( CartesianBraiding( a, b ), c );
                    
                    @Assert( 0, IsIsomorphism( H_ab_ba_c ) );
                    
                    @Assert( 0, IsEqualForMorphisms( raiso, PreCompose( H_ab_ba_c, laiso ) ) );
                    
                end;
                
            end;
            
        end;
        
        if (CanCompute( cat, "DirectProductToExponentialLeftAdjunctMorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'DirectProductToExponentialLeftAdjunctMorphism' ..." );
                
            end;
            
            ######################################
            # 
            # alpha: a → b
            # beta:  c → d
            # 
            # alpha_tensor_beta: a × c → b × d
            # beta_tensor_alpha: c × a → d × b
            #
            ######################################
            #
            # alpha_op: b → a
            # beta_op:  d → c
            #
            # alpha_tensor_beta_op: b × d → a × c
            # beta_tensor_alpha_op: d × b → c × a
            #
            ######################################
            
            alpha_tensor_beta = DirectProductOnMorphisms( alpha, beta );
            beta_tensor_alpha = DirectProductOnMorphisms( beta, alpha );
            alpha_tensor_beta_op = CoproductOnMorphisms( opposite, alpha_op, beta_op );
            beta_tensor_alpha_op = CoproductOnMorphisms( opposite, beta_op, alpha_op );
            
            # Adjoint( a × c → b × d )  ==  a → Exp( c, b × d )
            tensor_to_exp_adjunction_on_alpha_tensor_beta = DirectProductToExponentialLeftAdjunctMorphism( a, c, alpha_tensor_beta );
            
            # Adjoint( c × a → d × b )  ==  c → Exp( a, d × b )
            tensor_to_exp_adjunction_on_beta_tensor_alpha = DirectProductToExponentialLeftAdjunctMorphism( c, a, beta_tensor_alpha );
            
            # Adjoint( b × d → a × c )  ==  Coexp( b × d, c ) → a
            tensor_to_coexp_adjunction_on_alpha_tensor_beta_op = CoproductToCoexponentialLeftAdjunctMorphism( a_op, c_op, alpha_tensor_beta_op );
            
            # Adjoint( d × b → c × a )  ==  Coexp( d × b, a ) → c
            tensor_to_coexp_adjunction_on_beta_tensor_alpha_op = CoproductToCoexponentialLeftAdjunctMorphism( c_op, a_op, beta_tensor_alpha_op );
            
            # Coexp( b × d, c ) → a  ==  op( a → Exp( c, b × d ) )
            @Assert( 0, IsCongruentForMorphisms( tensor_to_coexp_adjunction_on_alpha_tensor_beta_op, Opposite( opposite, tensor_to_exp_adjunction_on_alpha_tensor_beta ) ) );
            
            # Coexp( d × b, a ) → c  ==  op( c → Exp( a, d × b ) )
            @Assert( 0, IsCongruentForMorphisms( tensor_to_coexp_adjunction_on_beta_tensor_alpha_op, Opposite( opposite, tensor_to_exp_adjunction_on_beta_tensor_alpha ) ) );
            
        end;
        
        if (CanCompute( cat, "ExponentialToDirectProductLeftAdjunctMorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'ExponentialToDirectProductLeftAdjunctMorphism' ..." );
                
            end;
            
            #####################################################
            #
            # exp_alpha_beta: Exp( b, c ) → Exp( a, d )
            # exp_beta_alpha: Exp( d, a ) → Exp( c, b )
            #
            #####################################################
            #
            # coexp_alpha_beta: Coexp( a, d ) → Coexp( b, c )
            # coexp_beta_alpha: Coexp( c, b ) → Coexp( d, a )
            #
            # coexp_alpha_beta_op: Coexp( b, c ) → Coexp( a, d )
            # coexp_beta_alpha_op: Coexp( d, a ) → Coexp( c, b )
            #
            #####################################################
            
            # Adjoint( Exp( b, c ) → Exp( a, d ) )  ==  Exp( b, c ) × a → d
            exp_to_tensor_adjunction_on_exp_alpha_beta = ExponentialToDirectProductLeftAdjunctMorphism( a, d, exp_alpha_beta );
            
            # Adjoint( Exp( d, a ) → Exp( c, b ) )  ==  Exp( d, a ) × c → b
            exp_to_tensor_adjunction_on_exp_beta_alpha = ExponentialToDirectProductLeftAdjunctMorphism( c, b, exp_beta_alpha );
            
            # Adjoint( Coexp( b, c ) → Coexp( a, d ) )  ==  b → Coexp( a, d ) × c
            coexp_to_tensor_adjunction_on_coexp_alpha_beta_op = CoexponentialToCoproductLeftAdjunctMorphism( b_op, c_op, coexp_alpha_beta_op );
            
            # Adjoint( Coexp( d, a ) → Coexp( c, b ) )  ==  d → Coexp( c, b ) × a
            coexp_to_tensor_adjunction_on_coexp_beta_alpha_op = CoexponentialToCoproductLeftAdjunctMorphism( d_op, a_op, coexp_beta_alpha_op );
            
            # b → Coexp( a, d ) × c  ==  op( Exp( d, a ) × c → b )
            @Assert( 0, IsCongruentForMorphisms( coexp_to_tensor_adjunction_on_coexp_alpha_beta_op, Opposite( opposite, exp_to_tensor_adjunction_on_exp_beta_alpha ) ) );
            
            # d → Coexp( c, b ) × a  ==  op( Exp( b, c ) × a → d )
            @Assert( 0, IsCongruentForMorphisms( coexp_to_tensor_adjunction_on_coexp_beta_alpha_op, Opposite( opposite, exp_to_tensor_adjunction_on_exp_alpha_beta ) ) );
            
        end;
        
        if (CanCompute( cat, "CartesianPreComposeMorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianPreComposeMorphism' ..." );
                
            end;
            
            precompose_abc = CartesianPreComposeMorphism( a, b, c );
            precompose_cba = CartesianPreComposeMorphism( c, b, a );

            precocompose_abc_op = CocartesianPreCoComposeMorphism( a_op, b_op, c_op );
            precocompose_cba_op = CocartesianPreCoComposeMorphism( c_op, b_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( precocompose_abc_op, Opposite( opposite, precompose_cba ) ) );
            @Assert( 0, IsCongruentForMorphisms( precocompose_cba_op, Opposite( opposite, precompose_abc ) ) );

        end;
            
        if (CanCompute( cat, "CartesianPostComposeMorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianPostComposeMorphism' ..." );
                
            end;
            
            postcompose_abc = CartesianPostComposeMorphism( a, b, c );
            postcompose_cba = CartesianPostComposeMorphism( c, b, a );
            
            postcocompose_abc_op = CocartesianPostCoComposeMorphism( a_op, b_op, c_op );
            postcocompose_cba_op = CocartesianPostCoComposeMorphism( c_op, b_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( postcocompose_abc_op, Opposite( opposite, postcompose_cba ) ) );
            @Assert( 0, IsCongruentForMorphisms( postcocompose_cba_op, Opposite( opposite, postcompose_abc ) ) );
            
        end;
        
        if (CanCompute( cat, "CartesianDualOnObjects" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianDualOnObjects' ..." );
                
            end;
            
            a_dual = CartesianDualOnObjects( a );
            b_dual = CartesianDualOnObjects( b );
            
            a_codual_op = CocartesianDualOnObjects( a_op );
            b_codual_op = CocartesianDualOnObjects( b_op );
            
            @Assert( 0, IsEqualForObjects( a_codual_op, Opposite( opposite, a_dual ) ) );
            @Assert( 0, IsEqualForObjects( b_codual_op, Opposite( opposite, b_dual ) ) );
            
        end;
        
        if (CanCompute( cat, "CartesianDualOnMorphisms" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianDualOnMorphisms' ..." );
                
            end;
            
            dual_alpha = CartesianDualOnMorphisms( alpha );
            dual_beta = CartesianDualOnMorphisms( beta );
            
            codual_alpha_op = CocartesianDualOnMorphisms( alpha_op );
            codual_beta_op = CocartesianDualOnMorphisms( beta_op );
            
            @Assert( 0, IsCongruentForMorphisms( codual_alpha_op, Opposite( opposite, dual_alpha ) ) );
            @Assert( 0, IsCongruentForMorphisms( codual_beta_op, Opposite( opposite, dual_beta ) ) );
            
        end;
        
        if (CanCompute( cat, "CartesianEvaluationForCartesianDual" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianEvaluationForCartesianDual' ..." );
                
            end;
            
            ev_for_dual_a = CartesianEvaluationForCartesianDual( a );
            ev_for_dual_b = CartesianEvaluationForCartesianDual( b );
            
            coca_ev_for_codual_a_op = CocartesianEvaluationForCocartesianDual( a_op );
            coca_ev_for_codual_b_op = CocartesianEvaluationForCocartesianDual( b_op );
            
            @Assert( 0, IsCongruentForMorphisms( coca_ev_for_codual_a_op, Opposite( opposite, ev_for_dual_a ) ) );
            @Assert( 0, IsCongruentForMorphisms( coca_ev_for_codual_b_op, Opposite( opposite, ev_for_dual_b ) ) );
            
        end;
        
        if (CanCompute( cat, "MorphismToCartesianBidual" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'MorphismToCartesianBidual' ..." );
                
            end;
            
            morphism_to_bidual_a = MorphismToCartesianBidual( a );
            morphism_to_bidual_b = MorphismToCartesianBidual( b );
            
            morphism_from_cobidual_a_op = MorphismFromCocartesianBidual( a_op );
            morphism_from_cobidual_b_op = MorphismFromCocartesianBidual( b_op );
            
            @Assert( 0, IsCongruentForMorphisms( morphism_from_cobidual_a_op, Opposite( opposite, morphism_to_bidual_a ) ) );
            @Assert( 0, IsCongruentForMorphisms( morphism_from_cobidual_b_op, Opposite( opposite, morphism_to_bidual_b ) ) );
            
        end;
        
        if (CanCompute( cat, "DirectProductExponentialCompatibilityMorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'DirectProductExponentialCompatibilityMorphism' ..." );
                
            end;
            
            # Exp( a, b ) × Exp( c, d ) → Exp( a × c, b × d )
            tensor_to_exp_compatibility_abcd = DirectProductExponentialCompatibilityMorphism( [ a, b, c, d ] );
            
            # Exp( c, a ) × Exp( d, b ) → Exp( c × d, a × b )
            tensor_to_exp_compatibility_cadb = DirectProductExponentialCompatibilityMorphism( [ c, a, d, b ] );
            
            # Coexp( a × b, c × d ) → Coexp( a, c ) × Coexp( b, d )
            coexp_to_tensor_compatibility_abcd_op = CoexponentialCoproductCompatibilityMorphism( [ a_op, b_op, c_op, d_op ] );
            
            # Coexp( b × d, a × c ) → Coexp( b, a ) × Coexp( d, c )
            coexp_to_tensor_compatibility_bdac_op = CoexponentialCoproductCompatibilityMorphism( [ b_op, d_op, a_op, c_op ] );
            
            # Coexp( a × b, c × d ) → Coexp( a, c ) × Coexp( b, d )  ==  op( Exp( c, a ) × Exp( d, b ) → Exp( c × d, a × b ) )
            @Assert( 0, IsCongruentForMorphisms( coexp_to_tensor_compatibility_abcd_op, Opposite( opposite, tensor_to_exp_compatibility_cadb ) ) );
            
            # Coexp( b × d, a × c ) → Coexp( b, a ) × Coexp( d, c )  ==  op( Exp( a, b ) × Exp( c, d ) → Exp( a × c, b × d ) )
            @Assert( 0, IsCongruentForMorphisms( coexp_to_tensor_compatibility_bdac_op, Opposite( opposite, tensor_to_exp_compatibility_abcd ) ) );
            
        end;
        
        if (CanCompute( cat, "DirectProductCartesianDualityCompatibilityMorphism" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'DirectProductCartesianDualityCompatibilityMorphism' ..." );
                
            end;
            
            # a^v × b^v → (a × b)^v
            direct_product_duality_compatibility_ab = DirectProductCartesianDualityCompatibilityMorphism( a, b );
            
            # b^v × a^v → (b × a)^v
            direct_product_duality_compatibility_ba = DirectProductCartesianDualityCompatibilityMorphism( b, a );
            
            # (a × b)_v → a_v × b_v
            coduality_direct_product_compatibility_ab_op = CocartesianDualityCoproductCompatibilityMorphism( a_op, b_op );
            
            # (b × a)_v → b_v × a_v
            coduality_direct_product_compatibility_ba_op = CocartesianDualityCoproductCompatibilityMorphism( b_op, a_op );
            
            # (a × b)_v → a_v × b_v  ==  op( a^v × b^v → (a × b)^v )
            @Assert( 0, IsCongruentForMorphisms( coduality_direct_product_compatibility_ab_op, Opposite( opposite, direct_product_duality_compatibility_ab ) ) );
            
            # (b × a)_v → b_v × a_v  ==  op( b^v × a^v → (b × a)^v )
            @Assert( 0, IsCongruentForMorphisms( coduality_direct_product_compatibility_ba_op, Opposite( opposite, direct_product_duality_compatibility_ba ) ) );
            
        end;
        
        if (CanCompute( cat, "MorphismFromDirectProductToExponential" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'MorphismFromDirectProductToExponential' ..." );
                
            end;
            
            morphism_from_direct_product_to_exp_ab = MorphismFromDirectProductToExponential( a, b );
            morphism_from_direct_product_to_exp_ba = MorphismFromDirectProductToExponential( b, a );

            morphism_from_coexp_to_direct_product_ab_op = MorphismFromCoexponentialToCoproduct( a_op, b_op );
            morphism_from_coexp_to_direct_product_ba_op = MorphismFromCoexponentialToCoproduct( b_op, a_op );
            
            @Assert( 0, IsCongruentForMorphisms( morphism_from_coexp_to_direct_product_ab_op, Opposite( opposite, morphism_from_direct_product_to_exp_ba ) ) );
            @Assert( 0, IsCongruentForMorphisms( morphism_from_coexp_to_direct_product_ba_op, Opposite( opposite, morphism_from_direct_product_to_exp_ab ) ) );
            
        end;
        
        if (CanCompute( cat, "IsomorphismFromCartesianDualObjectToExponentialIntoTerminalObject" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'IsomorphismFromCartesianDualObjectToExponentialIntoTerminalObject' ..." );
                
            end;
            
            isomorphism_from_dual_to_exp_a = IsomorphismFromCartesianDualObjectToExponentialIntoTerminalObject( a );
            isomorphism_from_dual_to_exp_b = IsomorphismFromCartesianDualObjectToExponentialIntoTerminalObject( b );
            
            isomorphism_from_coexp_to_codual_a_op = IsomorphismFromCoexponentialFromInitialObjectToCocartesianDualObject( a_op );
            isomorphism_from_coexp_to_codual_b_op = IsomorphismFromCoexponentialFromInitialObjectToCocartesianDualObject( b_op );
            
            @Assert( 0, IsCongruentForMorphisms( isomorphism_from_coexp_to_codual_a_op, Opposite( opposite, isomorphism_from_dual_to_exp_a ) ) );
            @Assert( 0, IsCongruentForMorphisms( isomorphism_from_coexp_to_codual_b_op, Opposite( opposite, isomorphism_from_dual_to_exp_b ) ) );
            
        end;
        
        if (CanCompute( cat, "IsomorphismFromExponentialIntoTerminalObjectToCartesianDualObject" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'IsomorphismFromExponentialIntoTerminalObjectToCartesianDualObject' ..." );
                
            end;
            
            isomorphism_from_exp_to_dual_a = IsomorphismFromExponentialIntoTerminalObjectToCartesianDualObject( a );
            isomorphism_from_exp_to_dual_b = IsomorphismFromExponentialIntoTerminalObjectToCartesianDualObject( b );
            
            isomorphism_from_codual_to_coexp_a_op = IsomorphismFromCocartesianDualObjectToCoexponentialFromInitialObject( a_op );
            isomorphism_from_codual_to_coexp_b_op = IsomorphismFromCocartesianDualObjectToCoexponentialFromInitialObject( b_op );
            
            @Assert( 0, IsCongruentForMorphisms( isomorphism_from_codual_to_coexp_a_op, Opposite( opposite, isomorphism_from_exp_to_dual_a ) ) );
            @Assert( 0, IsCongruentForMorphisms( isomorphism_from_codual_to_coexp_b_op, Opposite( opposite, isomorphism_from_exp_to_dual_b ) ) );
            
        end;
        
        if (CanCompute( cat, "UniversalPropertyOfCartesianDual" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'UniversalPropertyOfCartesianDual' ..." );
                
            end;
            
            gamma_op = Opposite( opposite, gamma );
            delta_op = Opposite( opposite, delta );
            
            universal_property_of_dual_gamma = UniversalPropertyOfCartesianDual( a, b, gamma );
            universal_property_of_dual_delta = UniversalPropertyOfCartesianDual( c, d, delta );

            universal_property_of_codual_gamma_op = UniversalPropertyOfCocartesianDual( a_op, b_op, gamma_op );
            universal_property_of_codual_delta_op = UniversalPropertyOfCocartesianDual( c_op, d_op, delta_op );
            
            @Assert( 0, IsCongruentForMorphisms( universal_property_of_codual_gamma_op, Opposite( opposite, universal_property_of_dual_gamma ) ) );
            @Assert( 0, IsCongruentForMorphisms( universal_property_of_codual_delta_op, Opposite( opposite, universal_property_of_dual_delta ) ) );
            
        end;
        
        if (CanCompute( cat, "CartesianLambdaIntroduction" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianLambdaIntroduction' ..." );
                
            end;
            
            lambda_intro_alpha = CartesianLambdaIntroduction( alpha );
            lambda_intro_beta = CartesianLambdaIntroduction( beta );
            
            colambda_intro_alpha_op = CocartesianLambdaIntroduction( alpha_op );
            colambda_intro_beta_op = CocartesianLambdaIntroduction( beta_op );
            
            @Assert( 0, IsCongruentForMorphisms( colambda_intro_alpha_op, Opposite( opposite, lambda_intro_alpha ) ) );
            @Assert( 0, IsCongruentForMorphisms( colambda_intro_beta_op, Opposite( opposite, lambda_intro_beta ) ) );
            
        end;
        
        if (CanCompute( cat, "CartesianLambdaElimination" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'CartesianLambdaElimination' ..." );
                
            end;
            
            epsilon_op = Opposite( opposite, epsilon );
            zeta_op = Opposite( opposite, zeta );
            
            lambda_elim_epsilon = CartesianLambdaElimination( a, b, epsilon );
            lambda_elim_zeta = CartesianLambdaElimination( c, d, zeta );

            colambda_elim_epsilon_op = CocartesianLambdaElimination( b_op, a_op, epsilon_op );
            colambda_elim_zeta_op = CocartesianLambdaElimination( d_op, c_op, zeta_op );
            
            @Assert( 0, IsCongruentForMorphisms( colambda_elim_epsilon_op, Opposite( opposite, lambda_elim_epsilon ) ) );
            @Assert( 0, IsCongruentForMorphisms( colambda_elim_zeta_op, Opposite( opposite, lambda_elim_zeta ) ) );
            
        end;
        
        if (CanCompute( cat, "IsomorphismFromObjectToExponential" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'IsomorphismFromObjectToExponential' ..." );
                
            end;
            
            isomorphism_from_a_to_hom = IsomorphismFromObjectToExponential( a );
            isomorphism_from_b_to_hom = IsomorphismFromObjectToExponential( b );
            
            isomorphism_from_coexp_to_a_op = IsomorphismFromCoexponentialToObject( a_op );
            isomorphism_from_coexp_to_b_op = IsomorphismFromCoexponentialToObject( b_op );
            
            @Assert( 0, IsCongruentForMorphisms( isomorphism_from_coexp_to_a_op, Opposite( opposite, isomorphism_from_a_to_hom ) ) );
            @Assert( 0, IsCongruentForMorphisms( isomorphism_from_coexp_to_b_op, Opposite( opposite, isomorphism_from_b_to_hom ) ) );
            
        end;
        
        if (CanCompute( cat, "IsomorphismFromExponentialToObject" ))
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Testing 'IsomorphismFromExponentialToObject' ..." );
                
            end;
            
            isomorphism_from_exp_to_a = IsomorphismFromExponentialToObject( a );
            isomorphism_from_exp_to_b = IsomorphismFromExponentialToObject( b );
            
            isomorphism_from_a_to_coexp_op = IsomorphismFromObjectToCoexponential( a_op );
            isomorphism_from_b_to_coexp_op = IsomorphismFromObjectToCoexponential( b_op );
            
            @Assert( 0, IsCongruentForMorphisms( isomorphism_from_a_to_coexp_op, Opposite( opposite, isomorphism_from_exp_to_a ) ) );
            @Assert( 0, IsCongruentForMorphisms( isomorphism_from_b_to_coexp_op, Opposite( opposite, isomorphism_from_exp_to_b ) ) );
            
        end;
        
        if (CanCompute( cat, "ExponentialOnObjects" ) &&
           CanCompute( cat, "CartesianLeftEvaluationMorphism" ) &&
           CanCompute( cat, "ExponentialToDirectProductLeftAdjunctMorphism" )
        
       )
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Consistency between 'EvalutionMorphism' and 'AdjunctMorphism' ..." );
                
            end;
            
            ev_ab = CartesianLeftEvaluationMorphism( a, b );
            ev_ba = CartesianLeftEvaluationMorphism( b, a );
            
            id_exp_ab = IdentityMorphism( ExponentialOnObjects( a, b ) );
            id_exp_ba = IdentityMorphism( ExponentialOnObjects( b, a ) );
            
            # Adjoint( Exp( a, b ) → Exp( a, b ) )  ==  Exp( a, b ) × a → b
            exp_to_tensor_adjunction_on_id_exp_ab = ExponentialToDirectProductLeftAdjunctMorphism( a, b, id_exp_ab );
            
            # Adjoint( Exp( b, a ) → Exp( b, a ) )  ==  Exp( b, a ) × b → a
            exp_to_tensor_adjunction_on_id_exp_ba = ExponentialToDirectProductLeftAdjunctMorphism( b, a, id_exp_ba );
            
            @Assert( 0, IsCongruentForMorphisms( ev_ab, exp_to_tensor_adjunction_on_id_exp_ab ) );
            @Assert( 0, IsCongruentForMorphisms( ev_ba, exp_to_tensor_adjunction_on_id_exp_ba ) );
            
        end;
        
        if (CanCompute( cat, "DirectProduct" ) &&
           CanCompute( cat, "CartesianLeftCoevaluationMorphism" ) &&
           CanCompute( cat, "DirectProductToExponentialLeftAdjunctMorphism" )
        
       )
            
            if (verbose)
                
                # COVERAGE_IGNORE_NEXT_LINE
                Display( "Consistency between 'CoevalutionMorphism' and 'AdjunctMorphism' ..." );
                
            end;
            
            coev_ab = CartesianLeftCoevaluationMorphism( a, b );
            coev_ba = CartesianLeftCoevaluationMorphism( b, a );
            
            id_a_tensor_b = IdentityMorphism( DirectProduct( a, b ) );
            id_b_tensor_a = IdentityMorphism( DirectProduct( b, a ) );
            
            # Adjoint( a × b → a × b )  ==  a → Exp( b, a × b )
            tensor_to_exp_adjunction_on_id_a_tensor_b = DirectProductToExponentialLeftAdjunctMorphism( a, b, id_a_tensor_b );
            
            # Adjoint( b × a → b × a )  ==  b → Exp( a, b × a )
            tensor_to_exp_adjunction_on_id_b_tensor_a = DirectProductToExponentialLeftAdjunctMorphism( b, a, id_b_tensor_a );
            
            @Assert( 0, IsCongruentForMorphisms( coev_ba, tensor_to_exp_adjunction_on_id_a_tensor_b ) );
            @Assert( 0, IsCongruentForMorphisms( coev_ab, tensor_to_exp_adjunction_on_id_b_tensor_a ) );
            
        end;

end );
