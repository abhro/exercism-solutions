def difference_of_squares(n: int) -> int:
    'Return (1 + 2 + ... + n)² - (1² + 2² + ... + n²)'
    return square_of_sum(n) - sum_of_squares(n)

def square_of_sum(n: int) -> int:
    'Return (1 + 2 + ... + n)²'
    return (n*(n + 1) // 2) ** 2

def sum_of_squares(n: int) -> int:
    'Return (1² + 2² + ... + n²)'
    return sum(x*x for x in range(1, n+1))
