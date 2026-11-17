function encode(input)
    clean_input = filter(c -> isletter(c) || isdigit(c), input)
    ciphertext = join(encode.(collect(clean_input)))
    return join(collect(Iterators.partition(ciphertext, 5)), " ")
end

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

decode(input) = join(encode.(collect(filter(!isspace, input))))
