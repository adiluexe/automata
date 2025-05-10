// filepath: d:\Development\automata\lib\sequences\collatz_sequence.dart
import 'sequence_utils.dart';

String generateCollatz(int n) {
  if (n <= 0) return "Starting number must be positive.";
  if (n > 1000000)
    return "For performance, n is limited to 1,000,000 for Collatz.";

  List<String> steps = [];
  steps.add("Generating Collatz Sequence for n = $n");

  List<int> sequence = [];
  int current = n;
  sequence.add(current);
  steps.add("Initial value: $current");

  int iteration = 0;
  while (current != 1 && iteration < 500) {
    // Add iteration limit to prevent infinite loops for very large numbers or unexpected behavior
    String stepDetail;
    if (current % 2 == 0) {
      current = current ~/ 2; // Integer division
      stepDetail = "$current (even, divide by 2)";
    } else {
      current = 3 * current + 1;
      stepDetail = "$current (odd, multiply by 3 and add 1)";
    }
    sequence.add(current);
    steps.add("Next value: $stepDetail");
    iteration++;
  }

  if (current != 1) {
    steps.add(
      "Sequence did not reach 1 within $iteration iterations. Showing partial sequence.",
    );
  } else {
    steps.add("Sequence reached 1.");
  }

  steps.add("Collatz sequence:");
  steps.add(formatCollatzSequence(sequence));
  return steps.join("\n");
}
