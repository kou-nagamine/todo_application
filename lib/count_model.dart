import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountModel extends ChangeNotifier{
  int counter = 0;

  void incrementCounter(){
    counter++;
    notifyListeners();
  }
}