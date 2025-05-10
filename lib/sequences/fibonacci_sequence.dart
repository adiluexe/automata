// filepath: d:\Development\automata\lib\sequences\fibonacci_sequence.dart
import 'sequence_utils.dart';

String generateFibonacci(int n) {
  if (n <= 0) return "Number of terms must be positive.";
  if (n > 40) return "For performance, n is limited to 40 for Fibonacci.";

  List<String> steps = [];
  steps.add("Generating Fibonacci Sequence for $n terms");

  int a = 0;
  int b = 1;
  steps.add("Starting with F(0) = 0, F(1) = 1");

  List<int> sequence = [];
  if (n >= 1) sequence.add(a);
  if (n >= 2) sequence.add(b);

  for (int i = 2; i < n; i++) {
    int next = a + b;
    sequence.add(next);
    a = b;
    b = next;
  }

  steps.add("First $n Fibonacci numbers:");
  steps.add(formatSequence(sequence));
  return steps.join("\n");
}
