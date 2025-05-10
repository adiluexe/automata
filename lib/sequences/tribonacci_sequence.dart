// filepath: d:\Development\automata\lib\sequences\tribonacci_sequence.dart
import 'sequence_utils.dart';

String generateTribonacci(int n) {
  if (n <= 0) return "Number of terms must be positive.";
  if (n > 30)
    return "For performance, n is limited to 30 for Tribonacci."; // Tribonacci numbers grow even faster

  List<String> steps = [];
  steps.add("Generating Tribonacci Sequence for $n terms");

  int a = 0, b = 0, c = 1; // Common starting point T(0)=0, T(1)=0, T(2)=1
  // Another variant starts T(0)=0, T(1)=1, T(2)=1
  // Or T(1)=1, T(2)=1, T(3)=2
  // We'll use T(0)=0, T(1)=0, T(2)=1 for this example.
  steps.add("Starting with T(0) = 0, T(1) = 0, T(2) = 1");

  List<int> sequence = [];
  if (n >= 1) sequence.add(a);
  if (n >= 2) sequence.add(b);
  if (n >= 3) sequence.add(c);

  for (int i = 3; i < n; i++) {
    int next = a + b + c;
    sequence.add(next);
    a = b;
    b = c;
    c = next;
  }

  steps.add("First $n Tribonacci numbers:");
  steps.add(formatSequence(sequence));
  return steps.join("\n");
}
