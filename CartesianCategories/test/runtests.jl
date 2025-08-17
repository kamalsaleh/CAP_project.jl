using Test, Documenter, CartesianCategories

# test upto whitespaces
doctest(CartesianCategories; doctestfilters=[r"\s+" => ""])
