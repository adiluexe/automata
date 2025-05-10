// filepath: d:\Development\automata\lib\sequences\sequence_utils.dart
String formatSequence(List<int> sequence) {
  return sequence.join(", ");
}

String formatCollatzSequence(List<int> sequence) {
  return sequence.join(" → ");
}
