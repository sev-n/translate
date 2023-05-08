import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/pages/utils/animate.dart';

class Conversation extends StatelessWidget {
  const Conversation({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h, left: 10.w),
          child: Row(
            children: [
              SizedBox(
                width: 140.w,
                child: ElevatedButton(
                  onPressed: () {
                    // Do something when the button is pressed
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.grey[300],
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0.w, vertical: 14.0.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0.r),
                    ),
                    side: BorderSide.none,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          'English',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(width: 16.0.w),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.w, right: 10.w),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0.r),
                    splashColor: Colors.black.withOpacity(0.3),
                    onTap: () {},
                    child: const RotateSwapButton(
                      childWidget: Icon(
                        Icons.swap_horizontal_circle_outlined,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: SizedBox(
                  width: 140.w,
                  child: ElevatedButton(
                    onPressed: () {
                      // Do something when the button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 14.0.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0.r),
                      ),
                      side: BorderSide.none,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            'Filipino',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                        SizedBox(width: 16.0.w),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),
              // --------------------------------------------------------
            ],
          ),
        ),
        Align(
          alignment: const Alignment(0, 0.90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mic_none),
                iconSize: 30,
                color: Colors.orange,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mic_outlined),
                iconSize: 30,
                color: Colors.pink,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
