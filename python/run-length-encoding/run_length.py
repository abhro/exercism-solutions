
import re

def encode(s: str) -> str:
    seq = []
    current = s[0]
    count = 0
    for character in s:
        if character == current:
            count += 1
        else:
            seq.append(str(count))
            seq.append(current)
            current = character
            count = 1
    seq.append(str(count))
    seq.append(current)

    seq = [elem for elem in seq if elem != '1']

    return ''.join(seq)


def decode(s: str) -> str:
    seq = re.split(r'(\d+)', s)
    if '' in seq:
        seq.remove('')
    seq = [int(elem) if elem.isdigit() else elem for elem in seq]
    seq_2 = []
    for elem in seq:
        if isinstance(elem, int):
            seq_2.append(elem)
        elif isinstance(elem, str):
            seq_2.extend(list(elem))
    seq = seq_2
    del seq_2

    decoded_seq = []
    for index, token in enumerate(seq):
        if isinstance(token, int):
            decoded_seq.append(token * seq[index+1])
        elif index == 0 or (index != 0 and not isinstance(seq[index-1], int)):
            decoded_seq.append(token)
    return ''.join(decoded_seq)
