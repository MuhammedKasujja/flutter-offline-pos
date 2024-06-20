import 'package:flutter/material.dart';

import 'calculator/calculator_button.dart';

class CalculatorWidget extends StatefulWidget {
  final String? pendingAmount;

  const CalculatorWidget({Key? key, this.pendingAmount}) : super(key: key);
  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  final double _maxTopup = 1000000;

  buttonPressed(String buttonText) {
    if (buttonText != "⌫" && _maxTopup <= double.parse(equation)) {
      return;
    }
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
    String buttonText,
  ) {
    return CalculatorButton(
      text: buttonText,
      onClick: buttonPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                // "${state.data!.currency} $equation",
                ' $equation',
                style: TextStyle(
                  fontSize: equationFontSize,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Flexible(child: buildButton("7")),
                Flexible(
                  child: buildButton("8"),
                ),
                Flexible(
                  child: buildButton("9"),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                buildButton("."),
                buildButton("0"),
                buildButton("⌫"),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
