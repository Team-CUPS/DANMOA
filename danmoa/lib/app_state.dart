import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _positionState = false;
  bool get positionState => _positionState;
  set positionState(bool value) {
    _positionState = value;
  }

  int _timeState = 1;
  int get timeState => _timeState;
  set timeState(int value) {
    _timeState = value;
  }
}
