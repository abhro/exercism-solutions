import re

IGNORE_PATTERN = re.compile("['_]")
SPLIT_PATTERN = re.compile(r'[-\s]')

def abbreviate(words: str) -> str:
    words = re.sub(IGNORE_PATTERN, '', words)
    wordlist = re.split(SPLIT_PATTERN, words)
    return ''.join(word[0].upper() for word in wordlist if word)
