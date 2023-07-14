import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/features/authentication/pages/login_page.dart';
import 'package:heyava_authentication/app/features/authentication/pages/sign_up_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController();
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Text('TESTEEE'),
            TabBar(
              controller: tabController,
              tabs: const [Text('Login'), Text('signup')],
              labelColor: Colors.black,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
              child: PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (page) {
                  tabController.animateTo(page);
                },
                children: const [
                  LoginPage(),
                  SignUpPage(),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
