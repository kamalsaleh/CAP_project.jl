pop!(ModulesForEvaluationStack)
@Assert( 0, IsEmpty( ModulesForEvaluationStack ) )

const TheFamilyOfDummyFields = NewFamily( "TheFamilyOfDummyFields" )
const CAP_INTERNAL_DUMMY_FIELD_COUNTER = Ref( 1 )

# SemiringFilter/SemiringElementFilter are plain functions in the emulation, not attributes.
SemiringFilter( ring::IsAttributeStoringRep_and_IsDummyField.abstract_type ) = getfield( ring, :dict )[ :SemiringFilter ]
SemiringElementFilter( ring::IsAttributeStoringRep_and_IsDummyField.abstract_type ) = getfield( ring, :dict )[ :SemiringElementFilter ]

@InstallGlobalFunction( DummyField, function( )
    ring_filter = NewFilter( "DummyFieldFilter", IsDummyField )
    ring_element_filter = NewFilter( "DummyFieldElementFilter", IsDummyFieldElement )
    name = @Concatenation( "Dummy field ", StringGAP( CAP_INTERNAL_DUMMY_FIELD_COUNTER[] ) )
    CAP_INTERNAL_DUMMY_FIELD_COUNTER[] += 1
    ring = CreateGapObjectWithAttributes( NewType( TheFamilyOfDummyFields, IsAttributeStoringRep_and_IsDummyField ),
        Name, name,
        StringGAP, name,
        IsField, true )
    getfield( ring, :dict )[ :SemiringFilter ] = ring_filter
    getfield( ring, :dict )[ :SemiringElementFilter ] = ring_element_filter
    CapJitAddTypeSignature( "+", [ ring_element_filter, ring_element_filter ], ring_element_filter )
    CapJitAddTypeSignature( "ZeroImmutable", [ ring_filter ], ring_element_filter )
    CapJitAddTypeSignature( "AdditiveInverseSameMutability", [ ring_element_filter ], ring_element_filter )
    CapJitAddTypeSignature( "*", [ ring_element_filter, ring_element_filter ], ring_element_filter )
    CapJitAddTypeSignature( "OneImmutable", [ ring_filter ], ring_element_filter )
    return ring
end )

function MultiplyWithElementOfCommutativeSemiringForMorphisms(C::IsCapCategory.abstract_type, r::Any, alpha::IsCapCategoryMorphism.abstract_type)
    semiring = CommutativeSemiringOfLinearCategory( C );
    return MultiplyWithElementOfCommutativeSemiringForMorphisms( C, semiring( r ), alpha );
end

##
## BigInt wrappers: delegate BigInt integer argument to the Int64 version.

# [ "category", "list_of_objects", "integer" ]
for op in [ :ProjectionInFactorOfDirectProduct, :InjectionOfCofactorOfCoproduct,
             :ProjectionInFactorOfDirectSum, :InjectionOfCofactorOfDirectSum ]
    @eval begin
        function $op( cat::IsCapCategory.abstract_type, objects::IsList.abstract_type, k::BigInt )
            return $op( cat, objects, Int( k ) )
        end
        function $op( objects::IsList.abstract_type, k::BigInt )
            return $op( objects, Int( k ) )
        end
    end
end

# [ "category", "list_of_objects", "integer", "object" ]
for op in [ :ProjectionInFactorOfDirectProductWithGivenDirectProduct, :InjectionOfCofactorOfCoproductWithGivenCoproduct,
             :ProjectionInFactorOfDirectSumWithGivenDirectSum, :InjectionOfCofactorOfDirectSumWithGivenDirectSum ]
    @eval begin
        function $op( cat::IsCapCategory.abstract_type, objects::IsList.abstract_type, k::BigInt, P::IsCapCategoryObject.abstract_type )
            return $op( cat, objects, Int( k ), P )
        end
        function $op( objects::IsList.abstract_type, k::BigInt, P::IsCapCategoryObject.abstract_type )
            return $op( objects, Int( k ), P )
        end
    end
end

# [ "category", "list_of_morphisms", "integer" ]
for op in [ :ProjectionInFactorOfFiberProduct, :InjectionOfCofactorOfPushout ]
    @eval begin
        function $op( cat::IsCapCategory.abstract_type, morphisms::IsList.abstract_type, k::BigInt )
            return $op( cat, morphisms, Int( k ) )
        end
        function $op( morphisms::IsList.abstract_type, k::BigInt )
            return $op( morphisms, Int( k ) )
        end
    end
end

# [ "category", "list_of_morphisms", "integer", "object" ]
for op in [ :ProjectionInFactorOfFiberProductWithGivenFiberProduct, :InjectionOfCofactorOfPushoutWithGivenPushout ]
    @eval begin
        function $op( cat::IsCapCategory.abstract_type, morphisms::IsList.abstract_type, k::BigInt, P::IsCapCategoryObject.abstract_type )
            return $op( cat, morphisms, Int( k ), P )
        end
        function $op( morphisms::IsList.abstract_type, k::BigInt, P::IsCapCategoryObject.abstract_type )
            return $op( morphisms, Int( k ), P )
        end
    end
end

# [ "category", "morphism", "list_of_objects", "integer" ]
for op in [ :ComponentOfMorphismIntoDirectProduct, :ComponentOfMorphismFromCoproduct,
             :ComponentOfMorphismIntoDirectSum, :ComponentOfMorphismFromDirectSum ]
    @eval begin
        function $op( cat::IsCapCategory.abstract_type, alpha::IsCapCategoryMorphism.abstract_type, objects::IsList.abstract_type, i::BigInt )
            return $op( cat, alpha, objects, Int( i ) )
        end
        function $op( alpha::IsCapCategoryMorphism.abstract_type, objects::IsList.abstract_type, i::BigInt )
            return $op( alpha, objects, Int( i ) )
        end
    end
end

# Make functors and natural transformations callable on objects and cells, respectively.
function (F::IsCapFunctor.abstract_type)(c::IsCapCategoryCell.abstract_type)
    CallFuncList(F, [c])
end

function (F::IsCapNaturalTransformation.abstract_type)(c::IsCapCategoryObject.abstract_type)
    CallFuncList(F, [c])
end

## LaTeXOutput for Nemo ring types (moved from MatricesForHomalg)
LaTeXOutput( ::Nemo.ZZRing ) = "\\mathbb{Z}"
LaTeXOutput( ::Nemo.QQField ) = "\\mathbb{Q}"

function Show( c::Union{IsCapCategoryObject.abstract_type, IsCapCategoryMorphism.abstract_type}; scale = "1", width = "10in", height = "15in" )
    str = LaTeXOutput( c )
    if str !== fail
        Show( str; scale = scale, width = width, height = height )
    end
end
