import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/utils/colors.dart';

class Foods extends StatelessWidget {
  const Foods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: accent,
            leading: const Icon(Icons.menu),
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/Foods/FDC.png',
                fit: BoxFit.cover,
              ),
              titlePadding: EdgeInsets.only(top: 5.h, bottom: 10.h),
              title: Text(
                "F O O D S",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'gothic',
                  fontSize: 22.sp,
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 500.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'assets/Foods/ADOBO.jpg',
                                fit: BoxFit.cover,
                                width: 400.w,
                                height: 250.h,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              'Adobo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              "Adobo is often the national dish of the Philippines and it's centainly the most famous Filipino dish. The flavor is created using vinegar, soy sauce, garlic, bay leaves, and black pepper. Also chilli pepper are sometimes added to give it a little spice.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Image.asset(
                              'assets/Foods/SINIGANG.jpg',
                              fit: BoxFit.cover,
                              width: 400.w,
                              height: 220.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              'EL Nido',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              "El Nido, which is the well-known region of Palawan, consistently ranks among the world's picturesque beaches, giving it the moniker 'Heaven on Earth'. The beaches and islands of El Nido, look like a hidden adventure since they are surrounded by old limestone cliffs, yet this paradise is actually a well-known getaway.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Image.asset(
                              'assets/Foods/PATA.jpg',
                              fit: BoxFit.cover,
                              width: 400.w,
                              height: 220.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              'Crispy Pata',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              "El Nido, which is the well-known region of Palawan, consistently ranks among the world's picturesque beaches, giving it the moniker 'Heaven on Earth'. The beaches and islands of El Nido, look like a hidden adventure since they are surrounded by old limestone cliffs, yet this paradise is actually a well-known getaway.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Image.asset(
                              'assets/Foods/SISIG.jpg',
                              fit: BoxFit.cover,
                              width: 400.w,
                              height: 220.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              'Sisig',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              "Pork Sisig is most common and it consist of chopped up pig ears, jowls and liver, onion, chili peppers delivered on a sizzling hot skillet with a raw egg on top. You'll need to mix in the egg to cook it before the skillet cools down. It usually comes with a couple calamansi halves so you can squeeze the juice over the top.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
                decoration: BoxDecoration(
                    color: const Color(0xff393E46),
                    borderRadius: BorderRadius.circular(20.w),),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Image.asset(
                              'assets/Foods/KAREKARE.jpg',
                              fit: BoxFit.cover,
                              width: 400.w,
                              height: 200.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              'Crispy Pata',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              "Kare-Kare is thick stew made from oxtail, vegetables and peanut sauce. It reminded us a bit of massaman curry from Thailand which makes sense as the world 'kare' is derived from the Filipino word for curry. Supposedly the best kare-kare comes from Pampanga which is just north of Manila, but you'll find this dish served all over the Philippines.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 500.h,
                decoration: BoxDecoration(
                    color: const Color(0xff393E46),
                    borderRadius: BorderRadius.circular(20.w),),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Image.asset(
                              'assets/Foods/BALUT.jpg',
                              fit: BoxFit.cover,
                              width: 400.w,
                              height: 220.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              'Balut',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Text(
                              "Balut is probably the most infamous street food in the Philippines and the most likely to be a part of drunken dare involving tourists. It is basically just boiled duck egg. However, the duck eggs used for Balut have been fertilized and allowed to incubate anywhere from 14 to  18 days.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
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
          ),
        ],
      ),
    );
  }
}
