
TRANSLATION_TABLE = {ord('C'): 'G', ord('G'): 'C', ord('T'): 'A', ord('A'): 'U'}

def to_rna(strand):
    return strand.translate(TRANSLATION_TABLE)
