import 'package:flutter/material.dart';

class NavigationState extends ChangeNotifier {
  BuildContext _context;
  int _tab;

  NavigationState(this._context) {
    _tab = 0;
  }

  void changeTab(int newTab) {
    if (newTab != _tab) {
      _tab = newTab;
      notifyListeners();
    }
  }

  int get tab => _tab;
}
