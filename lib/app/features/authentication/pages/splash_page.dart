import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/infrastructure/session_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SessionController sessionController = GetIt.I.get<SessionController>();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.pushReplacementNamed(context,
            sessionController.user != null ? '/account' : '/authentication'));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
