import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/features/authentication/pages/address_page.dart';
import 'package:heyava_authentication/app/features/authentication/pages/authentication_page.dart';
import 'package:heyava_authentication/app/theme/theme.dart';

import 'features/authentication/pages/account_page.dart';
import 'features/authentication/pages/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/authentication': (context) => const AuthenticationPage(),
        '/account': (context) => const AccountPage(),
        '/address': (context) => const AddressPage(),
      },
    );
  }
}
