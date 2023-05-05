import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/pages/utils/animate.dart';

final TextEditingController controller = TextEditingController();

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  bool ifHasText = false;

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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //const SizedBox(height: 32.0),
              SizedBox(height: 32.0.h),
              SizedBox(
                width: 340.w,
                child: TextField(
                  // when triggered when user inserted a value or deleted text
                  onChanged: (String text) {
                    setState(() {
                      ifHasText = true;
                      if (controller.text.isEmpty) {
                        ifHasText = false;
                      }
                    });
                  },

                  controller: controller,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    suffix: ifHasText
                        ? IconButton(
                            onPressed: () {
                              controller.clear();
                              setState(() {
                                ifHasText = false;
                              });
                            },
                            icon: const Icon(
                              Icons.clear,
                              size: 20,
                            ),
                          )
                        : null,
                  ),
                  maxLines: 5,
                ),
              ),
              SizedBox(height: 16.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // const SizedBox(width: 20),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.volume_up_rounded)),
                  // const SizedBox(width: 10),
                  // IconButton(
                  //     onPressed: () {}, icon: const Icon(Icons.mic_rounded)),
                  // const SizedBox(width: 50),
                  SizedBox(
                    width: 120.w,
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Do something when the button is pressed
                      },
                      child: Text(
                        'Translate',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
