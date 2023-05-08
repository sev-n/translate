import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150.w,
                    height: 150.h,
                    child: const Card(
                      elevation: 20,
                    ),
                  ),
                  SizedBox(
                    width: 150.w,
                    height: 150.h,
                    child: const Card(
                      elevation: 20,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150.w,
                      height: 150.h,
                      child: const Card(
                        elevation: 20,
                      ),
                    ),
                    SizedBox(
                      width: 150.w,
                      height: 150.h,
                      child: const Card(
                        elevation: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
          borderRadius: BorderRadius.circular(10.0.r),
          splashColor: Colors.black.withOpacity(0.3),
          child: child,
        ));
  }
}
