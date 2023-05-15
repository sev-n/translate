import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:translate/home.dart';

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
            isLastPage ? const GetStartedBtn() : const NextBtn(),
            Container(
              alignment: const Alignment(0, 0.65),
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
      effect: const WormEffect(),
    );
  }
}


class GetStartedBtn extends StatelessWidget {
  const GetStartedBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.85),
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffB5CFBC),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: const Text(
            "Get Started",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: "RobotoFlex",
              color: Color(0xff0C2924),
            ),
          ),
        ),
      ),
    );
  }
}

class NextBtn extends StatelessWidget {
  const NextBtn({super.key});

  @override
  Widget build(BuildContext context) {
    // top: 625,
    // left: 80,

    return Align(
      alignment: const Alignment(0, 0.85),
      child: SizedBox(
        width: 200,
        child: OutlinedButton(
          onPressed: () {
            controllerPage.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          },
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xffB5CFBC),
            side: const BorderSide(
              width: 1,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            foregroundColor: Colors.white,
          ),
          child: const Text(
            "Next",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: "RobotoFlex",
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}