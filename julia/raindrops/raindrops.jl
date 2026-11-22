function raindrops(number)
    message = ""
    if number % 3 == 0
        message *= "Pling"
    end
    if number % 5 == 0
        message *= "Plang"
    end
    if number % 7 == 0
        message *= "Plong"
    end
    return isempty(message) ? string(number) : message
end
