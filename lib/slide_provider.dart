import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {

  double _slide = 0;
  double get currentSlide => _slide;

  set currentSlide(double currentPage) {
    _slide = currentPage;
    notifyListeners();
  }
  
}