install:
	julia -e 'using Pkg; \
		Pkg.develop(path = "CAP"); \
		Pkg.develop(path = "MonoidalCategories"); \
		Pkg.develop(path = "CartesianCategories"); \
		Pkg.develop(path = "Toposes"); \
		Pkg.develop(path = "FinSetsForCAP"); \
		Pkg.develop(path = "ZXCalculusForCAP"); \
		Pkg.develop(path = "LinearAlgebraForCAP"); \
		Pkg.develop(path = "FreydCategoriesForCAP"); \
		Pkg.develop(path = "ModulePresentationsForCAP"); \
	'

gen:
	$(MAKE) -C CAP gen
	$(MAKE) -C MonoidalCategories gen
	$(MAKE) -C CartesianCategories gen
	$(MAKE) -C Toposes gen
	$(MAKE) -C FinSetsForCAP gen
	$(MAKE) -C ZXCalculusForCAP gen
	$(MAKE) -C LinearAlgebraForCAP gen
	$(MAKE) -C FreydCategoriesForCAP gen
	$(MAKE) -C ModulePresentationsForCAP gen

clean-gen:
	$(MAKE) -C CAP clean-gen
	$(MAKE) -C MonoidalCategories clean-gen
	$(MAKE) -C CartesianCategories clean-gen
	$(MAKE) -C Toposes clean-gen
	$(MAKE) -C FinSetsForCAP clean-gen
	$(MAKE) -C ZXCalculusForCAP clean-gen
	$(MAKE) -C LinearAlgebraForCAP clean-gen
	$(MAKE) -C FreydCategoriesForCAP clean-gen
	$(MAKE) -C ModulePresentationsForCAP clean-gen

test:
	$(MAKE) -C CAP test
	$(MAKE) -C MonoidalCategories test
	$(MAKE) -C CartesianCategories test
	$(MAKE) -C Toposes test
	$(MAKE) -C FinSetsForCAP test
	$(MAKE) -C ZXCalculusForCAP test
	$(MAKE) -C LinearAlgebraForCAP test
	$(MAKE) -C FreydCategoriesForCAP test
	$(MAKE) -C ModulePresentationsForCAP test
