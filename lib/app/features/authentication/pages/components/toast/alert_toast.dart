import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/toast/toast.dart';

class AlertToast extends StatelessWidget {
  final String label;
  const AlertToast({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Toast(
      label: label,
      color: Colors.amber,
    );
  }
}
