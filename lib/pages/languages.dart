import 'package:flutter/material.dart';

class MyLanguageUI extends StatelessWidget {
  const MyLanguageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ));
  }
}
