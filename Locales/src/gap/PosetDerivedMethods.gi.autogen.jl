# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
AddDerivationToCAP( AreIsomorphicForObjectsIfIsHomSetInhabited,
        "AreIsomorphicForObjectsIfIsHomSetInhabited using IsEqualForObjectsIfIsHomSetInhabited",
        [ [ IsEqualForObjectsIfIsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return IsEqualForObjectsIfIsHomSetInhabited( cat, A, B );
    
end; CategoryFilter = IsPosetCategory );

##
AddDerivationToCAP( IsEqualForObjectsIfIsHomSetInhabited,
        "IsEqualForObjectsIfIsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited",
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, B );
    
end; CategoryFilter = IsPosetCategory );

##
AddDerivationToCAP( IsEqualForObjects,
        "",
        [ [ IsHomSetInhabited, 1 ],
          [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return IsHomSetInhabited( cat, A, B ) &&
           AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, B );
    
end; CategoryFilter = IsPosetCategory );

##
AddDerivationToCAP( DirectProduct,
        "",
        [ [ IsHomSetInhabited, 2 ] ],
        
  function( cat, L )
    
    return First( SortedList( L, ( A, B ) -> IsHomSetInhabited( cat, A, B ) ) );
    
end; CategoryFilter = cat -> HasIsTotalOrderCategory( cat ) && IsTotalOrderCategory( cat ) && !( @IsBound( cat.supports_empty_limits ) && cat.supports_empty_limits == true ) );

##
AddDerivationToCAP( Coproduct,
        "",
        [ [ IsHomSetInhabited, 2 ] ],
        
  function( cat, L )
    
    return Last( SortedList( L, ( A, B ) -> IsHomSetInhabited( cat, A, B ) ) );
    
end; CategoryFilter = cat -> HasIsTotalOrderCategory( cat ) && IsTotalOrderCategory( cat ) && !( @IsBound( cat.supports_empty_limits ) && cat.supports_empty_limits == true ) );

if (IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ))

##
AddDerivationToCAP( SetOfGeneratingMorphismsOfCategory,
        "",
        [ [ SetOfObjectsOfCategory, 1 ],
          [ IsHomSetInhabited, 1 ],
          [ UniqueMorphism, 4 ] ],
        
  function( cat )
    local objects, l, digraph;
    
    objects = SetOfObjectsOfCategory( cat );
    
    l = Length( objects );
    
    digraph = DigraphReflexiveTransitiveReduction( Digraph( objects, IsHomSetInhabited ) );
    
    return @Concatenation( List( (1):(l), s ->
                   List( OutNeighborsOfVertex( digraph, s ), t ->
                         UniqueMorphism( cat, objects[s], objects[t] ) ) ) );
    
end; CategoryFilter = cat -> HasIsPosetCategory( cat ) && IsPosetCategory( cat ) && HasIsFiniteCategory( cat ) && IsFiniteCategory( cat ) );

end;
