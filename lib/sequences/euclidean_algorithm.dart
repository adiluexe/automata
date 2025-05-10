// filepath: d:\Development\automata\lib\sequences\euclidean_algorithm.dart

String generateEuclidean(int a, int b) {
  if (a <= 0 || b <= 0)
    return "Both numbers must be positive for Euclidean Algorithm.";

  List<String> steps = [];
  steps.add("Finding GCD of $a and $b using Euclidean Algorithm");

  int num1 = a.abs(); // Ensure positive
  int num2 = b.abs(); // Ensure positive

  if (num1 < num2) {
    // Ensure num1 is the larger number
    int temp = num1;
    num1 = num2;
    num2 = temp;
    steps.add("Swapped numbers to have larger first: a = $num1, b = $num2");
  }

  steps.add("Initial values: a = $num1, b = $num2");

  while (num2 != 0) {
    int remainder = num1 % num2;
    steps.add("$num1 = $num2 * ${num1 ~/ num2} + $remainder");
    num1 = num2;
    num2 = remainder;
  }

  steps.add("\nThe GCD is $num1");
  return steps.join("\n");
}
