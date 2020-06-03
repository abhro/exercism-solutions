import java.util.StringTokenizer;
import java.util.Arrays;
import java.util.ArrayList;

class Matrix {

    private int[][] matrix;

    Matrix(String matrixAsString) {
        String[] rowStrs = matrixAsString.split("\n");
        matrix = new int[rowStrs.length][];
        int rowCount = 0;
        for (int row = 0; row < rowStrs.length; row++) {
            StringTokenizer tokenizer = new StringTokenizer(rowStrs[row]);
            int totalCols = tokenizer.countTokens();
            matrix[row] = new int[totalCols];
            for (int col = 0; col < totalCols; col++) {
                matrix[row][col] = Integer.parseInt(tokenizer.nextToken());
            }
        }
    }

    int[] getRow(int rowNumber) {
        return Arrays.copyOf(matrix[rowNumber - 1], matrix[rowNumber - 1].length);
    }

    int[] getColumn(int columnNumber) {
        ArrayList<Integer> columnList = new ArrayList<>();
        for (int[] row : matrix) {
            columnList.add(row[columnNumber - 1]);
        }
        Integer[] objectColumn = new Integer[columnList.size()];
        columnList.toArray(objectColumn);
        int[] column = new int[objectColumn.length];
        Arrays.setAll(column, columnList::get);
        return column;
    }
}
