# -*- encoding: utf-8 -*-

def hey(what):
    what = what.strip()
    if what.isupper():
        return 'Whoa, chill out!'
    if what.endswith('?'):
        return 'Sure.'
    if not what:
        return 'Fine. Be that way!'

    return 'Whatever.'
