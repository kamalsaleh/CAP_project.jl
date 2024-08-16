module FreydCategoriesForCAP

@nospecialize

import Base./
import Base.*
import Base.^
import Base.==
import Base.getindex

using MatricesForHomalg

using CAP

const IsOne = CAP.IsOne # MatricesForHomalg also exports IsOne

import CAP.DistinguishedObjectOfHomomorphismStructureExtendedByFullEmbedding
import CAP.HomomorphismStructureOnObjectsExtendedByFullEmbedding
import CAP.HomomorphismStructureOnMorphismsExtendedByFullEmbedding
import CAP.HomomorphismStructureOnMorphismsWithGivenObjectsExtendedByFullEmbedding
import CAP.InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureExtendedByFullEmbedding
import CAP.InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjectsExtendedByFullEmbedding
import CAP.InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphismExtendedByFullEmbedding

import CAP.ModelingTowerObjectConstructor
import CAP.ModelingTowerObjectDatum
import CAP.ModelingTowerMorphismConstructor
import CAP.ModelingTowerMorphismDatum
import CAP.ModelingObject
import CAP.ReinterpretationOfObject
import CAP.ModelingMorphism
import CAP.ReinterpretationOfMorphism

using MonoidalCategories

using LinearAlgebraForCAP # this is not a GAP dependency but needed for various declarations not (yet) part of MatricesForHomalg

import LinearAlgebraForCAP.NrRows
import LinearAlgebraForCAP.NrCols

#import CAP.StringGAP_OPERATION
#import CAP.ViewString
#import CAP.DisplayString
#import CAP.LaTeXOutput

include("init.jl")

end # module FreydCategoriesForCAP
