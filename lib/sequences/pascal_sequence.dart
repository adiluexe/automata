String generatePascalTriangle(int n) {
  if (n <= 0) return "Number of rows must be positive.";
  if (n > 20)
    return "For performance, n is limited to 20 rows for Pascal's Triangle."; // Limit for display and performance

  List<String> steps = [];
  steps.add("Generating Pascal's Triangle for $n rows");

  List<List<int>> triangle = [];

  for (int i = 0; i < n; i++) {
    List<int> currentRow = [];
    for (int j = 0; j <= i; j++) {
      if (j == 0 || j == i) {
        currentRow.add(1);
      } else {
        // Sum of the two numbers directly above in the previous row
        currentRow.add(triangle[i - 1][j - 1] + triangle[i - 1][j]);
      }
    }
    triangle.add(currentRow);
    steps.add("Row ${i + 1}: ${currentRow.join(' ')}");
  }

  steps.add("\nPascal's Triangle ($n rows):");
  for (List<int> row in triangle) {
    // Add padding to center rows for better visual representation (approximate)
    // This can be improved with more sophisticated formatting if needed.
    int totalWidth = (triangle.last.join(' ').length);
    String rowString = row.join(' ');
    int padding = (totalWidth - rowString.length) ~/ 2;
    steps.add(' ' * padding + rowString);
  }

  return steps.join("\n");
}
