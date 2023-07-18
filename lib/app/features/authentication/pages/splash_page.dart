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

    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (sessionController.isOnboardingCompleted) {
        Navigator.pushReplacementNamed(context,
            sessionController.user != null ? '/account' : '/authentication');
      } else {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/ava_logo.png'),
          const SizedBox(
            height: 40,
          ),
          const CircularProgressIndicator(),
        ],
      )),
    );
  }
}
