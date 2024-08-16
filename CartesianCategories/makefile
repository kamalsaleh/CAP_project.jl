.PHONY: test

gen:
	gap_to_julia CartesianCategories

clean-gen:
	rm -f ./src/gap/**/*.autogen.jl
	rm -f ./docs/src/**/*.autogen.md
	gap_to_julia CartesianCategories

test:
	julia -e 'using Pkg; Pkg.test("CartesianCategories");'
