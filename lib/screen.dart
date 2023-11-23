import 'package:flutter/material.dart';
import 'package:momo_calculator/button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = '';
  String operator = '';
  double operand = 0.0;
  bool operandConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).shadowColor,
      body: Column(
        children: [
          Text(
            output.isNotEmpty ? output : '0',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.black,
                text: 'AC',
                onTap: clearHandler,
              ),
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.black,
                text: '+/-',
                onTap: () {
                  signalHandler();
                },
              ),
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.black,
                text: '%',
                onTap: () {
                  operatorHandler('%');
                },
              ),
              CalculatorButton(
                color: Colors.orange,
                textColor: Colors.white,
                text: '/',
                onTap: () {
                  operatorHandler('/');
                },
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.white,
                text: '7',
                onTap: () {
                  numberHandler('7');
                },
              ),
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.white,
                text: '8',
                onTap: () {
                  numberHandler('8');
                },
              ),
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.white,
                text: '9',
                onTap: () {
                  numberHandler('9');
                },
              ),
              CalculatorButton(
                color: Colors.orange,
                textColor: Colors.white,
                text: 'X',
                onTap: () {
                  operatorHandler('x');
                },
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.white,
                text: '4',
                onTap: () {
                  numberHandler('4');
                },
              ),
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.white,
                text: '5',
                onTap: () {
                  numberHandler('5');
                },
              ),
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.white,
                text: '6',
                onTap: () {
                  numberHandler('6');
                },
              ),
              CalculatorButton(
                color: Colors.orange,
                textColor: Colors.white,
                text: '-',
                onTap: () {
                  operatorHandler('-');
                },
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.white,
                text: '1',
                onTap: () {
                  numberHandler('1');
                },
              ),
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.white,
                text: '2',
                onTap: () {
                  numberHandler('2');
                },
              ),
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.white,
                text: '3',
                onTap: () {
                  numberHandler('3');
                },
              ),
              CalculatorButton(
                color: Colors.orange,
                textColor: Colors.white,
                text: '+',
                onTap: () {
                  operatorHandler('+');
                },
              ),
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.white,
                text: '0',
                onTap: () {
                  numberHandler('0');
                },
              ),
              CalculatorButton(
                color: Colors.grey,
                textColor: Colors.white,
                text: '.',
                onTap: () {
                  dotHandler();
                },
              ),
              CalculatorButton(
                color: Colors.orange,
                textColor: Colors.white,
                text: '=',
                onTap: () {
                  equalHandler();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void equalHandler() {
    if (operator.isNotEmpty && output.isNotEmpty) {
      setState(() {
        output = makeOperation();
      });
    }
  }

  void numberHandler(String buttonInput) {
    if (operandConfirmed) {
      setState(() {
        output = buttonInput;
      });
      operandConfirmed = false;
    } else {
      setState(() {
        output += buttonInput;
      });
    }
  }

  void operatorHandler(String operatorInput) {
    operand = double.tryParse(output) ?? 0.0;
    if (operatorInput == '%') {
      if (operand == 0.0) return;
      setState(() {
        output = '${operand / 100}';
      });
    } else {
      operator = operatorInput;
      operandConfirmed = true;
    }
  }

  void clearHandler() {
    setState(() {
      output = '';
    });
  }

  void dotHandler() {
    if (output.contains('.')) return;
    setState(() {
      output += '.';
    });
  }

  void signalHandler() {
    setState(() {
      output = '${(double.tryParse(output) ?? 0.0) * -1}';
    });
  }

  String makeOperation() {
    double secondOperand = double.tryParse(output) ?? 0.0;
    if (operator == '+') {
      return '${operand + secondOperand}';
    } else if (operator == '-') {
      return '${operand - secondOperand}';
    } else if (operator == '/') {
      return '${operand / secondOperand}';
    } else {
      return '${operand * secondOperand}';
    }
  }
}
