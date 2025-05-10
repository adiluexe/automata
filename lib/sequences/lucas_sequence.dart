// filepath: d:\Development\automata\lib\sequences\lucas_sequence.dart
import 'sequence_utils.dart';

String generateLucas(int n) {
  if (n <= 0) return "Number of terms must be positive.";
  if (n > 35)
    return "For performance, n is limited to 35 for Lucas Numbers."; // Lucas numbers grow faster

  List<String> steps = [];
  steps.add("Generating Lucas Numbers for $n terms");

  int a = 2;
  int b = 1;
  steps.add("Starting with L(0) = 2, L(1) = 1");

  List<int> sequence = [];
  if (n >= 1) sequence.add(a);
  if (n >= 2) sequence.add(b);

  for (int i = 2; i < n; i++) {
    int next = a + b;
    sequence.add(next);
    a = b;
    b = next;
  }

  steps.add("First $n Lucas numbers:");
  steps.add(formatSequence(sequence));
  return steps.join("\n");
}
