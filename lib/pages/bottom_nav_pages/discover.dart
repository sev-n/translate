import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff222831),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 150.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Stack(
                            children: [
                              Container(
                                width: 150.w,
                                height: 150.h,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/Beaches/BC.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Center(
                                    child: Text(
                                      'Beaches',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'gothic',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {},
                          child: Stack(
                            children: [
                              Container(
                                width: 150.w,
                                height: 150.h,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/Cultural/CAC.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Center(
                                    child: Text(
                                      'Culutural Attraction',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'gothic',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Stack(
                              children: [
                                Container(
                                  width: 150.w,
                                  height: 150.h,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/Foods/FDC.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Center(
                                      child: Text(
                                        'Food Delicacy',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'gothic',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardClickable extends StatelessWidget {
  final Widget child;
  const CardClickable({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10.0.r),
        splashColor: Colors.black.withOpacity(0.3),
        child: child,
      ),
    );
  }
}
