.PHONY: test

gen:
	gap_to_julia ModulePresentationsForCAP

clean-gen:
	rm -f ./src/gap/*.autogen.jl
	rm -f ./src/gap/*/*.autogen.jl
	rm -f ./docs/src/*.autogen.md
	gap_to_julia ModulePresentationsForCAP

test:
	julia -e 'using Pkg; Pkg.test("ModulePresentationsForCAP");'
