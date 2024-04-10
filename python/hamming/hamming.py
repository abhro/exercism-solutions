
def distance(str1: str, str2: str) -> int:
    """Determine Hamming distance between str1 and str2"""
    assert len(str1) == len(str2)
    return sum(c1 != c2 for c1, c2 in zip(str1, str2))
