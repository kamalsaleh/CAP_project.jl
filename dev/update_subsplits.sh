#!/bin/bash

set -e

# update git index
git status > /dev/null

# Check if token exists
if [ -z "$GITHUB_TOKEN" ]; then
  echo "ERROR: Missing GITHUB_TOKEN"
  exit 1
fi

# Check if username exists
if [ -z "$GITHUB_USERNAME" ]; then
  echo "ERROR: Missing GITHUB_USERNAME"
  exit 1
fi

if ! git diff-index --quiet HEAD; then
	echo "WARNING: Dirty working tree."
fi

if [[ "$(git rev-parse --abbrev-ref HEAD)" != "master" ]]; then
	echo "ERROR: Not on branch master"
	exit 1
fi

# CAP
git subtree split --prefix=CAP -b CAP-split
git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/CAP.jl.git CAP-split:master
echo ""

# MonoidalCategories
git subtree split --prefix=MonoidalCategories -b MonoidalCategories-split
git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/MonoidalCategories.jl.git MonoidalCategories-split:master
echo ""

# CartesianCategories
git subtree split --prefix=CartesianCategories -b CartesianCategories-split
git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/CartesianCategories.jl.git CartesianCategories-split:master
echo ""

# Toposes
git subtree split --prefix=Toposes -b Toposes-split
git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/Toposes.jl.git Toposes-split:master
echo ""

# FinSetsForCAP
git subtree split --prefix=FinSetsForCAP -b FinSetsForCAP-split
git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/FinSetsForCAP.jl.git FinSetsForCAP-split:master
echo ""

# ZXCalculusForCAP
git subtree split --prefix=ZXCalculusForCAP -b ZXCalculusForCAP-split
git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/ZXCalculusForCAP.jl.git ZXCalculusForCAP-split:master
echo ""

# LinearAlgebraForCAP
git subtree split --prefix=LinearAlgebraForCAP -b LinearAlgebraForCAP-split
git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/LinearAlgebraForCAP.jl.git LinearAlgebraForCAP-split:master
echo ""

# FreydCategoriesForCAP
git subtree split --prefix=FreydCategoriesForCAP -b FreydCategoriesForCAP-split
git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/FreydCategoriesForCAP.jl.git FreydCategoriesForCAP-split:master
echo ""

# ModulePresentationsForCAP
git subtree split --prefix=ModulePresentationsForCAP -b ModulePresentationsForCAP-split
git push https://${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/ModulePresentationsForCAP.jl.git ModulePresentationsForCAP-split:master
echo ""
