// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:danmoa/flutter_flow/flutter_flow_widgets.dart';

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
    return FFButtonWidget(
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
          labels: ["24 h", "3 h", "6 h", "9 h", "12 h", "15 h", "18 h", "21 h"]
              .asMap()
              .entries
              .map((e) {
            return ClockLabel.fromIndex(idx: e.key, length: 8, text: e.value);
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
      text: '시간선택',
      options: FFButtonOptions(
        width: 85,
        height: 38,
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: Color(0xFF375AC1),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'pretendard',
              color: Color(0xFFFFFFFF),
              fontSize: 12,
              letterSpacing: 0,
              useGoogleFonts: false,
            ),
        elevation: 0,
        borderSide: BorderSide(
          color: Color(0xFF375AC1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
