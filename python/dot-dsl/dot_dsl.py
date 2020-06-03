"Implement abstract syntax tree of language whose syntax hasn't been decided"

NODE, EDGE, ATTR = range(3)


class Node:
    def __init__(self, name, attrs={}):
        self.name = name
        self.attrs = attrs

    def __eq__(self, other):
        return self.name == other.name and self.attrs == other.attrs


class Edge:
    def __init__(self, src, dst, attrs={}):
        self.src = src
        self.dst = dst
        self.attrs = attrs

    def __eq__(self, other):
        return (self.src == other.src and
                self.dst == other.dst and
                self.attrs == other.attrs)


class Graph:
    def __init__(self, data: list = None):
        # data described as
        # (DATA_TYPE, arguments_to_constructor)
        self.nodes = []
        self.edges = []
        self.attrs = {}

        if data is None:
            return
        if not isinstance(data, (tuple, list)):
            raise TypeError(
                f"expected data to be a sequence container, got {type(data)}")

        self.decode(data)

    def decode(self, data: list):
        "Destructure and populate internal node, edge, and attribute containers"
        for tup in data:
            if not tup:
                raise TypeError('cannot decode empty structure')
            dtype, *args = tup

            if dtype == NODE:
                self.add_node(*args)
            elif dtype == EDGE:
                self.add_edge(*args)
            elif dtype == ATTR:
                if len(args) > 2:
                    raise ValueError('too many arguments for ATTR')
                self.add_node_attr(*args)
            else:
                raise ValueError(f'bad dtype: {dtype}')

    def add_node(self, *args):
        if len(args) != 2:
            raise ValueError(
                f'bad argument count for NODE, expected 2, got {len(args)}')
        self.nodes.append(Node(*args)) # pylint: disable=no-value-for-parameter

    def add_edge(self, *args):
        if len(args) != 3:
            raise ValueError(
                f'bad argument count for EDGE, expected 3, got {len(args)}')
        self.edges.append(Edge(*args)) # pylint: disable=no-value-for-parameter

    def add_node_attr(self, name, value):
        self.attrs[name] = value
