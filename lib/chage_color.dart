import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class ChangeColor extends ChangeNotifier {
  List<Color> colors = [Colors.black, Colors.green, Colors.blue, Colors.red];
  Color color = Colors.black;

  void changeColor() {
    final random = math.Random();
    color = colors[random.nextInt(4)];
    notifyListeners();
  }
}