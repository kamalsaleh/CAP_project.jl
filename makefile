install:
	julia -e 'using Pkg; Pkg.develop(path = "CAP");'
	julia -e 'using Pkg; Pkg.develop(path = "MonoidalCategories");'
	julia -e 'using Pkg; Pkg.develop(path = "CartesianCategories");'
	julia -e 'using Pkg; Pkg.develop(path = "Toposes");'
	julia -e 'using Pkg; Pkg.develop(path = "FinSetsForCAP");'
	julia -e 'using Pkg; Pkg.develop(path = "ZXCalculusForCAP");'
	julia -e 'using Pkg; Pkg.develop(path = "LinearAlgebraForCAP");'

gen:
	$(MAKE) -C CAP gen
	$(MAKE) -C MonoidalCategories gen
	$(MAKE) -C CartesianCategories gen
	$(MAKE) -C Toposes gen
	$(MAKE) -C FinSetsForCAP gen
	$(MAKE) -C ZXCalculusForCAP gen
	$(MAKE) -C LinearAlgebraForCAP gen

clean-gen:
	$(MAKE) -C CAP clean-gen
	$(MAKE) -C MonoidalCategories clean-gen
	$(MAKE) -C CartesianCategories clean-gen
	$(MAKE) -C Toposes clean-gen
	$(MAKE) -C FinSetsForCAP clean-gen
	$(MAKE) -C ZXCalculusForCAP clean-gen
	$(MAKE) -C LinearAlgebraForCAP clean-gen

test:
	$(MAKE) -C CAP test
	$(MAKE) -C MonoidalCategories test
	$(MAKE) -C CartesianCategories test
	$(MAKE) -C Toposes test
	$(MAKE) -C FinSetsForCAP test
	$(MAKE) -C ZXCalculusForCAP test
	$(MAKE) -C LinearAlgebraForCAP test
