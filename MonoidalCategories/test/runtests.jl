using Test, Documenter, MonoidalCategories

# test upto whitespaces
doctest(MonoidalCategories; doctestfilters=[r"\s+" => ""])
