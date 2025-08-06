using Test, Documenter, FinSetsForCAP

# test upto whitespaces
doctest(FinSetsForCAP; doctestfilters=[r"\s+" => ""])
