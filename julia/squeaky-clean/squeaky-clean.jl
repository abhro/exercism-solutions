function transform(ch)
    if ch == '-'
        return "_"
    elseif isspace(ch) || isdigit(ch)
        return ""
    elseif isuppercase(ch)
        return "-" * lowercase(ch)
    elseif 'α' ≤ ch ≤ 'ω'
        return "?"
    else
        return string(ch)
    end
end

clean(str) = map(transform, collect(str)) |> join
