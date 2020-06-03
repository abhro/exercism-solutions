import re

class SgfTree:
    def __init__(self, properties: dict = None, children: list = None):
        self.properties = properties or {}
        self.children = children or []

    def __eq__(self, other: SgfTree) -> bool:
        return ( # all criteria joined by `and`, relying on mccarthy evaluation
            isinstance(other, SgfTree) and

            all(k in other.properties and other.properties[k] == v
                for k, v in self.properties.items()) and
            all(k in self.properties for k in other.properties) and

            len(self.children) == len(other.children) and
            all(a == b for a, b in zip(self.children, other.children))
        )

    def __ne__(self, other: SgfTree) -> bool:
        return not self == other


SGF_SYNTAX = re.compile(r'\((;(?P<key>\w)[(?P<value>)])+\)')
def parse(input_string: str) -> SgfTree:
    return input_string
