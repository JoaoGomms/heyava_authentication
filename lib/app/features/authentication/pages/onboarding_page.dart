import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/infrastructure/session_controller.dart';

import 'onboarding_itens.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final SessionController _sessionController = GetIt.I.get<SessionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Center(child: Image.asset('assets/images/ava_logo.png')),
            ),
          ),
          Expanded(
            flex: 12,
            child: CarouselSlider(
                items: onboardingPages.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          child: SvgPicture.asset(
                            e.urlImg,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(e.text ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.blue)),
                        ),
                        Text(
                          e.label ?? '',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: MediaQuery.sizeOf(context).height,
                  autoPlay: true,
                )),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 40.0, bottom: 20),
              child: TextButton(
                child: Text(
                  'CONTINUAR',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context,
                      _sessionController.user != null
                          ? '/account'
                          : '/authentication');
                  _sessionController.isOnboardingCompleted = true;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
