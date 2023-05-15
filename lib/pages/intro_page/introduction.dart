import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'page_one.dart';
import 'page_three.dart';
import 'page_two.dart';

final PageController controllerPage = PageController();

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {

  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              onPageChanged: (index) {
                setState((){
                   isLastPage = (index == 2);
                });
              },
              controller: controllerPage,
              children: const [
                // pages
                PageOne(),
                PageTwo(),
                PageThree(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.70),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // page controller

                  PageIndicator(),

                  // page controller
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatefulWidget {
  const PageIndicator({super.key});

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controllerPage, // PageController
      count: 3,
      // forcing the indicator to use a specific direction
      effect: const WormEffect(),
    );
  }
}
