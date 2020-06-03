"Single function module to test for isograms"

def is_isogram(string: str) -> bool:
    "Return if given `string` is an isogram"
    string = (c for c in string.lower() if c.isalpha()) # single-use
    encountered = set()
    for char in string:
        if char in encountered:
            return False
        encountered.add(char)
    return True
