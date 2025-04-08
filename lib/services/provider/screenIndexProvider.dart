import 'package:flutter/material.dart';

class screenIndexProvider extends ChangeNotifier {
  int screenIndex = 0;
  int get fetchCurrentScreenIndex {
    return screenIndex;
  }

  updateScreenIndex(int newIndex) {
    screenIndex = newIndex;
    notifyListeners();
  }
}
