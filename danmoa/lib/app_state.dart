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

  int _timeCount = 0;
  int get timeCount => _timeCount;
  set timeCount(int value) {
    _timeCount = value;
  }

  List<int> _timeState = [0, 0, 0];
  List<int> get timeState => _timeState;
  set timeState(List<int> value) {
    _timeState = value;
  }

  void addToTimeState(int value) {
    _timeState.add(value);
  }

  void removeFromTimeState(int value) {
    _timeState.remove(value);
  }

  void removeAtIndexFromTimeState(int index) {
    _timeState.removeAt(index);
  }

  void updateTimeStateAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _timeState[index] = updateFn(_timeState[index]);
  }

  void insertAtIndexInTimeState(int index, int value) {
    _timeState.insert(index, value);
  }

  List<String> _startTime = ['12:00', '12:00', '12:00'];
  List<String> get startTime => _startTime;
  set startTime(List<String> value) {
    _startTime = value;
  }

  void addToStartTime(String value) {
    _startTime.add(value);
  }

  void removeFromStartTime(String value) {
    _startTime.remove(value);
  }

  void removeAtIndexFromStartTime(int index) {
    _startTime.removeAt(index);
  }

  void updateStartTimeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _startTime[index] = updateFn(_startTime[index]);
  }

  void insertAtIndexInStartTime(int index, String value) {
    _startTime.insert(index, value);
  }

  List<String> _endTime = ['15:00', '15:00', '15:00'];
  List<String> get endTime => _endTime;
  set endTime(List<String> value) {
    _endTime = value;
  }

  void addToEndTime(String value) {
    _endTime.add(value);
  }

  void removeFromEndTime(String value) {
    _endTime.remove(value);
  }

  void removeAtIndexFromEndTime(int index) {
    _endTime.removeAt(index);
  }

  void updateEndTimeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _endTime[index] = updateFn(_endTime[index]);
  }

  void insertAtIndexInEndTime(int index, String value) {
    _endTime.insert(index, value);
  }
}
