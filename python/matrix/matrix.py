
class Matrix(object):
    "Basic matrix implementation"

    def __init__(self, matrix_string):
        rows = matrix_string.split('\n')
        self.data = [[int(n) for n in row.split()] for row in rows]

    def row(self, index):
        return self.data[index-1].copy()

    def column(self, index):
        return [row[index-1] for row in self.data] # build from individual cells
