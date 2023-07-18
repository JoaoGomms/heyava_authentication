import 'package:flutter/material.dart';

class ErrorToast extends StatelessWidget {
  final String label;
  const ErrorToast({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.red, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
