using Test, Documenter, Locales

# test upto whitespaces
doctest(Locales; doctestfilters=[r"\s+" => ""])
