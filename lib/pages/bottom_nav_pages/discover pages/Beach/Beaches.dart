// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:translate/utils/colors.dart';

class Beaches extends StatelessWidget {
  const Beaches({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: accent,
            leading: const Icon(Icons.menu),
            expandedHeight: 400,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/Beaches/BC.png',
                fit: BoxFit.cover,
              ),
              title: const Text(
                "B E A C H E S",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'gothic',
                  fontSize: 25,
                ),
              ),
              centerTitle: true,
            ),
          ),
          //sliver items

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                    color: const Color(0xff393E46),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'assets/Beaches/ELNIDO.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              'EL Nido',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              "El Nido, which is the well-known region of Palawan, consistently ranks among the world's picturesque beaches, giving it the moniker 'Heaven on Earth'. The beaches and islands of El Nido, look like a hidden adventure since they are surrounded by old limestone cliffs, yet this paradise is actually a well-known getaway.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14,
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
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: const Color(0xff393E46),
                  height: 400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       color: const Color(0xff393E46),
//                       height: 500,
//                       // Add an Image widget here with your desired image source
//                       child: Align(
//                         alignment: Alignment.topCenter,
//                         child: Image.asset(
//                           'assets/Beaches/ELNIDO.jpg',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'EL Nido',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                       height:
//                           10), // Added SizedBox to create spacing between title and description
//                   const Text(
//                     "El Nido, which is the well-known region of Palawan, consistently ranks among the world's picturesque beaches, giving it the moniker 'Heaven on Earth'. The beaches and islands of El Nido, look like a hidden adventure since they are surrounded by old limestone cliffs, yet this paradise is actually a well-known getaway.",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
