// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:translate/pages/utils/colors.dart';

class Foods extends StatelessWidget {
  const Foods({super.key});

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
              Image.asset(
                'assets/Foods/ADOBO.jpg',
                width: 500,
                height: 300,
                fit: BoxFit.cover,
              ),
              Container(
                color: darkColor,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adobo',
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
                        "Adobo is often called the national dish of the Phillipines and it's certainly the most famous Filipino dish. The flavor is created using vinegar,soy sauce, bay leaves, and black pepper .",
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
