import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../discover pages/custom_click.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff222831),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Clickable(
                      destination: '/philippines',
                      child: Container(
                        width: 150.w,
                        height: 150.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/PHIL.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          'Philippines',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'gothic',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Clickable(
                      destination: '/korea',
                      child: Container(
                        width: 150.w,
                        height: 150.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/KOREA.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          'Korea',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'gothic',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Clickable(
                        destination: '/japan',
                        child: Container(
                          width: 150.w,
                          height: 150.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/JAPAN.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            'Japan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'gothic',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Clickable(
                        destination: '/china',
                        child: Container(
                          width: 150.w,
                          height: 150.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/CHINA.png'),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            'China',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'gothic',
                            ),
                            textAlign: TextAlign.center,
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
    );
  }
}
