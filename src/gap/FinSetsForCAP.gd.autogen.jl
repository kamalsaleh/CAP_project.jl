# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Declarations
#

# Technical functions
@DeclareGlobalFunction( "INSTALL_FUNCTIONS_FOR_FIN_SETS" );

#! @Chapter The category of finite sets

#! @Section GAP Categories

#! @Description
#! The GAP category of categories
#! of finite sets.
#! @Arguments object
@DeclareFilter( "IsCategoryOfFinSets",
                  IsCapCategory );

#! @Description
#! The GAP category of objects ⥉ the category
#! of finite sets.
#! @Arguments object
@DeclareFilter( "IsFiniteSet",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms ⥉ the category
#! of finite sets.
#! @Arguments object
@DeclareFilter( "IsFiniteSetMap",
                 IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  The &GAP; set of the list used to construct a finite set $S$, i.e.,
#!  <C>AsList( FinSet( <A>L</A> ) ) == SetGAP( <A>L</A> )</C>.
#! @Arguments M
#! @Returns a &GAP; set
@DeclareAttribute( "AsList",
        IsFiniteSet );

#! @Description
#!  The length of the &GAP; set of the list used to construct a finite set $S$, i.e.,
#!  <C>Length( FinSet( <A>L</A> ) ) == Length( SetGAP( <A>L</A> ) )</C>.
#! @Arguments M
#! @Returns an integer
@DeclareAttribute( "Length",
        IsFiniteSet );

#! @Description
#!  The relation underlying a map between finite sets,
#!  i.e., <C>AsList( MapOfFinSets( S, <A>G</A>, T ) ) == <A>G</A></C>.
#! @Arguments f
#! @Returns a list
@DeclareAttribute( "AsList",
        IsFiniteSetMap );

#! @Section Constructors

#! @Description
#!  Construct a category of finite sets.
#! @Returns a &CAP; category
@DeclareOperation( "CategoryOfFinSets", [ ] );

#! @Description
#!  The default instance of the category of finite sets.
#!  It is automatically created while loading this package.
DeclareGlobalName( "FinSets" );

#! @Description
#!  Construct a finite set out of the list <A>L</A>, i.e.,
#!  an object ⥉ the &CAP; category <C>cat_of_fin_sets</C>.
#!  The &GAP; operation <C>SetGAP</C> must be applicable to <A>L</A> without throwing an error.
#!  Equality is determined as follows: <C>FinSet( L1 ) == FinSet( L2 )</C> iff <C>IsEqualForElementsOfFinSets( Immutable( SetGAP( L1 ) ), Immutable( SetGAP( L2 ) ) )</C>.
#!  Warning: all internal operations use <C>FinSetNC</C> (see below) instead of <C>FinSet</C>.
#!  Thus, this notion of equality is only valid for objects created by calling <C>FinSet</C> explicitly.
#!  Internally, <C>FinSet( cat_of_fin_sets, L )</C> is an alias for <C>FinSetNC( cat_of_fin_sets, SetGAP( L ) )</C> && equality is determined as for <C>FinSetNC</C>.
#!  Thus, <C>FinSet( cat_of_fin_sets, L1 ) == FinSetNC( cat_of_fin_sets, L2 )</C> iff <C>IsEqualForElementsOfFinSets( Immutable( SetGAP( L1 ) ), Immutable( L2 ) )</C> &&
#!  <C>FinSetNC( cat_of_fin_sets, L1 ) == FinSet( cat_of_fin_sets, L2 )</C> iff <C>IsEqualForElementsOfFinSets( Immutable( L1 ), Immutable( SetGAP( L2 ) ) )</C>.
#! @Arguments cat_of_fin_sets, L
#! @Returns a &CAP; object
@DeclareOperation( "FinSet",
        [ IsCategoryOfFinSets, IsList ] );

#! @Description
#!  Return <C>FinSet</C>( <C>FinSets</C>, <A>L</A> ).
#! @Arguments L
#! @Returns a &CAP; object
@DeclareOperation( "FinSet",
        [ IsList ] );
#! @InsertChunk FinSet

#! @Description
#!  Construct a finite set out of the duplicate-free (w.r.t. <C>IsEqualForElementsOfFinSets</C>) && dense list <A>L</A>, i.e.,
#!  an object ⥉ the &CAP; category <C>cat_of_fin_sets,</C>.
#!  Equality is determined as follows: <C>FinSetNC( cat_of_fin_sets, L1 ) == FinSetNC( cat_of_fin_sets, L2 )</C>
#!  iff <C>IsEqualForElementsOfFinSets( Immutable( L1 ), Immutable( L2 ) )</C>.
#! @Arguments cat_of_fin_sets, L
#! @Returns a &CAP; object
@DeclareOperation( "FinSetNC",
        [ IsCategoryOfFinSets, IsList ] );

#! @Description
#!  Return <C>FinSetNC</C>( <C>FinSets</C>, <A>L</A> ).
#! @Arguments L
#! @Returns a &CAP; object
@DeclareOperation( "FinSetNC",
        [ IsList ] );
#! @InsertChunk FinSetNC

#! @Description
#!  Construct a map $\phi:$<A>S</A>$\to$<A>T</A> of the finite sets <A>S</A> && <A>T</A>,
#!  i.e., a morphism ⥉ the &CAP; category <C>FinSets</C>, where <A>G</A>
#!  is a list of pairs ⥉ <A>S</A>$\times$<A>T</A> describing the graph of $\phi$.
#! @Arguments S, G, T
#! @Returns a &CAP; morphism
@DeclareOperation( "MapOfFinSets",
        [ IsFiniteSet, IsList, IsFiniteSet ] );
#! @InsertChunk MapOfFinSets

#! @Description
#!  Construct a map $\phi:$<A>S</A>$\to$<A>T</A> of the finite sets <A>S</A> && <A>T</A>,
#!  i.e., a morphism ⥉ the &CAP; category <C>FinSets</C>, where <A>G</A>
#!  is a duplicate-free && dense list of pairs ⥉ <A>S</A>$\times$<A>T</A> describing the graph of $\phi$.
#! @Arguments S, G, T
#! @Returns a &CAP; morphism
@DeclareOperation( "MapOfFinSetsNC",
        [ IsFiniteSet, IsList, IsFiniteSet ] );
#! @InsertChunk MapOfFinSetsNC

#! @Section Tools

#! @Description
#!  Compares two arbitrary objects using the following rules:
#!  * integers, strings && chars are compared using the operation <C>=</C>
#!  * lists && records are compared recursively
#!  * &CAP; category objects are compared using <C>IsEqualForObjects</C> (if available)
#!  * &CAP; category morphisms are compared using <C>IsEqualForMorphismsOnMor</C> (if available)
#!  * other objects are compared using <C>IsIdenticalObj</C>
#!
#!  Note: if &CAP; category objects || &CAP; category morphisms are compared using <C>IsEqualForObjects</C> || <C>IsEqualForMorphismsOnMor</C>, respectively, the result must !be <C>fail</C>.
#! @Arguments a, b
#! @Returns a boolean
@DeclareOperation( "IsEqualForElementsOfFinSets",
        [ IsObject, IsObject ] );
#! @InsertChunk IsEqualForElementsOfFinSets

#! @Description
#!  Returns <C>true</C> if there exists an element ⥉ <C>AsList( <A>M</A> )</C> which is equal to <A>obj</A> w.r.t. <C>IsEqualForElementsOfFinSets</C> && <C>false</C> if not.
#! @Arguments obj, M
#! @Returns a boolean
# DeclareOperation( "\in",
#         [ IsObject, IsFiniteSet ] );

#! @Description
#!  Returns the <A>i</A>-th entry of the &GAP; set of the list used to construct a finite set $S$, i.e.,
#!  <C>FinSet( <A>L</A> )[ i ] == SetGAP( <A>L</A> )[ i ]</C>.
#! @Arguments M, i
#! @Returns an object
@DeclareOperation( "[]",
        [ IsFiniteSet, IsInt ] );

#! @Description
#!  An iterator of the &GAP; set of the list used to construct a finite set $S$, i.e.,
#!  <C>Iterator( FinSet( <A>L</A> ) ) == Iterator( SetGAP( <A>L</A> ) )</C>.
#! @Arguments M
#! @Returns an iterator
@DeclareOperation( "Iterator",
        [ IsFiniteSet ] );

#! @Description
#!  Compute the set-theoretic union of the elements of <A>L</A>, where <A>L</A> is a list of finite sets ⥉ the category <A>cat_of_fin_sets</A>.
#! @Arguments cat_of_fin_sets, L
#! @Returns a &CAP; object
@DeclareOperation( "UnionOfFinSets",
        [ IsCategoryOfFinSets, IsList ] );

#! @Description
#!  Returns <C>List( AsList( <A>M</A> ), <A>f</A> )</C>.
#! @Arguments M, f
#! @Returns a list
@DeclareOperation( "ListOp",
        [ IsFiniteSet, IsFunction ] );

#! @Description
#!  Returns <C>FinSetNC( Filtered( AsList( <A>M</A> ), <A>f</A> ) )</C>.
#! @Arguments M, f
#! @Returns a list
@DeclareOperation( "FilteredOp",
        [ IsFiniteSet, IsFunction ] );

#! @Description
#!  Returns <C>First( AsList( <A>M</A> ), <A>f</A> )</C>.
#! @Arguments M, f
#! @Returns a list
@DeclareOperation( "FirstOp",
        [ IsFiniteSet, IsFunction ] );

#! @Description
#!  Construct the embedding $\iota:$<A>S</A>$\to$<A>T</A> of the finite sets <A>S</A> && <A>T</A>,
#!  where <A>S</A> must be subset of <A>T</A>.
#! @Arguments S, T
#! @Returns a &CAP; morphism
@DeclareOperation( "EmbeddingOfFinSets",
        [ IsFiniteSet, IsFiniteSet ] );

#! @Description
#!  Construct the projection $\pi:$<A>S</A>$\to$<A>T</A> of the finite sets <A>S</A> && <A>T</A>,
#!  where <A>T</A> is a partition of <A>S</A>.
#! @Arguments S, T
#! @Returns a &CAP; morphism
@DeclareOperation( "ProjectionOfFinSets",
        [ IsFiniteSet, IsFiniteSet ] );

#! @Description
#!  Compute the preimage of <A>T_</A> under the morphism <A>f</A>.
#! @Arguments f, T_
#! @Returns a &CAP; object
@DeclareOperation( "Preimage",
        [ IsFiniteSetMap, IsFiniteSet ] );

#! @Description
#!  Compute the image of <A>S_</A> under the morphism <A>f</A>.
#! @Arguments f, S_
#! @Returns a &CAP; object
@DeclareOperation( "ImageObject",
        [ IsFiniteSetMap, IsFiniteSet ] );

#! @Description
#!  Returns the image of <C><A>L</A>[1]</C> under the map <A>phi</A> assuming <C><A>L</A>[1]</C> is an element of <C>AsList( Source( <A>phi</A> ) )</C>.
#! @Arguments phi, L
#! @Returns a list
# DeclareOperation( "CallFuncList",
#         [ IsFiniteSetMap, IsList ] );

#! @Description
#!  Returns <C>List( AsList( <A>F</A> ), <A>phi</A> )</C>.
#! @Arguments F, phi
#! @Returns a list
@DeclareOperation( "ListOp",
        [ IsFiniteSet, IsFiniteSetMap ] );
