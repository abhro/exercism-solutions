"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).
"""
ispangram(input) = all(in(Set(lowercase(input))), 'a':'z')
