def append(list1, list2):
    return list1 + list2


def concat(lists):
    sum = []
    for list in lists:
        sum.extend(list)
    return sum


def filter(function, list):
    return [element for element in list if function(element)]


def length(list):
    return list.__len__() # ???? NOTE ?? I'm not sure how else to implement ???


def map(function, list):
    return [function(element) for element in list]


def foldl(function, list, initial):
    for element in list:
        initial = function(initial, element)
    return initial


def foldr(function, list, initial):
    for element in list[::-1]:
        initial = function(element, initial)
    return initial


def reverse(list):
    return list[::-1]
