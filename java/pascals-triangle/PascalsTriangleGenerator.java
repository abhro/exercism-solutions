public class PascalsTriangleGenerator {
    public static int[][] generateTriangle(int levels) {
        int[][] triangle = new int[levels][];

        int[] row;
        for (int i = 0; i < levels; i++) {      // iterate over rows
            row = triangle[i] = new int[i+1];
            row[0] = row[i] = 1;

            if (i == 0) {
                continue;
            }

            for (int j = 1; j < i; j++) {       // iterate over middle columns
                row[j] = triangle[i-1][j-1] + triangle[i-1][j];
            }
        }

        return triangle;
    }
}
