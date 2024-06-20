import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function(String text) onClick;
  const CalculatorButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    const newHeight = .8;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(6.0),
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1 * newHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(10.0),
              ),
            ),
            onPressed: () => onClick(text),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.normal,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
