def raindrops(number: int) -> str:
    subs = ((3, 'Pling'), (5, 'Plang'), (7, 'Plong'))
    preformat = [plonger for divisor, plonger in subs if number % divisor == 0]
    if not preformat:
        return str(number)
    return ''.join(preformat)
