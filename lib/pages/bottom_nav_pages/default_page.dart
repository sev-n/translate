import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [
        SizedBox(height: 20),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 200,
            height: 100,
            child:  const Placeholder(
              fallbackWidth: 100,
              fallbackHeight: 100,
            ),
          ),
        ),
      ],
    );
  }
}
