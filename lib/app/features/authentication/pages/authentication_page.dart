import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/assets/texts/authentication_texts.dart';
import 'package:heyava_authentication/app/features/authentication/pages/login_page.dart';
import 'package:heyava_authentication/app/features/authentication/pages/sign_up_page.dart';

import 'components/authentication_top_info.dart';

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
    super.initState();
    tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60.0, bottom: 40),
                child: AuthenticationTopInfo(),
              ),
              TabBar(
                controller: tabController,
                tabs: [
                  _buildTab(AuthenticationTexts.loginButton),
                  _buildTab(AuthenticationTexts.singupButton)
                ],
                labelColor: Colors.black,
                onTap: (page) {
                  pageController.animateToPage(page,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                },
              ),
              Expanded(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTab(label) => Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
        ),
        child: Text(label),
      );
}
