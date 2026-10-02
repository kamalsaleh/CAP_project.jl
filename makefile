install:
	julia -e 'using Pkg; \
		Pkg.develop(path = "CAP"); \
		Pkg.develop(path = "MonoidalCategories"); \
		Pkg.develop(path = "CartesianCategories"); \
		Pkg.develop(path = "Toposes"); \
		Pkg.develop(path = "FinSetsForCAP"); \
		Pkg.develop(path = "ZXCalculusForCAP"); \
		Pkg.develop(path = "LinearAlgebraForCAP"); \
		Pkg.develop(path = "AdditiveClosuresForCAP"); \
		Pkg.develop(path = "LinearClosuresForCAP"); \
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
	$(MAKE) -C AdditiveClosuresForCAP gen
	$(MAKE) -C LinearClosuresForCAP gen
	$(MAKE) -C FreydCategoriesForCAP gen
	$(MAKE) -C ModulePresentationsForCAP gen
	$(MAKE) generate-root

gen-full:
	$(MAKE) -C CAP gen-full
	$(MAKE) -C MonoidalCategories gen-full
	$(MAKE) -C CartesianCategories gen-full
	$(MAKE) -C Toposes gen-full
	$(MAKE) -C FinSetsForCAP gen-full
	$(MAKE) -C ZXCalculusForCAP gen-full
	$(MAKE) -C LinearAlgebraForCAP gen-full
	$(MAKE) -C AdditiveClosuresForCAP gen-full
	$(MAKE) -C LinearClosuresForCAP gen-full
	$(MAKE) -C FreydCategoriesForCAP gen-full
	$(MAKE) -C ModulePresentationsForCAP gen-full
	$(MAKE) generate-root

generate-root:
	ansible-playbook -i $$HOME/.gap/PackageJanitor/gap_to_julia/hosts $$HOME/.gap/PackageJanitor/gap_to_julia/site.yml -l CAP_project_root --diff

test:
	$(MAKE) -C CAP test
	$(MAKE) -C MonoidalCategories test
	$(MAKE) -C CartesianCategories test
	$(MAKE) -C Toposes test
	$(MAKE) -C FinSetsForCAP test
	$(MAKE) -C ZXCalculusForCAP test
	$(MAKE) -C LinearAlgebraForCAP test
	$(MAKE) -C AdditiveClosuresForCAP test
	$(MAKE) -C LinearClosuresForCAP test
	$(MAKE) -C FreydCategoriesForCAP test
	$(MAKE) -C ModulePresentationsForCAP test

git-commit:
	$(MAKE) -C CAP git-commit
	$(MAKE) -C MonoidalCategories git-commit
	$(MAKE) -C CartesianCategories git-commit
	$(MAKE) -C Toposes git-commit
	$(MAKE) -C FinSetsForCAP git-commit
	$(MAKE) -C ZXCalculusForCAP git-commit
	$(MAKE) -C LinearAlgebraForCAP git-commit
	$(MAKE) -C AdditiveClosuresForCAP git-commit
	$(MAKE) -C LinearClosuresForCAP git-commit
	$(MAKE) -C FreydCategoriesForCAP git-commit
	$(MAKE) -C ModulePresentationsForCAP git-commit

update-subsplits:
	./dev/manually_update_subsplits.sh
