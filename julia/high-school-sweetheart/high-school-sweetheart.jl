cleanupname(name) = replace(strip(name), r"(^-|-$)" => "", r"-" => " ")

firstletter(name) = cleanupname(name) |> first |> string

initial(name) = (uppercase ∘ firstletter)(name) * "."

couple(name1, name2) = "❤ $(initial(name1))  +  $(initial(name2)) ❤"
