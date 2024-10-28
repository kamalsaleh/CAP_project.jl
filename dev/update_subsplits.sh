#!/bin/bash

set -e

# update git index
git status > /dev/null

if ! git diff-index --quiet HEAD; then
	echo "WARNING: Dirty working tree."
fi

if [[ "$(git rev-parse --abbrev-ref HEAD)" != "master" ]]; then
	echo "ERROR: Not on branch master"
	exit 1
fi

# CAP
git subtree split --prefix=CAP -b CAP-split
git push git@github.com:homalg-project/CAP.jl.git CAP-split:master
echo ""

# MonoidalCategories
git subtree split --prefix=MonoidalCategories -b MonoidalCategories-split
git push git@github.com:homalg-project/MonoidalCategories.jl.git MonoidalCategories-split:master
echo ""

# CartesianCategories
git subtree split --prefix=CartesianCategories -b CartesianCategories-split
git push git@github.com:homalg-project/CartesianCategories.jl.git CartesianCategories-split:master
echo ""

# Toposes
git subtree split --prefix=Toposes -b Toposes-split
git push git@github.com:homalg-project/Toposes.jl.git Toposes-split:master
echo ""

# FinSetsForCAP
git subtree split --prefix=FinSetsForCAP -b FinSetsForCAP-split
git push git@github.com:homalg-project/FinSetsForCAP.jl.git FinSetsForCAP-split:master
echo ""

# ZXCalculusForCAP
git subtree split --prefix=ZXCalculusForCAP -b ZXCalculusForCAP-split
git push git@github.com:homalg-project/ZXCalculusForCAP.jl.git ZXCalculusForCAP-split:master
echo ""

# LinearAlgebraForCAP
git subtree split --prefix=LinearAlgebraForCAP -b LinearAlgebraForCAP-split
git push git@github.com:homalg-project/LinearAlgebraForCAP.jl.git LinearAlgebraForCAP-split:master
echo ""

# FreydCategoriesForCAP
git subtree split --prefix=FreydCategoriesForCAP -b FreydCategoriesForCAP-split
git push git@github.com:homalg-project/FreydCategoriesForCAP.jl.git FreydCategoriesForCAP-split:master
echo ""

# ModulePresentationsForCAP
git subtree split --prefix=ModulePresentationsForCAP -b ModulePresentationsForCAP-split
git push git@github.com:homalg-project/ModulePresentationsForCAP.jl.git ModulePresentationsForCAP-split:master
echo ""
