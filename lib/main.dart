import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator | Assignment 7',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 212, 143, 40)),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

final TextEditingController firstNumControllerAdd = TextEditingController();
final TextEditingController secondNumControllerAdd = TextEditingController();
final TextEditingController firstNumControllerSub = TextEditingController();
final TextEditingController secondNumControllerSub = TextEditingController();
final TextEditingController firstNumControllerMult = TextEditingController();
final TextEditingController secondNumControllerMult = TextEditingController();
final TextEditingController firstNumControllerDiv = TextEditingController();
final TextEditingController secondNumControllerDiv = TextEditingController();

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the sum section
  num sum = 0;
  num difference = 0;
  num product = 0;
  num quotient = 0;

  // either use a TextEditingController for each input field to get the value
  TextEditingController add1Controller = TextEditingController();

  // or store each value in the state
  num firstAddNum = 0;
  num secondAddNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Simple Calculator | TABANAR",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Add Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "First Number"),
                  // update the firstAddNum state
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = double.parse(value);
                    });
                  },
                  controller: firstNumControllerAdd,
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = double.parse(value);
                    });
                  },
                  controller: secondNumControllerAdd,
                ),
              ),

              Text(
                ' = $sum',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              // 3.a Add an IconButton here
              IconButton(
                icon: const Icon(CupertinoIcons.add),
                onPressed: () {
                  setState(() {
                    sum = firstAddNum + secondAddNum;
                  });
                },
              ),
              ElevatedButton(
                child: const Text('Clear'),
                onPressed: () {
                  firstNumControllerAdd.clear();
                  secondNumControllerAdd.clear();
                  setState(() {
                    sum = 0;
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "First Number"),
                  // update the firstAddNum state
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = double.parse(value);
                    });
                  },
                  controller: firstNumControllerSub,
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = double.parse(value);
                    });
                  },
                  controller: secondNumControllerSub,
                ),
              ),
              Text(
                ' = $difference',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.minus),
                onPressed: () {
                  setState(() {
                    difference = firstAddNum - secondAddNum;
                  });
                },
              ),
              ElevatedButton(
                child: const Text('Clear'),
                onPressed: () {
                  firstNumControllerSub.clear();
                  secondNumControllerSub.clear();
                  setState(() {
                    difference = 0;
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = double.parse(value);
                    });
                  },
                  controller: firstNumControllerMult,
                ),
              ),
              const Text(" x "),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = double.parse(value);
                    });
                  },
                  controller: secondNumControllerMult,
                ),
              ),
              Text(
                ' = $product',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.multiply),
                onPressed: () {
                  setState(() {
                    product = firstAddNum * secondAddNum;
                  });
                },
              ),
              ElevatedButton(
                child: const Text('Clear'),
                onPressed: () {
                  setState(() {
                    product = 0;
                  });
                  firstNumControllerMult.clear();
                  secondNumControllerMult.clear();
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = double.parse(value);
                    });
                  },
                  controller: firstNumControllerDiv,
                ),
              ),
              const Text(" / "),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = double.parse(value);
                    });
                  },
                  controller: secondNumControllerDiv,
                ),
              ),
              Text(
                ' = ${quotient.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.divide),
                onPressed: () {
                  setState(() {
                    quotient = firstAddNum / secondAddNum;
                  });
                },
              ),
              ElevatedButton(
                child: const Text('Clear'),
                onPressed: () {
                  setState(() {
                    quotient = 0;
                  });
                  firstNumControllerDiv.clear();
                  secondNumControllerDiv.clear();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
