
import 'package:flutter/material.dart';

void main() {
  runApp(PrankCalculatorApp());
}

class PrankCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prank Calculator',
      theme: ThemeData.dark(),
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '';

  void append(String value) {
    setState(() {
      display += value;
    });
  }

  void clear() {
    setState(() {
      display = '';
    });
  }

  void prankResult() {
    setState(() {
      display = 'Hello';
    });
  }

  Widget buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(70, 70),
        backgroundColor: Colors.grey[850],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(text, style: TextStyle(fontSize: 22)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonList = [
      ['7', '8', '9', '/'],
      ['4', '5', '6', '*'],
      ['1', '2', '3', '-'],
      ['0', '.', '=', '+'],
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  display,
                  style: TextStyle(fontSize: 40, color: Colors.greenAccent),
                  maxLines: 2,
                ),
              ),
            ),
            SizedBox(height: 20),
            for (var row in buttonList)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: row.map((text) {
                  if (text == '=') {
                    return buildButton(text, prankResult);
                  } else {
                    return buildButton(text, () => append(text));
                  }
                }).toList(),
              ),
            SizedBox(height: 10),
            buildButton('Clear', clear),
          ],
        ),
      ),
    );
  }
}
