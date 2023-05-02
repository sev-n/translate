import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Column(
              children: [
                SizedBox(
                  width: 300.w,
                  height: 100.h,
                  child: Placeholder(
                    fallbackHeight: 100.h,
                    fallbackWidth: 100.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
