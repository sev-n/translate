import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/utils/colors.dart';
import 'package:lottie/lottie.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: darkColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: SizedBox(
              width: 300.w,
              height: 300.h,
              child: Lottie.asset('assets/lottie/page2.json'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              'Discover a world of languages and unlock excellent communication with our intuitive translation app.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'gothic',
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
