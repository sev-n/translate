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
            padding: EdgeInsets.only(top: 70.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CardClickable(
                        child: SizedBox(
                          width: 150.w,
                          height: 150.h,
                          child: const Card(
                            elevation: 20,
                          ),
                        ),
                      ),
                      CardClickable(
                        child: SizedBox(
                          width: 150.w,
                          height: 150.h,
                          child: const Card(
                            elevation: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardClickable(
                          child: SizedBox(
                            width: 150.w,
                            height: 150.h,
                            child: const Card(
                              elevation: 20,
                            ),
                          ),
                        ),
                        CardClickable(
                          child: SizedBox(
                            width: 150.w,
                            height: 150.h,
                            child: const Card(
                              elevation: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardClickable(
                          child: SizedBox(
                            width: 150.w,
                            height: 150.h,
                            child: const Card(
                              elevation: 20,
                            ),
                          ),
                        ),
                        CardClickable(
                          child: SizedBox(
                            width: 150.w,
                            height: 150.h,
                            child: const Card(
                              elevation: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
