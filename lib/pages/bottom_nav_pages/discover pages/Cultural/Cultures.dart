// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:translate/utils/colors.dart';

class Cultures extends StatelessWidget {
  const Cultures({super.key});

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
              Image.asset('assets/Cultural/INTRAMUROS.jpg'),
              Container(
                color: darkColor,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Intramuros',
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
                        "Intramuros is ancient walled city in Manila, it is one of the top spots that tourist visit here in the Philippines. It was build by Spaniards in 1521. It was designed as a tight grid to keep its streets functional but contained. Today, this is the only district in manila that has been successful in keeping its old Spanish Era look,",
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
