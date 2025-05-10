import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Automata App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ).copyWith(background: Colors.grey[100]),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          ),
          hintStyle: const TextStyle(color: Colors.blue),
          labelStyle: const TextStyle(color: Colors.blue),
          iconColor: Colors.blue,
          prefixIconColor: Colors.blue,
          suffixIconColor: Colors.blue,
        ),
        cardTheme: CardTheme(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(color: Colors.blue.shade200, width: 1.0),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      home: const AutomataHomePage(),
    );
  }
}

enum SequenceType { fibonacci, lucas, tribonacci, collatz, euclidean }

class AutomataHomePage extends StatefulWidget {
  const AutomataHomePage({super.key});

  @override
  State<AutomataHomePage> createState() => _AutomataHomePageState();
}

class _AutomataHomePageState extends State<AutomataHomePage> {
  SequenceType _selectedSequence = SequenceType.fibonacci;
  final TextEditingController _numberInputController = TextEditingController();
  final TextEditingController _secondNumberInputController =
      TextEditingController();

  bool _showSecondInput = false;
  String _sequenceTitle = "Fibonacci Sequence";
  String _resultText = "";
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _updateSequenceDetails(_selectedSequence);
  }

  void _updateSequenceDetails(SequenceType? sequenceType) {
    if (sequenceType == null) return;
    setState(() {
      _selectedSequence = sequenceType;
      _resultText = ""; // Clear previous results
      switch (sequenceType) {
        case SequenceType.fibonacci:
          _sequenceTitle = "Fibonacci Sequence";
          _showSecondInput = false;
          break;
        case SequenceType.lucas:
          _sequenceTitle = "Lucas Numbers";
          _showSecondInput = false;
          break;
        case SequenceType.tribonacci:
          _sequenceTitle = "Tribonacci Sequence";
          _showSecondInput = false;
          break;
        case SequenceType.collatz:
          _sequenceTitle = "Collatz Sequence";
          _showSecondInput = false;
          break;
        case SequenceType.euclidean:
          _sequenceTitle = "Euclidean Algorithm";
          _showSecondInput = true;
          break;
      }
    });
  }

  void _generateSequence() {
    // Logic to be implemented
    final String input1 = _numberInputController.text.trim();
    final String input2 = _secondNumberInputController.text.trim();

    if (input1.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter the first number.")),
      );
      return;
    }

    int? n1 = int.tryParse(input1);
    if (n1 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid format for the first number.")),
      );
      return;
    }

    int? n2;
    if (_showSecondInput) {
      if (input2.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter the second number.")),
        );
        return;
      }
      n2 = int.tryParse(input2);
      if (n2 == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid format for the second number."),
          ),
        );
        return;
      }
    }

    setState(() {
      _isLoading = true;
      _resultText = "";
    });

    // Simulate background work
    Future.delayed(const Duration(seconds: 1), () {
      String result = "";
      switch (_selectedSequence) {
        case SequenceType.fibonacci:
          result = _generateFibonacci(n1);
          break;
        // Other cases will be added later
        default:
          result = "Algorithm not yet implemented for $_sequenceTitle.";
      }
      setState(() {
        _resultText = result;
        _isLoading = false;
      });
    });
  }

  String _generateFibonacci(int n) {
    if (n <= 0) return "Number of terms must be positive.";
    if (n > 40)
      return "For performance, n is limited to 40 for Fibonacci."; // Limit for simplicity
    List<String> steps = [];
    steps.add("Generating Fibonacci Sequence for $n terms");

    int a = 0, b = 1;
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
    steps.add("\nFirst $n Fibonacci numbers:");
    steps.add(_formatSequence(sequence));
    return steps.join("\\n");
  }

  String _formatSequence(List<int> sequence) {
    return sequence.join(", ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_sequenceTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Header Card (Simplified)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.blue.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Automata Explorer",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Select an algorithm and generate sequences",
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Input Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Select a sequence",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(width: 40, height: 3, color: Colors.blue),
                    const SizedBox(height: 16),
                    _buildRadioOption(
                      SequenceType.fibonacci,
                      "Fibonacci Sequence",
                    ),
                    _buildRadioOption(SequenceType.lucas, "Lucas Numbers"),
                    _buildRadioOption(
                      SequenceType.tribonacci,
                      "Tribonacci Sequence",
                    ),
                    _buildRadioOption(SequenceType.collatz, "Collatz Sequence"),
                    _buildRadioOption(
                      SequenceType.euclidean,
                      "Euclidean Algorithm",
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _numberInputController,
                      decoration: InputDecoration(
                        labelText:
                            _showSecondInput
                                ? "First number (a)"
                                : "Number of terms",
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.format_list_numbered),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    if (_showSecondInput) ...[
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _secondNumberInputController,
                        decoration: const InputDecoration(
                          labelText: "Second number (b)",
                          border: OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.format_list_numbered_rtl,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _generateSequence,
                        child:
                            _isLoading
                                ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                                : const Text("Generate"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Result Card
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_resultText.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _sequenceTitle + " Result",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(width: 30, height: 2, color: Colors.blue),
                      const SizedBox(height: 12),
                      SelectableText(
                        _resultText.replaceAll(
                          "\\\\n",
                          "\\n",
                        ), // Ensure newlines are rendered
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(SequenceType type, String title) {
    return RadioListTile<SequenceType>(
      title: Text(title),
      value: type,
      groupValue: _selectedSequence,
      onChanged: (SequenceType? value) {
        if (value != null) {
          _updateSequenceDetails(value);
        }
      },
      activeColor: Colors.blue,
      contentPadding: EdgeInsets.zero,
    );
  }

  @override
  void dispose() {
    _numberInputController.dispose();
    _secondNumberInputController.dispose();
    super.dispose();
  }
}
