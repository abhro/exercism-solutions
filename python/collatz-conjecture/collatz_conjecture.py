def steps(number: int) -> int:
    if number <= 0:
        raise ValueError('only natural numbers accepted')

    step_count = 0

    while number != 1:
        number = number / 2 if number % 2 == 0 else 3*number + 1
        step_count += 1

    return step_count
