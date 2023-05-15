// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:translate/utils/colors.dart';

class Beaches extends StatelessWidget {
  const Beaches({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: darkColor,
      body: Center(
        child: Card(
          color: darkColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/Beaches/ELNIDO.jpg'),
              Container(
                color: darkColor,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'El Nido',
                        style: TextStyle(
                          fontFamily: 'gothic',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        "El Nido, which is the well-known region of Palawan, consistently ranks among the world's most picturesque beaches, giving the moniker 'Heaven on Earth'. The beaches and islands of EL Nido, looks like a hidden adventure since they are sorrounded by old limestone cliffs, yet this paradise is actually a well-known getaway.",
                        style: TextStyle(
                          fontFamily: 'gothic',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
