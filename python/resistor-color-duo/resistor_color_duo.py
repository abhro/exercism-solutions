_COLORS = ['black', 'brown', 'red', 'orange', 'yellow',
           'green', 'blue', 'violet', 'grey', 'white']

def value(colors: [str, str]) -> str:
    return _COLORS.index(colors[0]) * 10 + _COLORS.index(colors[1])
