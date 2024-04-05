// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import '/actions/actions.dart' as action_blocks;

import 'package:flutter/foundation.dart';
import 'package:time_range_picker/time_range_picker.dart'; // https://pub.dev/packages/time_range_picker
import 'package:flutter/cupertino.dart';

class RotateTime extends StatefulWidget {
  const RotateTime({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<RotateTime> createState() => _RotateTimeState();
}

class _RotateTimeState extends State<RotateTime> {
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime =
      TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 3)));
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: () async {
              TimeRange? result = await showTimeRangePicker(
                context: context,
                strokeWidth: 4,
                ticks: 12,
                ticksOffset: 2,
                ticksLength: 8,
                handlerRadius: 8,
                ticksColor: Colors.grey,
                rotateLabels: false,
                labels: [
                  "24 h",
                  "3 h",
                  "6 h",
                  "9 h",
                  "12 h",
                  "15 h",
                  "18 h",
                  "21 h"
                ].asMap().entries.map((e) {
                  return ClockLabel.fromIndex(
                      idx: e.key, length: 8, text: e.value);
                }).toList(),
                labelOffset: 30,
                padding: 55,
                labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
                start: const TimeOfDay(hour: 12, minute: 0),
                end: const TimeOfDay(hour: 15, minute: 0),
                clockRotation: 180.0,
              );

              if (result != null && kDebugMode) {
                print("result $result");
                setState(() {
                  // 시작 시간과 종료 시간을 상태 변수에 저장합니다.
                  _startTime = result.startTime;
                  // FFAppState().update(() {
                  //   FFAppState().test[0] = _startTime.format(context);
                  // });
                  _endTime = result.endTime;
                  // FFAppState().update(() {
                  //   FFAppState().endTime = _endTime.format(context);
                  // });
                });
              }
            },
            child: SizedBox(
              width: 100, // 폭 설정
              height: 40, // 높이 설정
              child:
                  Center(child: Text("시간 설정", style: TextStyle(fontSize: 12))),
            )),
      ],
    );
  }
}
