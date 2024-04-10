all_15(ratings) = all(x -> x == 1 || x == 5, ratings)

emphatics(customers) = filter(p -> all_15(p.second), customers)

tobinary(ratings) = map(x -> x ÷ 5, ratings)

tobinarymatrix(ratings) = reduce(hcat, tobinary.(ratings))'
