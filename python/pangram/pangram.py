
from string import ascii_lowercase


def is_pangram(s):
    s = s.lower()
    for letter in ascii_lowercase:
        if letter not in s:
            return False
    return True
