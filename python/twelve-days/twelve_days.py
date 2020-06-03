# -*- coding: utf-8 -*-

ORDINALS = ['zeroth', 'first', 'second', 'third', 'fourth', 'fifth', 'sixth',
            'seventh', 'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth']
RECEPTION = 'On the {nth} day of Christmas my true love gave to me: {presents}.'
GIFTS = [
    None,
    'a Partridge in a Pear Tree', 'two Turtle Doves',
    'three French Hens', 'four Calling Birds',
    'five Gold Rings', 'six Geese-a-Laying',
    'seven Swans-a-Swimming', 'eight Maids-a-Milking',
    'nine Ladies Dancing', 'ten Lords-a-Leaping',
    'eleven Pipers Piping', 'twelve Drummers Drumming'
]

def recite(start_verse: int, end_verse: int) -> list:
    """Recite the <opinion>annoying</opinion> twelve days of christmas carol.
    """

    if start_verse != end_verse: # follow the tests' example and recurse
        return [recite(n, n)[0] for n in range(start_verse, end_verse + 1)]

    return [RECEPTION.format(nth=ORDINALS[start_verse],
                             presents=_presents_phrase(GIFTS[start_verse:0:-1]))]

def _presents_phrase(items: list) -> str:
    "Return a presentable string on the presents for nth day"
    *items, last_item = items
    if not items:
        return last_item
    return ', '.join(items) + ', and ' + last_item
