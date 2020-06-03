
import re
from collections import Counter

def word_count(sentence):
    words = re.split(r'[\W_]+', sentence.lower())
    if '' in words:
        words.remove('')
    return dict(Counter(words))
