function square_root(n)
    # Special cases that are too simple
    if iszero(n) || isone(n)
        return n
    end
    # Use Babylonian method
    a = n ÷ 2   # Initial guess
    b = one(n)
    while a != b
        a = (a + b) ÷ 2
        b = n ÷ a
    end
    return a
end
