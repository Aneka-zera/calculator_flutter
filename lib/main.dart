import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CalculatorScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 300, // Increased width
          padding: const EdgeInsets.all(16.0), // Adjusted padding for a little more spacing
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Display section
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '1,984', // Displayed number
                  style: TextStyle(
                    fontSize: 50, // Increased font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Buttons section
              Column(
                children: [
                  buildButtonRow(['C', '+/-', '%', '÷'], [Colors.grey, Colors.grey, Colors.grey, Colors.orange]),
                  buildButtonRow(['7', '8', '9', '×'], [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange]),
                  buildButtonRow(['4', '5', '6', '−'], [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange]),
                  buildButtonRow(['1', '2', '3', '+'], [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange]),
                  buildButtonRow(['0', '.', '='], [Colors.grey[850]!, Colors.grey[850]!, Colors.orange], isLastRow: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> labels, List<Color> colors, {bool isLastRow = false}) {
    return Row(
      children: labels.map((label) {
        return Expanded(
          flex: label == '0' && isLastRow ? 2 : 1, // The '0' button is wider
          child: Padding(
            padding: const EdgeInsets.all(4.0), // Slightly increased padding for buttons
            child: Container(
              height: 60, // Increased button height
              decoration: BoxDecoration(
                color: colors[labels.indexOf(label)],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25), // Adjusted border radius
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 20, // Increased font size for buttons
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
