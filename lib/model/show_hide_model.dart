import 'package:flutter/material.dart';

class ShowState extends ChangeNotifier {

  bool show = true;

  get isShowed => show;

  void setShow(bool stateShow){
    show = stateShow;
    notifyListeners();
  }
}