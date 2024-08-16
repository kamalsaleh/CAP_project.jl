

```jldoctest
julia> using MatricesForHomalg; using CAP; using MonoidalCategories; using FreydCategoriesForCAP


julia> true
true


julia> Q = HomalgFieldOfRationals();

julia> rows = CategoryOfRows( Q );


julia> a = CategoryOfRowsObject( 2, rows );

julia> b = CategoryOfRowsObject( 3, rows );

julia> c = CategoryOfRowsObject( 6, rows );

julia> d = CategoryOfRowsObject( 4, rows );


julia> z = ZeroObject( rows );

julia> u = TensorUnit( rows );


julia> a_tensor_b = TensorProductOnObjects( a, b );

julia> b_tensor_a = TensorProductOnObjects( b, a );

julia> c_tensor_d = TensorProductOnObjects( c, d );

julia> d_tensor_c = TensorProductOnObjects( d, c );


julia> 0_tensor_a = TensorProductOnObjects( z, a );

julia> a_tensor_0 = TensorProductOnObjects( a, z );


julia> hom_ab = InternalHomOnObjects( a, b );

julia> hom_ba = InternalHomOnObjects( b, a );

julia> hom_cd = InternalHomOnObjects( c, d );

julia> hom_dc = InternalHomOnObjects( d, c );


julia> hom_0a = InternalHomOnObjects( z, a );

julia> hom_a0 = InternalHomOnObjects( a, z );


julia> cohom_ab = InternalCoHomOnObjects( a, b );

julia> cohom_ba = InternalCoHomOnObjects( b, a );

julia> cohom_cd = InternalCoHomOnObjects( c, d );

julia> cohom_dc = InternalCoHomOnObjects( d, c );


julia> cohom_0a = InternalCoHomOnObjects( z, a );

julia> cohom_a0 = InternalCoHomOnObjects( a, z );


julia> hom_ab == cohom_ba
true

julia> hom_ba == cohom_ab
true

julia> hom_cd == cohom_dc
true

julia> hom_dc == cohom_cd
true


julia> hom_0a == cohom_a0
true

julia> hom_a0 == cohom_0a
true


julia> hom_ab == hom_cd
false

julia> hom_ab == hom_dc
false

julia> hom_ab == cohom_cd
false

julia> hom_ab == cohom_dc
false


julia> a_tensor_b == TensorProduct( a, b )
true

julia> b_tensor_a == TensorProduct( b, a )
true

julia> c_tensor_d == TensorProduct( c, d )
true

julia> d_tensor_c == TensorProduct( d, c )
true


julia> a == TensorProductOp( [ a ], a ); # Special case in TensorProductOp
true

julia> b == TensorProductOp( [ b ], b ); # Special case in TensorProductOp
true


julia> hom_ab == InternalCoHom( b, a )
true

julia> hom_ba == InternalCoHom( a, b )
true

julia> hom_cd == InternalCoHom( d, c )
true

julia> hom_dc == InternalCoHom( c, d)
true


julia> hom_0a == InternalCoHom( a, z )
true

julia> hom_a0 == InternalCoHom( z, a )
true


julia> cohom_ab == InternalHom( b, a )
true

julia> cohom_ba == InternalHom( a, b )
true

julia> cohom_cd == InternalHom( d, c )
true

julia> cohom_dc == InternalHom( c, d)
true


julia> cohom_0a == InternalHom( a, z )
true

julia> cohom_a0 == InternalHom( z, a )
true


julia> id_a = IdentityMorphism( a );

julia> id_b = IdentityMorphism( b );


julia> alpha = CategoryOfRowsMorphism( a, HomalgMatrix( (2):(7), 2, 3, Q ), b );

julia> beta = CategoryOfRowsMorphism( c, HomalgMatrix( (8):(31), 6, 4, Q ), d );

julia> gamma = CategoryOfRowsMorphism( b, HomalgMatrix( (-8):(9), 3, 6, Q ), c );


julia> alpha_gamma = PreCompose( alpha, gamma );

julia> gamma_beta = PreCompose( gamma, beta );

julia> alpha_gamma_beta = PreCompose( [ alpha, gamma, beta ] );


julia> alpha_tensor_beta = TensorProductOnMorphisms( alpha, beta );

julia> beta_tensor_alpha = TensorProductOnMorphisms( beta, alpha );


julia> hom_alpha_id_a = InternalHomOnMorphisms( alpha, id_a );

julia> hom_alpha_id_b = InternalHomOnMorphisms( alpha, id_b );

julia> hom_id_a_alpha = InternalHomOnMorphisms( id_a, alpha );

julia> hom_id_b_alpha = InternalHomOnMorphisms( id_b, alpha );


julia> hom_alpha_beta = InternalHomOnMorphisms( alpha, beta );

julia> hom_beta_alpha = InternalHomOnMorphisms( beta, alpha );


julia> cohom_alpha_id_a = InternalCoHomOnMorphisms( alpha, id_a );

julia> cohom_alpha_id_b = InternalCoHomOnMorphisms( alpha, id_b );

julia> cohom_id_a_alpha = InternalCoHomOnMorphisms( id_a, alpha );

julia> cohom_id_b_alpha = InternalCoHomOnMorphisms( id_b, alpha );


julia> cohom_alpha_beta = InternalCoHomOnMorphisms( alpha, beta );

julia> cohom_beta_alpha = InternalCoHomOnMorphisms( beta, alpha );


julia> alpha_transposed = CategoryOfRowsMorphism( b, TransposedMatrix( UnderlyingMatrix( alpha ) ), a );

julia> beta_transposed = CategoryOfRowsMorphism( d, TransposedMatrix( UnderlyingMatrix( beta ) ), c );


julia> alpha_tensor_beta_transposed = TensorProductOnMorphisms( alpha_transposed, beta_transposed );

julia> beta_tensor_alpha_transposed = TensorProductOnMorphisms( beta_transposed, alpha_transposed );


julia> hom_alpha_beta_transposed = InternalHomOnMorphisms( alpha_transposed, beta_transposed );

julia> hom_beta_alpha_transposed = InternalHomOnMorphisms( beta_transposed, alpha_transposed );


julia> cohom_alpha_beta_transposed = InternalCoHomOnMorphisms( alpha_transposed, beta_transposed );

julia> cohom_beta_alpha_transposed = InternalCoHomOnMorphisms( beta_transposed, alpha_transposed );


julia> hom_alpha_beta == cohom_beta_alpha
true

julia> hom_beta_alpha == cohom_alpha_beta
true


julia> hom_alpha_beta == cohom_alpha_beta
false

julia> hom_alpha_beta == hom_beta_alpha
false

julia> hom_alpha_beta == hom_beta_alpha
false


julia> cohom_alpha_beta == cohom_beta_alpha
false

julia> cohom_alpha_beta == cohom_beta_alpha
false


julia> alpha_tensor_beta == TensorProduct( alpha, beta )
true

julia> beta_tensor_alpha == TensorProduct( beta, alpha )
true


julia> alpha == TensorProductOp( [ alpha ], alpha ); # Special case in TensorProductOp
true

julia> beta == TensorProductOp( [ beta ], beta ); # Special case in TensorProductOp
true


julia> hom_alpha_beta == InternalCoHom( beta, alpha )
true

julia> hom_beta_alpha == InternalCoHom( alpha, beta )
true


julia> cohom_alpha_beta == InternalHom( beta, alpha )
true

julia> cohom_beta_alpha == InternalHom( alpha, beta )
true


julia> hom_alpha_id_a == InternalHom( alpha, a )
true

julia> hom_alpha_id_b == InternalHom( alpha, b )
true

julia> hom_id_a_alpha == InternalHom( a, alpha )
true

julia> hom_id_b_alpha == InternalHom( b, alpha )
true


julia> cohom_alpha_id_a == InternalCoHom( alpha, a )
true

julia> cohom_alpha_id_b == InternalCoHom( alpha, b )
true

julia> cohom_id_a_alpha == InternalCoHom( a, alpha )
true

julia> cohom_id_b_alpha == InternalCoHom( b, alpha )
true


julia> left_unitor_a = LeftUnitor( a );

julia> left_unitor_b = LeftUnitor( b );

julia> left_unitor_c = LeftUnitor( c );

julia> left_unitor_d = LeftUnitor( d );


julia> right_unitor_a = RightUnitor( a );

julia> right_unitor_b = RightUnitor( b );

julia> right_unitor_c = RightUnitor( c );

julia> right_unitor_d = RightUnitor( d );


julia> left_unitor_inverse_a = LeftUnitorInverse( a );

julia> left_unitor_inverse_b = LeftUnitorInverse( b );

julia> left_unitor_inverse_c = LeftUnitorInverse( c );

julia> left_unitor_inverse_d = LeftUnitorInverse( d );


julia> right_unitor_inverse_a = RightUnitorInverse( a );

julia> right_unitor_inverse_b = RightUnitorInverse( b );

julia> right_unitor_inverse_c = RightUnitorInverse( c );

julia> right_unitor_inverse_d = RightUnitorInverse( d );


julia> UnderlyingMatrix( left_unitor_a ) == TransposedMatrix( UnderlyingMatrix( left_unitor_inverse_a ) )
true

julia> UnderlyingMatrix( left_unitor_b ) == TransposedMatrix( UnderlyingMatrix( left_unitor_inverse_b ) )
true

julia> UnderlyingMatrix( left_unitor_c ) == TransposedMatrix( UnderlyingMatrix( left_unitor_inverse_c ) )
true

julia> UnderlyingMatrix( left_unitor_d ) == TransposedMatrix( UnderlyingMatrix( left_unitor_inverse_d ) )
true


julia> UnderlyingMatrix( right_unitor_a ) == TransposedMatrix( UnderlyingMatrix( right_unitor_inverse_a ) ) 
true

julia> UnderlyingMatrix( right_unitor_b ) == TransposedMatrix( UnderlyingMatrix( right_unitor_inverse_b ) ) 
true

julia> UnderlyingMatrix( right_unitor_c ) == TransposedMatrix( UnderlyingMatrix( right_unitor_inverse_c ) ) 
true

julia> UnderlyingMatrix( right_unitor_d ) == TransposedMatrix( UnderlyingMatrix( right_unitor_inverse_d ) ) 
true


julia> UnderlyingMatrix( left_unitor_b ) == TransposedMatrix( UnderlyingMatrix( left_unitor_inverse_a ) )
false

julia> UnderlyingMatrix( left_unitor_b ) == TransposedMatrix( UnderlyingMatrix( left_unitor_inverse_c ) )
false

julia> UnderlyingMatrix( left_unitor_b ) == TransposedMatrix( UnderlyingMatrix( left_unitor_inverse_d ) )
false


julia> UnderlyingMatrix( left_unitor_inverse_c ) == TransposedMatrix( UnderlyingMatrix( left_unitor_a ) )
false

julia> UnderlyingMatrix( left_unitor_inverse_c ) == TransposedMatrix( UnderlyingMatrix( left_unitor_b ) )
false

julia> UnderlyingMatrix( left_unitor_inverse_c ) == TransposedMatrix( UnderlyingMatrix( left_unitor_d ) )
false


julia> UnderlyingMatrix( right_unitor_a ) == TransposedMatrix( UnderlyingMatrix( right_unitor_inverse_b ) ) 
false

julia> UnderlyingMatrix( right_unitor_a ) == TransposedMatrix( UnderlyingMatrix( right_unitor_inverse_c ) ) 
false

julia> UnderlyingMatrix( right_unitor_a ) == TransposedMatrix( UnderlyingMatrix( right_unitor_inverse_d ) ) 
false


julia> UnderlyingMatrix( right_unitor_inverse_d ) == TransposedMatrix( UnderlyingMatrix( right_unitor_a ) ) 
false

julia> UnderlyingMatrix( right_unitor_inverse_d ) == TransposedMatrix( UnderlyingMatrix( right_unitor_b ) ) 
false

julia> UnderlyingMatrix( right_unitor_inverse_d ) == TransposedMatrix( UnderlyingMatrix( right_unitor_c ) ) 
false


julia> associator_left_to_right_abc = AssociatorLeftToRight( a, b, c );

julia> associator_left_to_right_bcd = AssociatorLeftToRight( b, c, d );

julia> associator_left_to_right_acd = AssociatorLeftToRight( a, c, d );

julia> associator_left_to_right_cba = AssociatorLeftToRight( c, b, a );

julia> associator_left_to_right_dcb = AssociatorLeftToRight( d, c, b );


julia> associator_right_to_left_abc = AssociatorRightToLeft( a, b, c );

julia> associator_right_to_left_bcd = AssociatorRightToLeft( b, c, d );

julia> associator_right_to_left_acd = AssociatorRightToLeft( a, c, d );

julia> associator_right_to_left_cba = AssociatorRightToLeft( c, b, a );

julia> associator_right_to_left_dcb = AssociatorRightToLeft( d, c, b );


julia> UnderlyingMatrix( associator_left_to_right_abc ) == TransposedMatrix( UnderlyingMatrix( associator_right_to_left_abc ) )
true

julia> UnderlyingMatrix( associator_left_to_right_bcd ) == TransposedMatrix( UnderlyingMatrix( associator_right_to_left_bcd ) )
true

julia> UnderlyingMatrix( associator_left_to_right_acd ) == TransposedMatrix( UnderlyingMatrix( associator_right_to_left_acd ) )
true

julia> UnderlyingMatrix( associator_left_to_right_cba ) == TransposedMatrix( UnderlyingMatrix( associator_right_to_left_cba ) )
true

julia> UnderlyingMatrix( associator_left_to_right_dcb ) == TransposedMatrix( UnderlyingMatrix( associator_right_to_left_dcb ) )
true


julia> UnderlyingMatrix( associator_right_to_left_abc ) == TransposedMatrix( UnderlyingMatrix( associator_left_to_right_abc ) )
true

julia> UnderlyingMatrix( associator_right_to_left_bcd ) == TransposedMatrix( UnderlyingMatrix( associator_left_to_right_bcd ) )
true

julia> UnderlyingMatrix( associator_right_to_left_acd ) == TransposedMatrix( UnderlyingMatrix( associator_left_to_right_acd ) )
true

julia> UnderlyingMatrix( associator_right_to_left_cba ) == TransposedMatrix( UnderlyingMatrix( associator_left_to_right_cba ) )
true

julia> UnderlyingMatrix( associator_right_to_left_dcb ) == TransposedMatrix( UnderlyingMatrix( associator_left_to_right_dcb ) )
true


julia> UnderlyingMatrix( associator_left_to_right_cba ) == TransposedMatrix( UnderlyingMatrix( associator_right_to_left_bcd ) )
false

julia> UnderlyingMatrix( associator_left_to_right_cba ) == TransposedMatrix( UnderlyingMatrix( associator_right_to_left_acd ) )
false

julia> UnderlyingMatrix( associator_left_to_right_cba ) == TransposedMatrix( UnderlyingMatrix( associator_right_to_left_dcb ) )
false


julia> UnderlyingMatrix( associator_right_to_left_acd ) == TransposedMatrix( UnderlyingMatrix( associator_left_to_right_abc ) )
false

julia> UnderlyingMatrix( associator_right_to_left_acd ) == TransposedMatrix( UnderlyingMatrix( associator_left_to_right_bcd ) )
false

julia> UnderlyingMatrix( associator_right_to_left_acd ) == TransposedMatrix( UnderlyingMatrix( associator_left_to_right_cba ) )
false


julia> braiding_a_b = Braiding( a, b );

julia> braiding_b_a = Braiding( b, a );

julia> braiding_c_d = Braiding( c, d );

julia> braiding_d_c = Braiding( d, c );


julia> braiding_0_a = Braiding( z, a );

julia> braiding_a_0 = Braiding( a, z );


julia> braiding_inverse_a_b = BraidingInverse( a, b );

julia> braiding_inverse_b_a = BraidingInverse( b, a );

julia> braiding_inverse_c_d = BraidingInverse( c, d );

julia> braiding_inverse_d_c = BraidingInverse( d, c );


julia> braiding_inverse_0_a = BraidingInverse( z, a );

julia> braiding_inverse_a_0 = BraidingInverse( a, z );


julia> braiding_a_b == braiding_inverse_b_a
true

julia> braiding_b_a == braiding_inverse_a_b
true

julia> braiding_c_d == braiding_inverse_d_c
true

julia> braiding_d_c == braiding_inverse_c_d
true


julia> braiding_0_a == braiding_inverse_a_0
true

julia> braiding_a_0 == braiding_inverse_0_a
true


julia> braiding_a_b == braiding_inverse_a_b
false

julia> braiding_a_b == braiding_inverse_c_d
false

julia> braiding_a_b == braiding_inverse_d_c
false


julia> braiding_c_d == braiding_inverse_a_b
false

julia> braiding_c_d == braiding_inverse_b_a
false

julia> braiding_c_d == braiding_inverse_c_d
false


julia> CheckBraiding( a, b, c )
true

julia> CheckBraiding( c, b, a )
true

julia> CheckBraiding( b, a, c )
true


julia> id_a_tensor_b = IdentityMorphism( a_tensor_b );

julia> id_b_tensor_a = IdentityMorphism( b_tensor_a );

julia> id_c_tensor_d = IdentityMorphism( c_tensor_d );

julia> id_d_tensor_c = IdentityMorphism( d_tensor_c );


julia> id_0_tensor_a = IdentityMorphism( 0_tensor_a );

julia> id_a_tensor_0 = IdentityMorphism( a_tensor_0 );


julia> id_hom_ab = IdentityMorphism( hom_ab );

julia> id_hom_ba = IdentityMorphism (hom_ba );

julia> id_hom_cd = IdentityMorphism( hom_cd );

julia> id_hom_dc = IdentityMorphism( hom_dc );


julia> id_hom_0a = IdentityMorphism( hom_0a );

julia> id_hom_a0 = IdentityMorphism( hom_a0 );


julia> id_cohom_ab = IdentityMorphism( cohom_ab );

julia> id_cohom_ba = IdentityMorphism( cohom_ba );

julia> id_cohom_cd = IdentityMorphism( cohom_cd );

julia> id_cohom_dc = IdentityMorphism( cohom_dc );


julia> id_cohom_0a = IdentityMorphism( cohom_0a );

julia> id_cohom_a0 = IdentityMorphism( cohom_a0 );


julia> id_hom_ab == id_cohom_ba
true

julia> id_hom_ba == id_cohom_ab
true

julia> id_hom_cd == id_cohom_dc
true

julia> id_hom_dc == id_cohom_cd
true


julia> id_hom_0a == id_cohom_a0
true

julia> id_hom_a0 == id_cohom_0a
true


julia> id_hom_cd == id_hom_ab
false

julia> id_hom_cd == id_hom_ba
false

julia> id_hom_cd == id_cohom_ab
false

julia> id_hom_cd == id_cohom_ba
false


julia> id_cohom_ab == id_hom_cd
false

julia> id_cohom_ab == id_hom_dc
false

julia> id_cohom_ab == id_cohom_cd
false

julia> id_cohom_ab == id_cohom_dc
false


julia> ev_ab = ClosedMonoidalLeftEvaluationMorphism( a, b );

julia> ev_ba = ClosedMonoidalLeftEvaluationMorphism( b, a );

julia> ev_cd = ClosedMonoidalLeftEvaluationMorphism( c, d );

julia> ev_dc = ClosedMonoidalLeftEvaluationMorphism( d, c );


julia> ev_0a = ClosedMonoidalLeftEvaluationMorphism( z, a );

julia> ev_a0 = ClosedMonoidalLeftEvaluationMorphism( a, z );


julia> coev_ab = ClosedMonoidalLeftCoevaluationMorphism( a, b );

julia> coev_ba = ClosedMonoidalLeftCoevaluationMorphism( b, a );

julia> coev_cd = ClosedMonoidalLeftCoevaluationMorphism( c, d );

julia> coev_dc = ClosedMonoidalLeftCoevaluationMorphism( d, c );


julia> coev_0a = ClosedMonoidalLeftCoevaluationMorphism( z, a );

julia> coev_a0 = ClosedMonoidalLeftCoevaluationMorphism( a, z );


julia> cocl_ev_ab = CoclosedMonoidalLeftEvaluationMorphism( a, b );

julia> cocl_ev_ba = CoclosedMonoidalLeftEvaluationMorphism( b, a );

julia> cocl_ev_cd = CoclosedMonoidalLeftEvaluationMorphism( c, d );

julia> cocl_ev_dc = CoclosedMonoidalLeftEvaluationMorphism( d, c );


julia> cocl_ev_0a = CoclosedMonoidalLeftEvaluationMorphism( z, a );

julia> cocl_ev_a0 = CoclosedMonoidalLeftEvaluationMorphism( a, z );


julia> cocl_coev_ab = CoclosedMonoidalLeftCoevaluationMorphism( a, b );

julia> cocl_coev_ba = CoclosedMonoidalLeftCoevaluationMorphism( b, a );

julia> cocl_coev_cd = CoclosedMonoidalLeftCoevaluationMorphism( c, d );

julia> cocl_coev_dc = CoclosedMonoidalLeftCoevaluationMorphism( d, c );


julia> cocl_coev_0a = CoclosedMonoidalLeftCoevaluationMorphism( z, a );

julia> cocl_coev_a0 = CoclosedMonoidalLeftCoevaluationMorphism( a, z );


julia> UnderlyingMatrix( ev_ab ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_ab ) )
true

julia> UnderlyingMatrix( ev_ba ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_ba ) )
true

julia> UnderlyingMatrix( ev_cd ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_cd ) )
true

julia> UnderlyingMatrix( ev_dc ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_dc ) )
true


julia> UnderlyingMatrix( ev_0a ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_0a ) )
true

julia> UnderlyingMatrix( ev_a0 ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_a0 ) )
true


julia> UnderlyingMatrix( coev_ab ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_ab ) )
true

julia> UnderlyingMatrix( coev_ba ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_ba ) )
true

julia> UnderlyingMatrix( coev_cd ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_cd ) )
true

julia> UnderlyingMatrix( coev_dc ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_dc ) )
true


julia> UnderlyingMatrix( coev_0a ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_0a ) )
true

julia> UnderlyingMatrix( coev_a0 ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_a0 ) )
true


julia> ev_ba == cocl_ev_ba
false

julia> ev_ba == cocl_ev_cd
false

julia> ev_ba == cocl_ev_dc
false


julia> coev_dc == cocl_coev_cd
false

julia> coev_dc == cocl_coev_ab
false

julia> coev_dc == cocl_coev_ba
false


julia> cocl_ev_cd == ev_ab
false

julia> cocl_ev_cd == ev_ba
false

julia> cocl_ev_cd == ev_cd
false


julia> cocl_coev_ab == coev_ba
false

julia> cocl_coev_ab == coev_cd
false

julia> cocl_coev_ab == coev_dc
false


julia> tensor_to_hom_adjunction_on_id_a_tensor_b = TensorProductToInternalHomLeftAdjunctMorphism( a, b, id_a_tensor_b );

julia> tensor_to_hom_adjunction_on_id_b_tensor_a = TensorProductToInternalHomLeftAdjunctMorphism( b, a, id_b_tensor_a );

julia> tensor_to_hom_adjunction_on_id_c_tensor_d = TensorProductToInternalHomLeftAdjunctMorphism( c, d, id_c_tensor_d );

julia> tensor_to_hom_adjunction_on_id_d_tensor_c = TensorProductToInternalHomLeftAdjunctMorphism( d, c, id_d_tensor_c );


julia> tensor_to_hom_adjunction_on_id_0_tensor_a = TensorProductToInternalHomLeftAdjunctMorphism( z, a, id_0_tensor_a );

julia> tensor_to_hom_adjunction_on_id_a_tensor_0 = TensorProductToInternalHomLeftAdjunctMorphism( a, z, id_a_tensor_0 );


julia> hom_to_tensor_adjunction_on_id_hom_ab = InternalHomToTensorProductLeftAdjunctMorphism( a, b, id_hom_ab );

julia> hom_to_tensor_adjunction_on_id_hom_ba = InternalHomToTensorProductLeftAdjunctMorphism( b, a, id_hom_ba );

julia> hom_to_tensor_adjunction_on_id_hom_cd = InternalHomToTensorProductLeftAdjunctMorphism( c, d, id_hom_cd );

julia> hom_to_tensor_adjunction_on_id_hom_dc = InternalHomToTensorProductLeftAdjunctMorphism( d, c, id_hom_dc );


julia> hom_to_tensor_adjunction_on_id_hom_0a = InternalHomToTensorProductLeftAdjunctMorphism( z, a, id_hom_0a );

julia> hom_to_tensor_adjunction_on_id_hom_a0 = InternalHomToTensorProductLeftAdjunctMorphism( a, z, id_hom_a0 );


julia> tensor_to_cohom_adjunction_on_id_a_tensor_b = TensorProductToInternalCoHomLeftAdjunctMorphism( a, b, id_a_tensor_b );

julia> tensor_to_cohom_adjunction_on_id_b_tensor_a = TensorProductToInternalCoHomLeftAdjunctMorphism( b, a, id_b_tensor_a );

julia> tensor_to_cohom_adjunction_on_id_c_tensor_d = TensorProductToInternalCoHomLeftAdjunctMorphism( c, d, id_c_tensor_d );

julia> tensor_to_cohom_adjunction_on_id_d_tensor_c = TensorProductToInternalCoHomLeftAdjunctMorphism( d, c, id_d_tensor_c );


julia> tensor_to_cohom_adjunction_on_id_0_tensor_a = TensorProductToInternalCoHomLeftAdjunctMorphism( z, a, id_0_tensor_a );

julia> tensor_to_cohom_adjunction_on_id_a_tensor_0 = TensorProductToInternalCoHomLeftAdjunctMorphism( a, z, id_a_tensor_0 );


julia> cohom_to_tensor_adjunction_on_id_cohom_ab = InternalCoHomToTensorProductLeftAdjunctMorphism( a, b, id_cohom_ab );

julia> cohom_to_tensor_adjunction_on_id_cohom_ba = InternalCoHomToTensorProductLeftAdjunctMorphism( b, a, id_cohom_ba );

julia> cohom_to_tensor_adjunction_on_id_cohom_cd = InternalCoHomToTensorProductLeftAdjunctMorphism( c, d, id_cohom_cd );

julia> cohom_to_tensor_adjunction_on_id_cohom_dc = InternalCoHomToTensorProductLeftAdjunctMorphism( d, c, id_cohom_dc );


julia> cohom_to_tensor_adjunction_on_id_cohom_0a = InternalCoHomToTensorProductLeftAdjunctMorphism( z, a, id_cohom_0a );

julia> cohom_to_tensor_adjunction_on_id_cohom_a0 = InternalCoHomToTensorProductLeftAdjunctMorphism( a, z, id_cohom_a0 );



julia> UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_ab ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_ba ) ); # Hom( a, b ) x a -> b  ==  Tr( b -> Cohom( b, a ) x a )
true

julia> UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_ba ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_ab ) ); # Hom( b, a ) x b -> a  ==  Tr( a -> Cohom( a, b ) x b )
true

julia> UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_cd ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_dc ) ); # Hom( c, d ) x c -> d  ==  Tr( d -> Cohom( d, c ) x c )
true

julia> UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_dc ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_cd ) ); # Hom( d, c ) x d -> c  ==  Tr( c -> Cohom( c, d ) x d )
true


julia> UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_0a ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_a0 ) ); # Hom( 0, a ) x 0 -> a  ==  Tr( a -> Cohom( a, 0 ) x 0 )
true

julia> UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_a0 ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_0a ) ); # Hom( a, 0 ) x a -> 0  ==  Tr( 0 -> Cohom( 0, a ) x a )
true


julia> UnderlyingMatrix( ev_ab ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_ba ) )
true

julia> UnderlyingMatrix( ev_ba ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_ab ) )
true

julia> UnderlyingMatrix( ev_cd ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_dc ) )
true

julia> UnderlyingMatrix( ev_dc ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_cd ) )
true


julia> UnderlyingMatrix( ev_0a ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_a0 ) )
true

julia> UnderlyingMatrix( ev_a0 ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_0a ) )
true


julia> UnderlyingMatrix( tensor_to_hom_adjunction_on_id_a_tensor_b ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_a_tensor_b ) ); # a -> Hom( b, a x b )  ==  Tr( Cohom( a x b, b) -> a )
true

julia> UnderlyingMatrix( tensor_to_hom_adjunction_on_id_b_tensor_a ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_b_tensor_a ) ); # b -> Hom( a, b x a )  ==  Tr( Cohom( b x a, a) -> b )
true

julia> UnderlyingMatrix( tensor_to_hom_adjunction_on_id_c_tensor_d ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_c_tensor_d ) ); # c -> Hom( d, c x d )  ==  Tr( Cohom( d x c, c) -> d )
true

julia> UnderlyingMatrix( tensor_to_hom_adjunction_on_id_d_tensor_c ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_d_tensor_c ) ); # d -> Hom( c, d x c )  ==  Tr( Cohom( c x d, d) -> c )
true


julia> UnderlyingMatrix( tensor_to_hom_adjunction_on_id_0_tensor_a ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_0_tensor_a ) ); # 0 -> Hom( a, 0 x a )  ==  Tr( Cohom( 0 x a, a) -> 0 )
true

julia> UnderlyingMatrix( tensor_to_hom_adjunction_on_id_a_tensor_0 ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_a_tensor_0 ) ); # a -> Hom( 0, a x 0 )  ==  Tr( Cohom( a x 0, 0) -> a )
true


julia> UnderlyingMatrix( coev_ba ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_a_tensor_b ) )
true

julia> UnderlyingMatrix( coev_ab ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_b_tensor_a ) )
true

julia> UnderlyingMatrix( coev_dc ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_c_tensor_d ) )
true

julia> UnderlyingMatrix( coev_cd ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_d_tensor_c ) )
true


julia> UnderlyingMatrix( coev_a0 ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_0_tensor_a ) )
true

julia> UnderlyingMatrix( coev_0a ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_a_tensor_0 ) )
true


julia> UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_ab ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_ba ) ); # a -> Cohom( a, b ) x b  ==  Tr( Hom( b, a ) x b -> a )
true

julia> UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_ba ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_ab ) ); # b -> Cohom( b, a ) x a  ==  Tr( Hom( a, b ) x a -> b )
true

julia> UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_cd ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_dc ) ); # c -> Cohom( c, d ) x d  ==  Tr( Hom( d, c ) x d -> c )
true

julia> UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_dc ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_cd ) ); # d -> Cohom( d, c ) x c  ==  Tr( Hom( c, d ) x c -> d )
true


julia> UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_0a ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_a0 ) ); # 0 -> Cohom( 0, a ) x a  ==  Tr( Hom( a, 0 ) x a -> 0 )
true

julia> UnderlyingMatrix( cohom_to_tensor_adjunction_on_id_cohom_a0 ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_0a ) ); # a -> Cohom( a, 0 ) x 0  ==  Tr( Hom( 0, a ) x 0 -> a )
true


julia> UnderlyingMatrix( cocl_ev_ba ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_ba ) )
true

julia> UnderlyingMatrix( cocl_ev_ab ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_ab ) )
true

julia> UnderlyingMatrix( cocl_ev_dc ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_dc ) )
true

julia> UnderlyingMatrix( cocl_ev_cd ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_cd ) )
true


julia> UnderlyingMatrix( cocl_ev_a0 ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_a0 ) )
true

julia> UnderlyingMatrix( cocl_ev_0a ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_id_hom_0a ) )
true


julia> UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_a_tensor_b ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_a_tensor_b ) ); # Cohom( a x b, b ) -> a  ==  Tr( a -> Hom( b, a x b ) )
true

julia> UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_b_tensor_a ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_b_tensor_a ) ); # Cohom( b x a, a ) -> b  ==  Tr( b -> Hom( a, b x a ) )
true

julia> UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_c_tensor_d ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_c_tensor_d ) ); # Cohom( c x d, d ) -> c  ==  Tr( c -> Hom( d, c x d ) )
true

julia> UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_d_tensor_c ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_d_tensor_c ) ); # Cohom( d x c, c ) -> d  ==  Tr( d -> Hom( c, d x c ) )
true


julia> UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_0_tensor_a ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_0_tensor_a ) ); # Cohom( 0 x a, a ) -> 0  ==  Tr( 0 -> Hom( a, 0 x a ) )
true

julia> UnderlyingMatrix( tensor_to_cohom_adjunction_on_id_a_tensor_0 ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_a_tensor_0 ) ); # Cohom( a x 0, 0 ) -> a  ==  Tr( a -> Hom( 0, a x 0 ) )
true


julia> UnderlyingMatrix( cocl_coev_ba ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_a_tensor_b ) )
true

julia> UnderlyingMatrix( cocl_coev_ab ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_b_tensor_a ) )
true

julia> UnderlyingMatrix( cocl_coev_dc ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_c_tensor_d ) )
true

julia> UnderlyingMatrix( cocl_coev_cd ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_d_tensor_c ) )
true


julia> UnderlyingMatrix( cocl_coev_a0 ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_0_tensor_a ) )
true

julia> UnderlyingMatrix( cocl_coev_0a ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_id_a_tensor_0 ) )
true


julia> tensor_to_hom_adjunction_on_alpha_tensor_beta = TensorProductToInternalHomLeftAdjunctMorphism( a, c, alpha_tensor_beta );

julia> tensor_to_hom_adjunction_on_beta_tensor_alpha = TensorProductToInternalHomLeftAdjunctMorphism( c, a, beta_tensor_alpha );

julia> tensor_to_hom_adjunction_on_alpha_tensor_beta_transposed = TensorProductToInternalHomLeftAdjunctMorphism( a, c, alpha_tensor_beta_transposed );

julia> tensor_to_hom_adjunction_on_beta_tensor_alpha_transposed = TensorProductToInternalHomLeftAdjunctMorphism( c, a, beta_tensor_alpha_transposed );


julia> tensor_to_cohom_adjunction_on_alpha_tensor_beta = TensorProductToInternalCoHomLeftAdjunctMorphism( a, c, alpha_tensor_beta );

julia> tensor_to_cohom_adjunction_on_beta_tensor_alpha = TensorProductToInternalCoHomLeftAdjunctMorphism( c, a, beta_tensor_alpha );

julia> tensor_to_cohom_adjunction_on_alpha_tensor_beta_transposed = TensorProductToInternalCoHomLeftAdjunctMorphism( a, c, alpha_tensor_beta_transposed );

julia> tensor_to_cohom_adjunction_on_beta_tensor_alpha_transposed = TensorProductToInternalCoHomLeftAdjunctMorphism( c, a, beta_tensor_alpha_transposed );


julia> hom_to_tensor_adjunction_on_hom_alpha_beta = InternalHomToTensorProductLeftAdjunctMorphism( a, d, hom_alpha_beta );

julia> hom_to_tensor_adjunction_on_hom_beta_alpha = InternalHomToTensorProductLeftAdjunctMorphism( c, b, hom_beta_alpha );

julia> hom_to_tensor_adjunction_on_hom_alpha_beta_transposed = InternalHomToTensorProductLeftAdjunctMorphism( b, c, hom_alpha_beta_transposed );

julia> hom_to_tensor_adjunction_on_hom_beta_alpha_transposed = InternalHomToTensorProductLeftAdjunctMorphism( d, a, hom_beta_alpha_transposed );


julia> cohom_to_tensor_adjunction_on_cohom_alpha_beta = InternalCoHomToTensorProductLeftAdjunctMorphism( a, d, cohom_alpha_beta );

julia> cohom_to_tensor_adjunction_on_cohom_beta_alpha = InternalCoHomToTensorProductLeftAdjunctMorphism( c, b, cohom_beta_alpha );

julia> cohom_to_tensor_adjunction_on_cohom_alpha_beta_transposed = InternalCoHomToTensorProductLeftAdjunctMorphism( b, c, cohom_alpha_beta_transposed );

julia> cohom_to_tensor_adjunction_on_cohom_beta_alpha_transposed = InternalCoHomToTensorProductLeftAdjunctMorphism( d, a, cohom_beta_alpha_transposed );



julia> UnderlyingMatrix( tensor_to_hom_adjunction_on_alpha_tensor_beta ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_alpha_tensor_beta_transposed ) ); # a -> Hom( c, b x d )  ==  Tr( Cohom( a x c, d ) -> b )
true


julia> UnderlyingMatrix( tensor_to_hom_adjunction_on_beta_tensor_alpha ) == TransposedMatrix( UnderlyingMatrix( tensor_to_cohom_adjunction_on_beta_tensor_alpha_transposed ) ); # c -> Hom( a, d x b )  ==  Tr( Cohom( d x b, a ) -> c )
true


julia> UnderlyingMatrix( tensor_to_cohom_adjunction_on_alpha_tensor_beta ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_alpha_tensor_beta_transposed ) ); # Cohom( a x c, d ) -> b  ==  Tr( b -> Hom( d, a x c ) )
true


julia> UnderlyingMatrix( tensor_to_cohom_adjunction_on_beta_tensor_alpha ) == TransposedMatrix( UnderlyingMatrix( tensor_to_hom_adjunction_on_beta_tensor_alpha_transposed ) ); # Cohom( c x a, b ) -> d  ==  Tr( d -> Hom( b, c x a ) )
true



julia> UnderlyingMatrix( hom_to_tensor_adjunction_on_hom_alpha_beta ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_cohom_beta_alpha_transposed ) ); # Hom( b, c ) x a -> d  ==  Tr( d -> Cohom( c, b ) x a )
true


julia> UnderlyingMatrix( hom_to_tensor_adjunction_on_hom_beta_alpha ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_adjunction_on_cohom_alpha_beta_transposed ) ); # Hom( d, a ) x c -> b  ==  Tr( b -> Cohom( a, d ) x c )
true


julia> UnderlyingMatrix( cohom_to_tensor_adjunction_on_cohom_alpha_beta ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_hom_beta_alpha_transposed ) ); # a -> Cohom( b, c ) x d  ==  Tr( Hom( c, b ) x d -> a )
true


julia> UnderlyingMatrix( cohom_to_tensor_adjunction_on_cohom_beta_alpha ) == TransposedMatrix( UnderlyingMatrix( hom_to_tensor_adjunction_on_hom_alpha_beta_transposed ) ); # c -> Cohom( d, a ) x b  ==  Tr( Hom( a, d ) x b -> c )
true


julia> precompose_abc = MonoidalPreComposeMorphism( a, b, c );

julia> precompose_cba = MonoidalPreComposeMorphism( c, b, a );


julia> precocompose_abc = MonoidalPreCoComposeMorphism( a, b, c );

julia> precocompose_cba = MonoidalPreCoComposeMorphism( c, b, a );


julia> postcompose_abc = MonoidalPostComposeMorphism( a, b, c );

julia> postcompose_cba = MonoidalPostComposeMorphism( c, b, a );


julia> postcocompose_abc = MonoidalPostCoComposeMorphism( a, b, c );

julia> postcocompose_cba = MonoidalPostCoComposeMorphism( c, b, a );


julia> UnderlyingMatrix( precompose_abc ) == TransposedMatrix( UnderlyingMatrix( precocompose_cba ) )
true

julia> UnderlyingMatrix( precompose_cba ) == TransposedMatrix( UnderlyingMatrix( precocompose_abc ) )
true


julia> UnderlyingMatrix( postcocompose_abc ) == TransposedMatrix( UnderlyingMatrix( postcompose_cba ) )
true

julia> UnderlyingMatrix( postcocompose_cba ) == TransposedMatrix( UnderlyingMatrix( postcompose_abc ) )
true


julia> a_dual = DualOnObjects( a );

julia> b_dual = DualOnObjects( b );


julia> a_codual = CoDualOnObjects( a );

julia> b_codual = CoDualOnObjects( b );


julia> dual_id_a_tensor_b = DualOnMorphisms( id_a_tensor_b );

julia> dual_id_b_tensor_a = DualOnMorphisms( id_b_tensor_a );


julia> dual_hom_alpha_beta = DualOnMorphisms( hom_alpha_beta );

julia> dual_hom_beta_alpha = DualOnMorphisms( hom_beta_alpha );


julia> dual_coev_ab = DualOnMorphisms( coev_ab );

julia> dual_coev_ba = DualOnMorphisms( coev_ba );


julia> codual_id_a_tensor_b = CoDualOnMorphisms( id_a_tensor_b );

julia> codual_id_b_tensor_a = CoDualOnMorphisms( id_b_tensor_a );


julia> codual_cohom_alpha_beta = CoDualOnMorphisms( cohom_alpha_beta );

julia> codual_cohom_beta_alpha = CoDualOnMorphisms( cohom_beta_alpha );


julia> codual_cocl_coev_ab = CoDualOnMorphisms( cocl_coev_ab );

julia> codual_cocl_coev_ba = CoDualOnMorphisms( cocl_coev_ba );


julia> a_dual == a_codual
true

julia> b_dual == b_codual
true


julia> dual_id_a_tensor_b == codual_id_a_tensor_b
true

julia> dual_id_b_tensor_a == codual_id_b_tensor_a
true


julia> dual_hom_alpha_beta == codual_cohom_beta_alpha
true

julia> dual_hom_beta_alpha == codual_cohom_alpha_beta
true


julia> UnderlyingMatrix( dual_coev_ab ) == TransposedMatrix( UnderlyingMatrix( codual_cocl_coev_ab ) )
true

julia> UnderlyingMatrix( dual_coev_ba ) == TransposedMatrix( UnderlyingMatrix( codual_cocl_coev_ba ) )
true


julia> ev_for_dual_a = EvaluationForDual( a );

julia> ev_for_dual_b = EvaluationForDual( b );

julia> ev_for_dual_0 = EvaluationForDual( z );


julia> cocl_ev_for_codual_a = CoclosedEvaluationForCoDual( a );

julia> cocl_ev_for_codual_b = CoclosedEvaluationForCoDual( b );

julia> cocl_ev_for_codual_0 = CoclosedEvaluationForCoDual( z );


julia> UnderlyingMatrix( ev_for_dual_a ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_for_codual_a ) )
true

julia> UnderlyingMatrix( ev_for_dual_b ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_for_codual_b ) )
true

julia> UnderlyingMatrix( ev_for_dual_0 ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_for_codual_0 ) )
true


julia> UnderlyingMatrix( ev_for_dual_a ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_for_codual_b ) )
false

julia> UnderlyingMatrix( ev_for_dual_b ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_for_codual_a ) )
false

julia> UnderlyingMatrix( ev_for_dual_0 ) == TransposedMatrix( UnderlyingMatrix( cocl_ev_for_codual_a ) )
false


julia> UnderlyingMatrix( cocl_ev_for_codual_a ) == TransposedMatrix( UnderlyingMatrix( ev_for_dual_b ) )
false

julia> UnderlyingMatrix( cocl_ev_for_codual_b ) == TransposedMatrix( UnderlyingMatrix( ev_for_dual_a ) )
false

julia> UnderlyingMatrix( cocl_ev_for_codual_0 ) == TransposedMatrix( UnderlyingMatrix( ev_for_dual_b ) )
false


julia> ev_for_dual_a == ClosedMonoidalLeftEvaluationMorphism( a, u )
true

julia> ev_for_dual_b == ClosedMonoidalLeftEvaluationMorphism( b, u )
true

julia> ev_for_dual_0 == ClosedMonoidalLeftEvaluationMorphism( z, u )
true


julia> cocl_ev_for_codual_a == CoclosedMonoidalLeftEvaluationMorphism( a, u )
true

julia> cocl_ev_for_codual_b == CoclosedMonoidalLeftEvaluationMorphism( b, u )
true

julia> cocl_ev_for_codual_0 == CoclosedMonoidalLeftEvaluationMorphism( z, u )
true


julia> morphism_to_bidual_a = MorphismToBidual( a );

julia> morphism_to_bidual_b = MorphismToBidual( b );

julia> morphism_to_bidual_c = MorphismToBidual( c );

julia> morphism_to_bidual_d = MorphismToBidual( d );


julia> morphism_from_cobidual_a = MorphismFromCoBidual( a );

julia> morphism_from_cobidual_b = MorphismFromCoBidual( b );

julia> morphism_from_cobidual_c = MorphismFromCoBidual( c );

julia> morphism_from_cobidual_d = MorphismFromCoBidual( d );


julia> UnderlyingMatrix( morphism_to_bidual_a ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cobidual_a ) )
true

julia> UnderlyingMatrix( morphism_to_bidual_b ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cobidual_b ) )
true

julia> UnderlyingMatrix( morphism_to_bidual_c ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cobidual_c ) )
true

julia> UnderlyingMatrix( morphism_to_bidual_d ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cobidual_d ) )
true


julia> UnderlyingMatrix( morphism_to_bidual_a ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cobidual_b ) )
false

julia> UnderlyingMatrix( morphism_to_bidual_b ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cobidual_a ) )
false

julia> UnderlyingMatrix( morphism_to_bidual_c ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cobidual_d ) )
false

julia> UnderlyingMatrix( morphism_to_bidual_d ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cobidual_c ) )
false



julia> tensor_product_duality_compatibility_ab = TensorProductDualityCompatibilityMorphism( a, b );; # a^v x b^v -> (a x b)^v

julia> tensor_product_duality_compatibility_ba = TensorProductDualityCompatibilityMorphism( b, a );; # b^v x a^v -> (b x a)^v

julia> tensor_product_duality_compatibility_cd = TensorProductDualityCompatibilityMorphism( c, d );; # c^v x d^v -> (c x d)^v

julia> tensor_product_duality_compatibility_dc = TensorProductDualityCompatibilityMorphism( d, c );; # d^v x c^v -> (d x c)^v


julia> coduality_tensor_product_compatibility_ab = CoDualityTensorProductCompatibilityMorphism( a, b );; # (a x b)_v -> a_v x b_v

julia> coduality_tensor_product_compatibility_ba = CoDualityTensorProductCompatibilityMorphism( b, a );; # (b x a)_v -> b_v x a_v

julia> coduality_tensor_product_compatibility_cd = CoDualityTensorProductCompatibilityMorphism( c, d );; # (c x d)_v -> c_v x d_v

julia> coduality_tensor_product_compatibility_dc = CoDualityTensorProductCompatibilityMorphism( d, c );; # (d x c)_v -> d_v x c_v


julia> tensor_product_to_hom_compatibility_a1b1 = TensorProductInternalHomCompatibilityMorphism( [ a, u, b, u ] );; # Hom( a, 1 ) x Hom( b, 1 ) -> Hom( a x b, 1 x 1 )

julia> tensor_product_to_hom_compatibility_b1a1 = TensorProductInternalHomCompatibilityMorphism( [ b, u, a, u ] );; # Hom( b, 1 ) x Hom( a, 1 ) -> Hom( b x a, 1 x 1 )

julia> tensor_product_to_hom_compatibility_c1d1 = TensorProductInternalHomCompatibilityMorphism( [ c, u, d, u ] );; # Hom( c, 1 ) x Hom( d, 1 ) -> Hom( c x d, 1 x 1 )

julia> tensor_product_to_hom_compatibility_d1c1 = TensorProductInternalHomCompatibilityMorphism( [ d, u, c, u ] );; # Hom( d, 1 ) x Hom( c, 1 ) -> Hom( d x c, 1 x 1 )


julia> cohom_to_tensor_product_compatibility_1a1b = InternalCoHomTensorProductCompatibilityMorphism( [ u, a, u, b ] );; # Cohom( 1 x a, 1 x b ) -> Cohom( 1, a ) x Cohom( 1, b )

julia> cohom_to_tensor_product_compatibility_1b1a = InternalCoHomTensorProductCompatibilityMorphism( [ u, b, u, a ] );; # Cohom( 1 x b, 1 x a ) -> Cohom( 1, b ) x Cohom( 1, a )

julia> cohom_to_tensor_product_compatibility_1c1d = InternalCoHomTensorProductCompatibilityMorphism( [ u, c, u, d ] );; # Cohom( 1 x c, 1 x d ) -> Cohom( 1, c ) x Cohom( 1, d )

julia> cohom_to_tensor_product_compatibility_1d1c = InternalCoHomTensorProductCompatibilityMorphism( [ u, d, u, c ] );; # Cohom( 1 x d, 1 x c ) -> Cohom( 1, d ) x Cohom( 1, c )


julia> UnderlyingMatrix( tensor_product_duality_compatibility_ab ) == TransposedMatrix( UnderlyingMatrix( coduality_tensor_product_compatibility_ab ) )
true

julia> UnderlyingMatrix( tensor_product_duality_compatibility_ba ) == TransposedMatrix( UnderlyingMatrix( coduality_tensor_product_compatibility_ba ) )
true

julia> UnderlyingMatrix( tensor_product_duality_compatibility_cd ) == TransposedMatrix( UnderlyingMatrix( coduality_tensor_product_compatibility_cd ) )
true

julia> UnderlyingMatrix( tensor_product_duality_compatibility_dc ) == TransposedMatrix( UnderlyingMatrix( coduality_tensor_product_compatibility_dc ) )
true


julia> UnderlyingMatrix( tensor_product_duality_compatibility_ab ) == TransposedMatrix( UnderlyingMatrix( coduality_tensor_product_compatibility_cd ) )
false

julia> UnderlyingMatrix( tensor_product_duality_compatibility_ab ) == TransposedMatrix( UnderlyingMatrix( coduality_tensor_product_compatibility_dc ) )
false

julia> UnderlyingMatrix( tensor_product_duality_compatibility_cd ) == TransposedMatrix( UnderlyingMatrix( coduality_tensor_product_compatibility_ab ) )
false

julia> UnderlyingMatrix( tensor_product_duality_compatibility_cd ) == TransposedMatrix( UnderlyingMatrix( coduality_tensor_product_compatibility_ba ) )
false


julia> UnderlyingMatrix( coduality_tensor_product_compatibility_ba ) == TransposedMatrix( UnderlyingMatrix( tensor_product_duality_compatibility_cd ) )
false

julia> UnderlyingMatrix( coduality_tensor_product_compatibility_ba ) == TransposedMatrix( UnderlyingMatrix( tensor_product_duality_compatibility_dc ) )
false

julia> UnderlyingMatrix( coduality_tensor_product_compatibility_dc ) == TransposedMatrix( UnderlyingMatrix( tensor_product_duality_compatibility_ab ) )
false

julia> UnderlyingMatrix( coduality_tensor_product_compatibility_dc ) == TransposedMatrix( UnderlyingMatrix( tensor_product_duality_compatibility_ba ) )
false


julia> UnderlyingMatrix( tensor_product_duality_compatibility_ab ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_product_compatibility_1a1b ) )
true

julia> UnderlyingMatrix( tensor_product_duality_compatibility_ba ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_product_compatibility_1b1a ) )
true

julia> UnderlyingMatrix( tensor_product_duality_compatibility_cd ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_product_compatibility_1c1d ) )
true

julia> UnderlyingMatrix( tensor_product_duality_compatibility_dc ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_product_compatibility_1d1c ) )
true


julia> UnderlyingMatrix( coduality_tensor_product_compatibility_ab ) == TransposedMatrix( UnderlyingMatrix( tensor_product_to_hom_compatibility_a1b1 ) )
true

julia> UnderlyingMatrix( coduality_tensor_product_compatibility_ba ) == TransposedMatrix( UnderlyingMatrix( tensor_product_to_hom_compatibility_b1a1 ) )
true

julia> UnderlyingMatrix( coduality_tensor_product_compatibility_cd ) == TransposedMatrix( UnderlyingMatrix( tensor_product_to_hom_compatibility_c1d1 ) )
true

julia> UnderlyingMatrix( coduality_tensor_product_compatibility_dc ) == TransposedMatrix( UnderlyingMatrix( tensor_product_to_hom_compatibility_d1c1 ) )
true


julia> UnderlyingMatrix( tensor_product_duality_compatibility_ba ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_product_compatibility_1c1d ) )
false

julia> UnderlyingMatrix( tensor_product_duality_compatibility_ba ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_product_compatibility_1d1c ) )
false

julia> UnderlyingMatrix( tensor_product_duality_compatibility_dc ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_product_compatibility_1a1b ) )
false

julia> UnderlyingMatrix( tensor_product_duality_compatibility_dc ) == TransposedMatrix( UnderlyingMatrix( cohom_to_tensor_product_compatibility_1b1a ) )
false


julia> UnderlyingMatrix( coduality_tensor_product_compatibility_ab ) == TransposedMatrix( UnderlyingMatrix( tensor_product_to_hom_compatibility_c1d1 ) )
false

julia> UnderlyingMatrix( coduality_tensor_product_compatibility_ab ) == TransposedMatrix( UnderlyingMatrix( tensor_product_to_hom_compatibility_d1c1 ) )
false

julia> UnderlyingMatrix( coduality_tensor_product_compatibility_cd ) == TransposedMatrix( UnderlyingMatrix( tensor_product_to_hom_compatibility_a1b1 ) )
false

julia> UnderlyingMatrix( coduality_tensor_product_compatibility_cd ) == TransposedMatrix( UnderlyingMatrix( tensor_product_to_hom_compatibility_b1a1 ) )
false


julia> tensor_product_duality_compatibility_ab == tensor_product_to_hom_compatibility_a1b1
true

julia> tensor_product_duality_compatibility_ba == tensor_product_to_hom_compatibility_b1a1
true

julia> tensor_product_duality_compatibility_cd == tensor_product_to_hom_compatibility_c1d1
true

julia> tensor_product_duality_compatibility_dc == tensor_product_to_hom_compatibility_d1c1
true


julia> coduality_tensor_product_compatibility_ab == cohom_to_tensor_product_compatibility_1a1b
true

julia> coduality_tensor_product_compatibility_ba == cohom_to_tensor_product_compatibility_1b1a
true

julia> coduality_tensor_product_compatibility_cd == cohom_to_tensor_product_compatibility_1c1d
true

julia> coduality_tensor_product_compatibility_dc == cohom_to_tensor_product_compatibility_1d1c
true


julia> morphism_from_tensor_product_to_hom_ab = MorphismFromTensorProductToInternalHom( a, b );

julia> morphism_from_tensor_product_to_hom_ba = MorphismFromTensorProductToInternalHom( b, a );

julia> morphism_from_tensor_product_to_hom_cd = MorphismFromTensorProductToInternalHom( c, d );

julia> morphism_from_tensor_product_to_hom_dc = MorphismFromTensorProductToInternalHom( d, c );


julia> morphism_from_cohom_to_tensor_product_ab = MorphismFromInternalCoHomToTensorProduct( a, b );

julia> morphism_from_cohom_to_tensor_product_ba = MorphismFromInternalCoHomToTensorProduct( b, a );

julia> morphism_from_cohom_to_tensor_product_cd = MorphismFromInternalCoHomToTensorProduct( c, d );

julia> morphism_from_cohom_to_tensor_product_dc = MorphismFromInternalCoHomToTensorProduct( d, c );


julia> UnderlyingMatrix( morphism_from_tensor_product_to_hom_ab ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cohom_to_tensor_product_ba ) )
true

julia> UnderlyingMatrix( morphism_from_tensor_product_to_hom_ba ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cohom_to_tensor_product_ab ) )
true

julia> UnderlyingMatrix( morphism_from_tensor_product_to_hom_cd ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cohom_to_tensor_product_cd ) )
true

julia> UnderlyingMatrix( morphism_from_tensor_product_to_hom_dc ) == TransposedMatrix( UnderlyingMatrix( morphism_from_cohom_to_tensor_product_dc ) )
true


julia> morphism_from_tensor_product_to_hom_ba == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_hom_cd ) )
false

julia> morphism_from_tensor_product_to_hom_ba == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_hom_dc ) )
false


julia> morphism_from_tensor_product_to_hom_dc == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_hom_ab ) )
false

julia> morphism_from_tensor_product_to_hom_dc == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_hom_ba ) )
false


julia> morphism_from_cohom_to_tensor_product_ab == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_hom_cd ) )
false

julia> morphism_from_cohom_to_tensor_product_ab == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_hom_dc ) )
false


julia> morphism_from_cohom_to_tensor_product_cd == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_hom_ab ) )
false

julia> morphism_from_cohom_to_tensor_product_cd == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_hom_ba ) )
false


julia> isomorphism_from_dual_to_hom_a = IsomorphismFromDualObjectToInternalHomIntoTensorUnit( a );

julia> isomorphism_from_dual_to_hom_b = IsomorphismFromDualObjectToInternalHomIntoTensorUnit( b );

julia> isomorphism_from_dual_to_hom_c = IsomorphismFromDualObjectToInternalHomIntoTensorUnit( c );

julia> isomorphism_from_dual_to_hom_d = IsomorphismFromDualObjectToInternalHomIntoTensorUnit( d );


julia> isomorphism_from_hom_to_dual_a = IsomorphismFromInternalHomIntoTensorUnitToDualObject( a );

julia> isomorphism_from_hom_to_dual_b = IsomorphismFromInternalHomIntoTensorUnitToDualObject( b );

julia> isomorphism_from_hom_to_dual_c = IsomorphismFromInternalHomIntoTensorUnitToDualObject( c );

julia> isomorphism_from_hom_to_dual_d = IsomorphismFromInternalHomIntoTensorUnitToDualObject( d );


julia> isomorphism_from_codual_to_cohom_a = IsomorphismFromCoDualObjectToInternalCoHomFromTensorUnit( a );

julia> isomorphism_from_codual_to_cohom_b = IsomorphismFromCoDualObjectToInternalCoHomFromTensorUnit( b );

julia> isomorphism_from_codual_to_cohom_c = IsomorphismFromCoDualObjectToInternalCoHomFromTensorUnit( c );

julia> isomorphism_from_codual_to_cohom_d = IsomorphismFromCoDualObjectToInternalCoHomFromTensorUnit( d );


julia> isomorphism_from_cohom_to_codual_a = IsomorphismFromInternalCoHomFromTensorUnitToCoDualObject( a );

julia> isomorphism_from_cohom_to_codual_b = IsomorphismFromInternalCoHomFromTensorUnitToCoDualObject( b );

julia> isomorphism_from_cohom_to_codual_c = IsomorphismFromInternalCoHomFromTensorUnitToCoDualObject( c );

julia> isomorphism_from_cohom_to_codual_d = IsomorphismFromInternalCoHomFromTensorUnitToCoDualObject( d );


julia> UnderlyingMatrix( isomorphism_from_dual_to_hom_a ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_codual_a ) )
true

julia> UnderlyingMatrix( isomorphism_from_dual_to_hom_b ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_codual_b ) )
true

julia> UnderlyingMatrix( isomorphism_from_dual_to_hom_c ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_codual_c ) )
true

julia> UnderlyingMatrix( isomorphism_from_dual_to_hom_d ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_codual_d ) )
true


julia> UnderlyingMatrix( isomorphism_from_hom_to_dual_a ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_codual_to_cohom_a ) )
true

julia> UnderlyingMatrix( isomorphism_from_hom_to_dual_b ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_codual_to_cohom_b ) )
true

julia> UnderlyingMatrix( isomorphism_from_hom_to_dual_c ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_codual_to_cohom_c ) )
true

julia> UnderlyingMatrix( isomorphism_from_hom_to_dual_d ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_codual_to_cohom_d ) )
true


julia> UnderlyingMatrix( isomorphism_from_dual_to_hom_a ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_codual_b ) )
false

julia> UnderlyingMatrix( isomorphism_from_dual_to_hom_a ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_codual_c ) )
false

julia> UnderlyingMatrix( isomorphism_from_dual_to_hom_a ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_codual_d ) )
false


julia> UnderlyingMatrix( isomorphism_from_hom_to_dual_b ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_codual_to_cohom_a ) )
false

julia> UnderlyingMatrix( isomorphism_from_hom_to_dual_b ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_codual_to_cohom_c ) )
false

julia> UnderlyingMatrix( isomorphism_from_hom_to_dual_b ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_codual_to_cohom_d ) )
false


julia> UnderlyingMatrix( isomorphism_from_codual_to_cohom_c ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_hom_to_dual_a ) )
false

julia> UnderlyingMatrix( isomorphism_from_codual_to_cohom_c ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_hom_to_dual_b ) )
false

julia> UnderlyingMatrix( isomorphism_from_codual_to_cohom_c ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_hom_to_dual_d ) )
false


julia> UnderlyingMatrix( isomorphism_from_cohom_to_codual_d ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_dual_to_hom_a ) )
false

julia> UnderlyingMatrix( isomorphism_from_cohom_to_codual_d ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_dual_to_hom_b ) )
false

julia> UnderlyingMatrix( isomorphism_from_cohom_to_codual_d ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_dual_to_hom_c ) )
false


julia> ab_to_1 = CategoryOfRowsMorphism( a_tensor_b, HomalgMatrix( (2):(7), RankOfObject( a_tensor_b ), 1, Q ), u );

julia> cd_to_1 = CategoryOfRowsMorphism( c_tensor_d, HomalgMatrix( (8):(31), RankOfObject( c_tensor_d ), 1, Q ), u );


julia> 1_to_ab = CategoryOfRowsMorphism( u, HomalgMatrix( (2):(7), 1, RankOfObject( a_tensor_b ), Q ), a_tensor_b );

julia> 1_to_cd = CategoryOfRowsMorphism( u, HomalgMatrix( (8):(31), 1, RankOfObject( c_tensor_d ), Q ), c_tensor_d );


julia> universal_property_of_dual_ab_to_1 = UniversalPropertyOfDual( a, b, ab_to_1 );

julia> universal_property_of_dual_cd_to_1 = UniversalPropertyOfDual( c, d, cd_to_1 );


julia> universal_property_of_codual_1_to_ab = UniversalPropertyOfCoDual( a, b, 1_to_ab );

julia> universal_property_of_codual_1_to_cd = UniversalPropertyOfCoDual( c, d, 1_to_cd );


julia> UnderlyingMatrix( universal_property_of_dual_ab_to_1 ) == TransposedMatrix( UnderlyingMatrix( universal_property_of_codual_1_to_ab ) )
true

julia> UnderlyingMatrix( universal_property_of_dual_cd_to_1 ) == TransposedMatrix( UnderlyingMatrix( universal_property_of_codual_1_to_cd ) )
true


julia> UnderlyingMatrix( universal_property_of_codual_1_to_ab ) == TransposedMatrix( UnderlyingMatrix( universal_property_of_dual_ab_to_1 ) )
true

julia> UnderlyingMatrix( universal_property_of_codual_1_to_cd ) == TransposedMatrix( UnderlyingMatrix( universal_property_of_dual_cd_to_1 ) )
true


julia> UnderlyingMatrix( universal_property_of_dual_ab_to_1 ) == TransposedMatrix( UnderlyingMatrix( universal_property_of_codual_1_to_cd ) )
false

julia> UnderlyingMatrix( universal_property_of_dual_cd_to_1 ) == TransposedMatrix( UnderlyingMatrix( universal_property_of_codual_1_to_ab ) )
false


julia> UnderlyingMatrix( universal_property_of_codual_1_to_ab ) == TransposedMatrix( UnderlyingMatrix( universal_property_of_dual_cd_to_1 ) )
false

julia> UnderlyingMatrix( universal_property_of_codual_1_to_cd ) == TransposedMatrix( UnderlyingMatrix( universal_property_of_dual_ab_to_1 ) )
false


julia> a_to_b = (2):(7);

julia> c_to_d = (8):(31);


julia> a_to_b_morphism = CategoryOfRowsMorphism( a, HomalgMatrix( a_to_b, 2, 3, Q ), b );

julia> b_to_a_morphism = CategoryOfRowsMorphism( b, TransposedMatrix( UnderlyingMatrix( a_to_b_morphism ) ), a );

julia> c_to_d_morphism = CategoryOfRowsMorphism( c, HomalgMatrix( c_to_d, 6, 4, Q ), d );

julia> d_to_c_morphism = CategoryOfRowsMorphism( d, TransposedMatrix( UnderlyingMatrix( c_to_d_morphism ) ), c );


julia> lambda_intro_a_to_b = LambdaIntroduction( a_to_b_morphism );

julia> lambda_intro_b_to_a = LambdaIntroduction( b_to_a_morphism );

julia> lambda_intro_c_to_d = LambdaIntroduction( c_to_d_morphism );

julia> lambda_intro_d_to_c = LambdaIntroduction( d_to_c_morphism );


julia> colambda_intro_a_to_b = CoLambdaIntroduction( a_to_b_morphism );

julia> colambda_intro_b_to_a = CoLambdaIntroduction( b_to_a_morphism );

julia> colambda_intro_c_to_d = CoLambdaIntroduction( c_to_d_morphism );

julia> colambda_intro_d_to_c = CoLambdaIntroduction( d_to_c_morphism );


julia> lambda_elim_1_to_hom_ab = LambdaElimination( a, b, lambda_intro_a_to_b );

julia> lambda_elim_1_to_hom_ba = LambdaElimination( b, a, lambda_intro_b_to_a );

julia> lambda_elim_1_to_hom_cd = LambdaElimination( c, d, lambda_intro_c_to_d );

julia> lambda_elim_1_to_hom_dc = LambdaElimination( d, c, lambda_intro_d_to_c );


julia> colambda_elim_cohom_ab_to_1 = CoLambdaElimination( a, b, colambda_intro_a_to_b );

julia> colambda_elim_cohom_ba_to_1 = CoLambdaElimination( b, a, colambda_intro_b_to_a );

julia> colambda_elim_cohom_cd_to_1 = CoLambdaElimination( c, d, colambda_intro_c_to_d );

julia> colambda_elim_cohom_dc_to_1 = CoLambdaElimination( d, c, colambda_intro_d_to_c );


julia> UnderlyingMatrix( lambda_intro_a_to_b ) == TransposedMatrix( UnderlyingMatrix( colambda_intro_b_to_a ) )
true

julia> UnderlyingMatrix( lambda_intro_b_to_a ) == TransposedMatrix( UnderlyingMatrix( colambda_intro_a_to_b ) )
true

julia> UnderlyingMatrix( lambda_intro_c_to_d ) == TransposedMatrix( UnderlyingMatrix( colambda_intro_d_to_c ) )
true

julia> UnderlyingMatrix( lambda_intro_d_to_c ) == TransposedMatrix( UnderlyingMatrix( colambda_intro_c_to_d ) )
true


julia> UnderlyingMatrix( lambda_elim_1_to_hom_ab ) == TransposedMatrix( UnderlyingMatrix( colambda_elim_cohom_ba_to_1 ) )
true

julia> UnderlyingMatrix( lambda_elim_1_to_hom_ba ) == TransposedMatrix( UnderlyingMatrix( colambda_elim_cohom_ab_to_1 ) )
true

julia> UnderlyingMatrix( lambda_elim_1_to_hom_cd ) == TransposedMatrix( UnderlyingMatrix( colambda_elim_cohom_dc_to_1 ) )
true

julia> UnderlyingMatrix( lambda_elim_1_to_hom_dc ) == TransposedMatrix( UnderlyingMatrix( colambda_elim_cohom_cd_to_1 ) )
true


julia> UnderlyingMatrix( lambda_intro_a_to_b ) == TransposedMatrix( UnderlyingMatrix( colambda_intro_a_to_b ) )
false

julia> UnderlyingMatrix( lambda_intro_a_to_b ) == TransposedMatrix( UnderlyingMatrix( colambda_intro_c_to_d ) )
false

julia> UnderlyingMatrix( lambda_intro_a_to_b ) == TransposedMatrix( UnderlyingMatrix( colambda_intro_d_to_c ) )
false


julia> UnderlyingMatrix( lambda_elim_1_to_hom_ba ) == TransposedMatrix( UnderlyingMatrix( colambda_elim_cohom_ba_to_1 ) )
false

julia> UnderlyingMatrix( lambda_elim_1_to_hom_ba ) == TransposedMatrix( UnderlyingMatrix( colambda_elim_cohom_cd_to_1 ) )
false

julia> UnderlyingMatrix( lambda_elim_1_to_hom_ba ) == TransposedMatrix( UnderlyingMatrix( colambda_elim_cohom_dc_to_1 ) )
false


julia> UnderlyingMatrix( colambda_intro_c_to_d ) == TransposedMatrix( UnderlyingMatrix( lambda_intro_c_to_d ) )
false

julia> UnderlyingMatrix( colambda_intro_c_to_d ) == TransposedMatrix( UnderlyingMatrix( lambda_intro_a_to_b ) )
false

julia> UnderlyingMatrix( colambda_intro_c_to_d ) == TransposedMatrix( UnderlyingMatrix( lambda_intro_b_to_a ) )
false


julia> UnderlyingMatrix( colambda_elim_cohom_dc_to_1 ) == TransposedMatrix( UnderlyingMatrix( lambda_elim_1_to_hom_dc ) )
false

julia> UnderlyingMatrix( colambda_elim_cohom_dc_to_1 ) == TransposedMatrix( UnderlyingMatrix( lambda_elim_1_to_hom_ab ) )
false

julia> UnderlyingMatrix( colambda_elim_cohom_dc_to_1 ) == TransposedMatrix( UnderlyingMatrix( lambda_elim_1_to_hom_ba ) )
false


julia> isomorphism_from_a_to_hom = IsomorphismFromObjectToInternalCoHom( a );

julia> isomorphism_from_b_to_hom = IsomorphismFromObjectToInternalCoHom( b );

julia> isomorphism_from_c_to_hom = IsomorphismFromObjectToInternalCoHom( c );

julia> isomorphism_from_d_to_hom = IsomorphismFromObjectToInternalCoHom( d );

julia> isomorphism_from_0_to_hom = IsomorphismFromObjectToInternalCoHom( z );


julia> isomorphism_from_hom_to_a = IsomorphismFromInternalHomToObject( a );

julia> isomorphism_from_hom_to_b = IsomorphismFromInternalHomToObject( b );

julia> isomorphism_from_hom_to_c = IsomorphismFromInternalHomToObject( c );

julia> isomorphism_from_hom_to_d = IsomorphismFromInternalHomToObject( d );

julia> isomorphism_from_hom_to_0 = IsomorphismFromInternalHomToObject( z );


julia> isomorphism_from_a_to_cohom = IsomorphismFromObjectToInternalCoHom( a );

julia> isomorphism_from_b_to_cohom = IsomorphismFromObjectToInternalCoHom( b );

julia> isomorphism_from_c_to_cohom = IsomorphismFromObjectToInternalCoHom( c );

julia> isomorphism_from_d_to_cohom = IsomorphismFromObjectToInternalCoHom( d );

julia> isomorphism_from_0_to_cohom = IsomorphismFromObjectToInternalCoHom( z );


julia> isomorphism_from_cohom_to_a = IsomorphismFromInternalCoHomToObject( a );

julia> isomorphism_from_cohom_to_b = IsomorphismFromInternalCoHomToObject( b );

julia> isomorphism_from_cohom_to_c = IsomorphismFromInternalCoHomToObject( c );

julia> isomorphism_from_cohom_to_d = IsomorphismFromInternalCoHomToObject( d );

julia> isomorphism_from_cohom_to_0 = IsomorphismFromInternalCoHomToObject( z );


julia> UnderlyingMatrix( isomorphism_from_a_to_hom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_a ) )
true

julia> UnderlyingMatrix( isomorphism_from_b_to_hom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_b ) )
true

julia> UnderlyingMatrix( isomorphism_from_c_to_hom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_c ) )
true

julia> UnderlyingMatrix( isomorphism_from_d_to_hom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_d ) )
true

julia> UnderlyingMatrix( isomorphism_from_0_to_hom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_0 ) )
true


julia> UnderlyingMatrix( isomorphism_from_hom_to_a ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_a_to_cohom ) )
true

julia> UnderlyingMatrix( isomorphism_from_hom_to_b ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_b_to_cohom ) )
true

julia> UnderlyingMatrix( isomorphism_from_hom_to_c ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_c_to_cohom ) )
true

julia> UnderlyingMatrix( isomorphism_from_hom_to_d ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_d_to_cohom ) )
true

julia> UnderlyingMatrix( isomorphism_from_hom_to_0 ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_0_to_cohom ) )
true


julia> UnderlyingMatrix( isomorphism_from_a_to_hom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_b ) )
false

julia> UnderlyingMatrix( isomorphism_from_a_to_hom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_c ) )
false

julia> UnderlyingMatrix( isomorphism_from_a_to_hom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_d ) )
false

julia> UnderlyingMatrix( isomorphism_from_a_to_hom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_0 ) )
false


julia> UnderlyingMatrix( isomorphism_from_hom_to_b ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_a_to_cohom ) )
false

julia> UnderlyingMatrix( isomorphism_from_hom_to_b ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_c_to_cohom ) )
false

julia> UnderlyingMatrix( isomorphism_from_hom_to_b ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_d_to_cohom ) )
false

julia> UnderlyingMatrix( isomorphism_from_hom_to_b ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_0_to_cohom ) )
false


julia> UnderlyingMatrix( isomorphism_from_c_to_cohom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_hom_to_a ) )
false

julia> UnderlyingMatrix( isomorphism_from_c_to_cohom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_hom_to_b ) )
false

julia> UnderlyingMatrix( isomorphism_from_c_to_cohom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_hom_to_d ) )
false

julia> UnderlyingMatrix( isomorphism_from_c_to_cohom ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_hom_to_0 ) )
false


julia> UnderlyingMatrix( isomorphism_from_cohom_to_d ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_a_to_hom ) )
false

julia> UnderlyingMatrix( isomorphism_from_cohom_to_d ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_b_to_hom ) )
false

julia> UnderlyingMatrix( isomorphism_from_cohom_to_d ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_c_to_hom ) )
false

julia> UnderlyingMatrix( isomorphism_from_cohom_to_d ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_0_to_hom ) )
false



julia> isomorphism_from_tensor_to_hom_ab = IsomorphismFromTensorProductWithDualObjectToInternalHom( a, b );

julia> isomorphism_from_tensor_to_hom_ba = IsomorphismFromTensorProductWithDualObjectToInternalHom( b, a );

julia> isomorphism_from_tensor_to_hom_cd = IsomorphismFromTensorProductWithDualObjectToInternalHom( c, d );

julia> isomorphism_from_tensor_to_hom_dc = IsomorphismFromTensorProductWithDualObjectToInternalHom( d, c );


julia> isomorphism_from_tensor_to_cohom_ab = IsomorphismFromTensorProductWithCoDualObjectToInternalCoHom( a, b );

julia> isomorphism_from_tensor_to_cohom_ba = IsomorphismFromTensorProductWithCoDualObjectToInternalCoHom( b, a );

julia> isomorphism_from_tensor_to_cohom_cd = IsomorphismFromTensorProductWithCoDualObjectToInternalCoHom( c, d );

julia> isomorphism_from_tensor_to_cohom_dc = IsomorphismFromTensorProductWithCoDualObjectToInternalCoHom( d, c );


julia> isomorphism_from_hom_to_tensor_ab = IsomorphismFromInternalHomToTensorProductWithDualObject( a, b );

julia> isomorphism_from_hom_to_tensor_ba = IsomorphismFromInternalHomToTensorProductWithDualObject( b, a );

julia> isomorphism_from_hom_to_tensor_cd = IsomorphismFromInternalHomToTensorProductWithDualObject( c, d );

julia> isomorphism_from_hom_to_tensor_dc = IsomorphismFromInternalHomToTensorProductWithDualObject( d, c );


julia> isomorphism_from_cohom_to_tensor_ab = IsomorphismFromInternalCoHomToTensorProductWithCoDualObject( a, b );

julia> isomorphism_from_cohom_to_tensor_ba = IsomorphismFromInternalCoHomToTensorProductWithCoDualObject( b, a );

julia> isomorphism_from_cohom_to_tensor_cd = IsomorphismFromInternalCoHomToTensorProductWithCoDualObject( c, d );

julia> isomorphism_from_cohom_to_tensor_dc = IsomorphismFromInternalCoHomToTensorProductWithCoDualObject( d, c );


julia> UnderlyingMatrix( isomorphism_from_tensor_to_hom_ab ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_tensor_ba ) )
true

julia> UnderlyingMatrix( isomorphism_from_tensor_to_hom_ba ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_tensor_ab ) )
true

julia> UnderlyingMatrix( isomorphism_from_tensor_to_hom_cd ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_tensor_dc ) )
true

julia> UnderlyingMatrix( isomorphism_from_tensor_to_hom_dc ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_tensor_cd ) )
true


julia> UnderlyingMatrix( isomorphism_from_hom_to_tensor_ab ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_tensor_to_cohom_ab ) )
true

julia> UnderlyingMatrix( isomorphism_from_hom_to_tensor_ba ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_tensor_to_cohom_ba ) )
true

julia> UnderlyingMatrix( isomorphism_from_hom_to_tensor_cd ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_tensor_to_cohom_cd ) )
true

julia> UnderlyingMatrix( isomorphism_from_hom_to_tensor_dc ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_tensor_to_cohom_dc ) )
true


julia> UnderlyingMatrix( isomorphism_from_tensor_to_hom_dc ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_tensor_ab ) )
false

julia> UnderlyingMatrix( isomorphism_from_tensor_to_hom_dc ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_tensor_ba ) )
false


julia> UnderlyingMatrix( isomorphism_from_tensor_to_cohom_cd ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_hom_to_tensor_ab ) )
false

julia> UnderlyingMatrix( isomorphism_from_tensor_to_cohom_cd ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_hom_to_tensor_ba ) )
false


julia> UnderlyingMatrix( isomorphism_from_hom_to_tensor_ba ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_tensor_to_cohom_cd ) )
false

julia> UnderlyingMatrix( isomorphism_from_hom_to_tensor_ba ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_tensor_to_cohom_dc ) )
false


julia> UnderlyingMatrix( isomorphism_from_tensor_to_hom_ab ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_tensor_cd ) )
false

julia> UnderlyingMatrix( isomorphism_from_tensor_to_hom_ab ) == TransposedMatrix( UnderlyingMatrix( isomorphism_from_cohom_to_tensor_dc ) )
false


julia> morphism_from_hom_to_tensor_product_ab = MorphismFromInternalHomToTensorProduct( a, b );

julia> morphism_from_hom_to_tensor_product_ba = MorphismFromInternalHomToTensorProduct( b, a );

julia> morphism_from_hom_to_tensor_product_cd = MorphismFromInternalHomToTensorProduct( c, d );

julia> morphism_from_hom_to_tensor_product_dc = MorphismFromInternalHomToTensorProduct( d, c );


julia> morphism_from_tensor_product_to_cohom_ab = MorphismFromTensorProductToInternalCoHom( a, b );

julia> morphism_from_tensor_product_to_cohom_ba = MorphismFromTensorProductToInternalCoHom( b, a );

julia> morphism_from_tensor_product_to_cohom_cd = MorphismFromTensorProductToInternalCoHom( c, d );

julia> morphism_from_tensor_product_to_cohom_dc = MorphismFromTensorProductToInternalCoHom( d, c );


julia> UnderlyingMatrix( morphism_from_hom_to_tensor_product_ab ) == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_cohom_ab ) )
true

julia> UnderlyingMatrix( morphism_from_hom_to_tensor_product_ba ) == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_cohom_ba ) )
true

julia> UnderlyingMatrix( morphism_from_hom_to_tensor_product_cd ) == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_cohom_cd ) )
true

julia> UnderlyingMatrix( morphism_from_hom_to_tensor_product_dc ) == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_cohom_dc ) )
true


julia> UnderlyingMatrix( morphism_from_tensor_product_to_cohom_ab ) == TransposedMatrix( UnderlyingMatrix( morphism_from_hom_to_tensor_product_ab ) )
true

julia> UnderlyingMatrix( morphism_from_tensor_product_to_cohom_ba ) == TransposedMatrix( UnderlyingMatrix( morphism_from_hom_to_tensor_product_ba ) )
true

julia> UnderlyingMatrix( morphism_from_tensor_product_to_cohom_cd ) == TransposedMatrix( UnderlyingMatrix( morphism_from_hom_to_tensor_product_cd ) )
true

julia> UnderlyingMatrix( morphism_from_tensor_product_to_cohom_dc ) == TransposedMatrix( UnderlyingMatrix( morphism_from_hom_to_tensor_product_dc ) )
true


julia> UnderlyingMatrix( morphism_from_hom_to_tensor_product_ab ) == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_cohom_cd ) )
false

julia> UnderlyingMatrix( morphism_from_hom_to_tensor_product_ab ) == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_cohom_dc ) )
false


julia> UnderlyingMatrix( morphism_from_hom_to_tensor_product_cd ) == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_cohom_ab ) )
false

julia> UnderlyingMatrix( morphism_from_hom_to_tensor_product_cd ) == TransposedMatrix( UnderlyingMatrix( morphism_from_tensor_product_to_cohom_ba ) )
false


julia> UnderlyingMatrix( morphism_from_tensor_product_to_cohom_ba ) == TransposedMatrix( UnderlyingMatrix( morphism_from_hom_to_tensor_product_cd ) )
false

julia> UnderlyingMatrix( morphism_from_tensor_product_to_cohom_ba ) == TransposedMatrix( UnderlyingMatrix( morphism_from_hom_to_tensor_product_dc ) )
false


julia> UnderlyingMatrix( morphism_from_tensor_product_to_cohom_dc ) == TransposedMatrix( UnderlyingMatrix( morphism_from_hom_to_tensor_product_ab ) )
false

julia> UnderlyingMatrix( morphism_from_tensor_product_to_cohom_dc ) == TransposedMatrix( UnderlyingMatrix( morphism_from_hom_to_tensor_product_ba ) )
false



julia> coev_for_dual_a = CoevaluationForDual( a );

julia> coev_for_dual_b = CoevaluationForDual( b );

julia> coev_for_dual_0 = CoevaluationForDual( z );


julia> cocl_coev_for_codual_a = CoclosedCoevaluationForCoDual( a );

julia> cocl_coev_for_codual_b = CoclosedCoevaluationForCoDual( b );

julia> cocl_coev_for_codual_0 = CoclosedCoevaluationForCoDual( z );


julia> UnderlyingMatrix( coev_for_dual_a ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_for_codual_a ) )
true

julia> UnderlyingMatrix( coev_for_dual_b ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_for_codual_b ) )
true

julia> UnderlyingMatrix( coev_for_dual_0 ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_for_codual_0 ) )
true


julia> UnderlyingMatrix( coev_for_dual_a ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_for_codual_b ) )
false

julia> UnderlyingMatrix( coev_for_dual_b ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_for_codual_a ) )
false

julia> UnderlyingMatrix( coev_for_dual_0 ) == TransposedMatrix( UnderlyingMatrix( cocl_coev_for_codual_a ) )
false


julia> UnderlyingMatrix( cocl_coev_for_codual_a ) == TransposedMatrix( UnderlyingMatrix( coev_for_dual_b ) )
false

julia> UnderlyingMatrix( cocl_coev_for_codual_b ) == TransposedMatrix( UnderlyingMatrix( coev_for_dual_a ) )
false

julia> UnderlyingMatrix( cocl_coev_for_codual_0 ) == TransposedMatrix( UnderlyingMatrix( coev_for_dual_a ) )
false


julia> trace_id_0_tensor_a = TraceMap( id_0_tensor_a );

julia> trace_id_a_tensor_0 = TraceMap( id_a_tensor_0 );


julia> trace_id_a_tensor_b = TraceMap( id_a_tensor_b );

julia> trace_id_b_tensor_a = TraceMap( id_b_tensor_a );

julia> trace_id_c_tensor_d = TraceMap( id_c_tensor_d );

julia> trace_id_d_tensor_c = TraceMap( id_d_tensor_c );


julia> trace_id_hom_0a = TraceMap( id_hom_0a );

julia> trace_id_hom_a0 = TraceMap( id_hom_a0 );


julia> trace_id_hom_ab = TraceMap( id_hom_ab );

julia> trace_id_hom_ba = TraceMap( id_hom_ba );

julia> trace_id_hom_cd = TraceMap( id_hom_cd );

julia> trace_id_hom_dc = TraceMap( id_hom_dc );


julia> cotrace_id_0_tensor_a = CoTraceMap( id_0_tensor_a );

julia> cotrace_id_a_tensor_0 = CoTraceMap( id_a_tensor_0 );


julia> cotrace_id_a_tensor_b = CoTraceMap( id_a_tensor_b );

julia> cotrace_id_b_tensor_a = CoTraceMap( id_b_tensor_a );

julia> cotrace_id_c_tensor_d = CoTraceMap( id_c_tensor_d );

julia> cotrace_id_d_tensor_c = CoTraceMap( id_d_tensor_c );


julia> cotrace_id_hom_0a = CoTraceMap( id_hom_0a );

julia> cotrace_id_hom_a0 = CoTraceMap( id_hom_a0 );


julia> cotrace_id_hom_ab = CoTraceMap( id_hom_ab );

julia> cotrace_id_hom_ba = CoTraceMap( id_hom_ba );

julia> cotrace_id_hom_cd = CoTraceMap( id_hom_cd );

julia> cotrace_id_hom_dc = CoTraceMap( id_hom_dc );


julia> UnderlyingMatrix( trace_id_0_tensor_a ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_0_tensor_a ) )
true

julia> UnderlyingMatrix( trace_id_a_tensor_0 ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_a_tensor_0 ) )
true


julia> UnderlyingMatrix( trace_id_a_tensor_b ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_a_tensor_b ) )
true

julia> UnderlyingMatrix( trace_id_b_tensor_a ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_b_tensor_a ) )
true

julia> UnderlyingMatrix( trace_id_c_tensor_d ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_c_tensor_d ) )
true

julia> UnderlyingMatrix( trace_id_d_tensor_c ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_d_tensor_c ) )
true


julia> UnderlyingMatrix( trace_id_hom_0a ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_hom_0a ) )
true

julia> UnderlyingMatrix( trace_id_hom_a0 ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_hom_a0 ) )
true


julia> UnderlyingMatrix( trace_id_hom_ab ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_hom_ab ) )
true

julia> UnderlyingMatrix( trace_id_hom_ba ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_hom_ba ) )
true

julia> UnderlyingMatrix( trace_id_hom_cd ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_hom_cd ) )
true

julia> UnderlyingMatrix( trace_id_hom_dc ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_hom_dc ) )
true


julia> UnderlyingMatrix( trace_id_a_tensor_b ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_c_tensor_d ) )
false

julia> UnderlyingMatrix( trace_id_c_tensor_d ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_a_tensor_b ) )
false


julia> UnderlyingMatrix( trace_id_hom_ab ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_hom_cd ) )
false

julia> UnderlyingMatrix( trace_id_hom_dc ) == TransposedMatrix( UnderlyingMatrix( cotrace_id_hom_ba ) )
false


julia> UnderlyingMatrix( cotrace_id_b_tensor_a ) == TransposedMatrix( UnderlyingMatrix( trace_id_d_tensor_c ) )
false

julia> UnderlyingMatrix( cotrace_id_d_tensor_c ) == TransposedMatrix( UnderlyingMatrix( trace_id_b_tensor_a ) )
false


julia> UnderlyingMatrix( cotrace_id_hom_ba ) == TransposedMatrix( UnderlyingMatrix( trace_id_hom_dc ) )
false

julia> UnderlyingMatrix( cotrace_id_hom_dc ) == TransposedMatrix( UnderlyingMatrix( trace_id_hom_ba ) )
false


julia> rank_morphism_a = RankMorphism( a );

julia> rank_morphism_b = RankMorphism( b );

julia> rank_morphism_c = RankMorphism( c );

julia> rank_morphism_d = RankMorphism( d );


julia> rank_morphism_a_tensor_b = RankMorphism( a_tensor_b );

julia> rank_morphism_b_tensor_a = RankMorphism( b_tensor_a );

julia> rank_morphism_c_tensor_d = RankMorphism( c_tensor_d );

julia> rank_morphism_d_tensor_c = RankMorphism( d_tensor_c );


julia> rank_morphism_a_tensor_0 = RankMorphism( a_tensor_0 );

julia> rank_morphism_0_tensor_a = RankMorphism( 0_tensor_a );


julia> rank_morphism_hom_ab = RankMorphism( hom_ab );

julia> rank_morphism_hom_ba = RankMorphism( hom_ba );

julia> rank_morphism_hom_cd = RankMorphism( hom_cd );

julia> rank_morphism_hom_dc = RankMorphism( hom_dc );


julia> corank_morphism_a = CoRankMorphism( a );

julia> corank_morphism_b = CoRankMorphism( b );

julia> corank_morphism_c = CoRankMorphism( c );

julia> corank_morphism_d = CoRankMorphism( d );


julia> corank_morphism_a_tensor_b = CoRankMorphism( a_tensor_b );

julia> corank_morphism_b_tensor_a = CoRankMorphism( b_tensor_a );

julia> corank_morphism_c_tensor_d = CoRankMorphism( c_tensor_d );

julia> corank_morphism_d_tensor_c = CoRankMorphism( d_tensor_c );


julia> corank_morphism_a_tensor_0 = CoRankMorphism( a_tensor_0 );

julia> corank_morphism_0_tensor_a = CoRankMorphism( 0_tensor_a );


julia> corank_morphism_cohom_ab = CoRankMorphism( cohom_ab );

julia> corank_morphism_cohom_ba = CoRankMorphism( cohom_ba );

julia> corank_morphism_cohom_cd = CoRankMorphism( cohom_cd );

julia> corank_morphism_cohom_dc = CoRankMorphism( cohom_dc );


julia> UnderlyingMatrix( rank_morphism_a ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_a ) )
true

julia> UnderlyingMatrix( rank_morphism_b ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_b ) )
true

julia> UnderlyingMatrix( rank_morphism_c ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_c ) )
true

julia> UnderlyingMatrix( rank_morphism_d ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_d ) )
true


julia> UnderlyingMatrix( rank_morphism_a_tensor_b ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_a_tensor_b ) )
true

julia> UnderlyingMatrix( rank_morphism_b_tensor_a ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_b_tensor_a ) )
true

julia> UnderlyingMatrix( rank_morphism_c_tensor_d ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_c_tensor_d ) )
true

julia> UnderlyingMatrix( rank_morphism_d_tensor_c ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_d_tensor_c ) )
true


julia> UnderlyingMatrix( rank_morphism_a_tensor_0 ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_a_tensor_0 ) )
true

julia> UnderlyingMatrix( rank_morphism_0_tensor_a ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_0_tensor_a ) )
true


julia> UnderlyingMatrix( rank_morphism_hom_ab ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_cohom_ab ) )
true

julia> UnderlyingMatrix( rank_morphism_hom_ba ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_cohom_ba ) )
true

julia> UnderlyingMatrix( rank_morphism_hom_cd ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_cohom_cd ) )
true

julia> UnderlyingMatrix( rank_morphism_hom_dc ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_cohom_dc ) )
true


julia> UnderlyingMatrix( rank_morphism_a ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_b ) )
false

julia> UnderlyingMatrix( rank_morphism_b ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_a ) )
false

julia> UnderlyingMatrix( rank_morphism_c ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_d ) )
false

julia> UnderlyingMatrix( rank_morphism_d ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_c ) )
false


julia> UnderlyingMatrix( rank_morphism_a_tensor_0 ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_a_tensor_b ) )
false

julia> UnderlyingMatrix( rank_morphism_0_tensor_a ) == TransposedMatrix( UnderlyingMatrix( corank_morphism_c_tensor_d ) )
false


julia> UnderlyingMatrix( corank_morphism_a ) == TransposedMatrix( UnderlyingMatrix( rank_morphism_d ) )
false

julia> UnderlyingMatrix( corank_morphism_b ) == TransposedMatrix( UnderlyingMatrix( rank_morphism_c ) )
false

julia> UnderlyingMatrix( corank_morphism_c ) == TransposedMatrix( UnderlyingMatrix( rank_morphism_b ) )
false

julia> UnderlyingMatrix( corank_morphism_d ) == TransposedMatrix( UnderlyingMatrix( rank_morphism_a ) )
false


julia> UnderlyingMatrix( corank_morphism_a_tensor_0 ) == TransposedMatrix( UnderlyingMatrix( rank_morphism_a_tensor_b ) )
false

julia> UnderlyingMatrix( corank_morphism_0_tensor_a ) == TransposedMatrix( UnderlyingMatrix( rank_morphism_c_tensor_d ) )
false


julia> UnderlyingMatrix( corank_morphism_cohom_ab ) == TransposedMatrix( UnderlyingMatrix( rank_morphism_hom_cd ) )
false

julia> UnderlyingMatrix( corank_morphism_cohom_cd ) == TransposedMatrix( UnderlyingMatrix( rank_morphism_hom_ab ) )
false


julia> morphism_from_bidual_a = MorphismFromBidual( a );

julia> morphism_from_bidual_b = MorphismFromBidual( b );

julia> morphism_from_bidual_c = MorphismFromBidual( c );

julia> morphism_from_bidual_d = MorphismFromBidual( d );


julia> morphism_to_cobidual_a = MorphismToCoBidual( a );

julia> morphism_to_cobidual_b = MorphismToCoBidual( b );

julia> morphism_to_cobidual_c = MorphismToCoBidual( c );

julia> morphism_to_cobidual_d = MorphismToCoBidual( d );


julia> UnderlyingMatrix( morphism_from_bidual_a ) == TransposedMatrix( UnderlyingMatrix( morphism_to_cobidual_a ) )
true

julia> UnderlyingMatrix( morphism_from_bidual_b ) == TransposedMatrix( UnderlyingMatrix( morphism_to_cobidual_b ) )
true

julia> UnderlyingMatrix( morphism_from_bidual_c ) == TransposedMatrix( UnderlyingMatrix( morphism_to_cobidual_c ) )
true

julia> UnderlyingMatrix( morphism_from_bidual_d ) == TransposedMatrix( UnderlyingMatrix( morphism_to_cobidual_d ) )
true


julia> UnderlyingMatrix( morphism_to_bidual_a ) == TransposedMatrix( UnderlyingMatrix( morphism_from_bidual_a ) )
true

julia> UnderlyingMatrix( morphism_to_bidual_b ) == TransposedMatrix( UnderlyingMatrix( morphism_from_bidual_b ) )
true

julia> UnderlyingMatrix( morphism_to_bidual_c ) == TransposedMatrix( UnderlyingMatrix( morphism_from_bidual_c ) )
true

julia> UnderlyingMatrix( morphism_to_bidual_d ) == TransposedMatrix( UnderlyingMatrix( morphism_from_bidual_d ) )
true


julia> UnderlyingMatrix( morphism_from_cobidual_a ) == TransposedMatrix( UnderlyingMatrix( morphism_to_cobidual_a ) )
true

julia> UnderlyingMatrix( morphism_from_cobidual_b ) == TransposedMatrix( UnderlyingMatrix( morphism_to_cobidual_b ) )
true

julia> UnderlyingMatrix( morphism_from_cobidual_c ) == TransposedMatrix( UnderlyingMatrix( morphism_to_cobidual_c ) )
true

julia> UnderlyingMatrix( morphism_from_cobidual_d ) == TransposedMatrix( UnderlyingMatrix( morphism_to_cobidual_d ) )
true


julia> UnderlyingMatrix( morphism_from_bidual_a ) == TransposedMatrix( UnderlyingMatrix( morphism_to_cobidual_b ) )
false

julia> UnderlyingMatrix( morphism_from_bidual_a ) == TransposedMatrix( UnderlyingMatrix( morphism_to_cobidual_c ) )
false

julia> UnderlyingMatrix( morphism_from_bidual_a ) == TransposedMatrix( UnderlyingMatrix( morphism_to_cobidual_d ) )
false


julia> UnderlyingMatrix( morphism_to_cobidual_c ) == TransposedMatrix( UnderlyingMatrix( morphism_from_bidual_a ) )
false

julia> UnderlyingMatrix( morphism_to_cobidual_c ) == TransposedMatrix( UnderlyingMatrix( morphism_from_bidual_b ) )
false

julia> UnderlyingMatrix( morphism_to_cobidual_c ) == TransposedMatrix( UnderlyingMatrix( morphism_from_bidual_d ) )
false


```
