function collatz_steps(n)
    n > 0 || throw(DomainError(n, "n must be positive"))
    steps = 0
    while n > 1
        n = iszero(n % 2) ? n ÷ 2 : 3n + 1
        steps += 1
    end
    return steps
end
