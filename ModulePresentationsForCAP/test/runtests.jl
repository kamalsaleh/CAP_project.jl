using Test, Documenter, ModulePresentationsForCAP

# test upto whitespaces
doctest(ModulePresentationsForCAP; doctestfilters=[r"\s+" => ""])
