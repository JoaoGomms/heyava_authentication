import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double height;
  const AppElevatedButton(
      {Key? key, required this.onPressed, required this.text, this.height = 48})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: SizedBox(
          height: height,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(text),
          )),
    );
  }
}
