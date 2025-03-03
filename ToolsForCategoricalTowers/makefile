.PHONY: test

gen:
	gap_to_julia ToolsForCategoricalTowers

clean-gen:
	rm -f ./src/gap/*.autogen.jl
	rm -f ./src/gap/*/*.autogen.jl
	rm -f ./docs/src/*.autogen.md
	gap_to_julia ToolsForCategoricalTowers

test:
	julia -e 'using Pkg; Pkg.test("ToolsForCategoricalTowers");'
