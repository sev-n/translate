import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/utils/colors.dart';
import 'package:lottie/lottie.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: darkColor,
      child: Column(
        children: [
          SizedBox(
            width: 360.w,
            height: 360.h,
            child: Lottie.asset('assets/lottie/page1.json'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Translate between languages with our translation app.',
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
