encode(input) = join(encode.(filter(c -> isletter(c) || isdigit(c), collect(input))))

function encode(input::AbstractChar)
    if isletter(input)
        if islowercase(input)
            return 'a' + 25 - (input - 'a')
        else
            return 'a' + 25 - (input - 'A')
        end
    else
        return input
    end
end

decode(input) = join(encode.(collect(replace(input, r"\s" => ""))))
