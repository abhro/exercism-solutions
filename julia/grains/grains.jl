"""Calculate the number of grains on square `square`."""
function on_square(square)
    1 ≤ square ≤ 64|| throw(DomainError(square, "square must be within 1 and 64."))
    return big(2)^(square - 1)
end

"""Calculate the total number of grains after square `square`."""
total_after(square) = big(2)^square - 1
