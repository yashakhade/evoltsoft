import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../providers/auth_provider.dart';
import '../utils/widgets/button_widgets.dart';
import '../utils/widgets/text_widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return PageView(
                  controller: provider.pageController,
                  onPageChanged: provider.onPageChanged,
                  children: <Widget>[
                    Image.asset(
                      'assets/onbording/image 10 (1).png',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/onbording/image 10 (2).png',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/onbording/image 10 (3).png',
                      fit: BoxFit.fill,
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: h * 0.05),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: h * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Container(
                            height: h * 0.03,
                            width: w * 0.14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white),
                            ),
                            child: const Center(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Consumer<AuthProvider>(
                    builder: (context, provider, child) {
                      return SmoothPageIndicator(
                        controller: provider.pageController,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.blue,
                          dotColor: Color(0xff344054),
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      );
                    },
                  ),
                  Consumer<AuthProvider>(
                    builder: (context, provider, child) {
                      return TextWidget2(
                        text: provider.currentPage == 1
                            ? 'Charge anytime &\n Pay without stress!'
                            : provider.currentPage == 2
                                ? 'Setup once &\n Earn regularly'
                                : 'Share, Care, Earn\n with EV Chargers!',
                      );
                    },
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Consumer<AuthProvider>(
                    builder: (context, provider, child) {
                      return TextWidget(
                        text: provider.currentPage == 2
                            ? 'Hosts can easily setup and sync\n booking schedules to the El-Monde app\n for regular earning on their Chargers.'
                            : provider.currentPage == 1
                                ? 'Guests can charge whenever they want\n during their stay and pay via many ways\n to enjoy stress free holidays.'
                                : 'El-Monde enables Vacation Hosts to easily\n share their EV Chargers with Guests to\n conveniently charge during holidays.',
                      );
                    },
                  ),
                  SizedBox(
                    height: h * 0.07,
                  ),
                  ButtonWidget(
                    h: h,
                    w: w,
                    title: 'Get Started',
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
