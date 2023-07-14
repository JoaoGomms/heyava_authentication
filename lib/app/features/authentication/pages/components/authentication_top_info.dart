import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/assets/texts/authentication_texts.dart';

class AuthenticationTopInfo extends StatefulWidget {
  const AuthenticationTopInfo({Key? key}) : super(key: key);

  @override
  _AuthenticationTopInfoState createState() => _AuthenticationTopInfoState();
}

class _AuthenticationTopInfoState extends State<AuthenticationTopInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          SizedBox(
              height: 24, child: Image.asset('assets/images/ava_logo.png')),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 12),
            child: Text(
              AuthenticationTexts.slogan,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Text(AuthenticationTexts.subtitle,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
