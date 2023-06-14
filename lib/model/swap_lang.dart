import 'package:flutter/material.dart';

class Swap extends ChangeNotifier {
  int touch = 1;

  int get touchState => touch;

  void setTouchState() {
    touch += 1;
    if(touch == 11){
      touch = 1;
    }
    notifyListeners();
  }

}


