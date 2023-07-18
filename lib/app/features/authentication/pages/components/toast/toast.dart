import 'package:flutter/material.dart';

class Toast extends StatelessWidget {
  final String label;
  final Color color;
  const Toast({Key? key, required this.label, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color, width: 1),
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
