import 'package:danmoa/backend/service/util_service.dart';

import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'std_home4_model.dart';
export 'std_home4_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';

class StdHome4Widget extends StatefulWidget {
  const StdHome4Widget({
    super.key,
    required this.stdName,
  });

  final String stdName;

  @override
  State<StdHome4Widget> createState() => _StdHome4WidgetState();
}

class _StdHome4WidgetState extends State<StdHome4Widget> {
  late StdHome4Model _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final FirebaseService _firebaseService = FirebaseService.instance;
  bool isInit = true;
  late Future<Map<String, dynamic>> _loadDataFuture;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdHome4Model());
    _loadDataFuture = _loadStudyData();
  }

  @override
  void dispose() {
    _startTimeController.dispose();
    _endTimeController.dispose();
    _model.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> _loadStudyData() async {
    return await _firebaseService.getStudyDataByName(widget.stdName);
  }

  Future<void> _selectTime(BuildContext context, {required bool isStartTime}) async {
    final TimeOfDay initialTime = TimeOfDay.now();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTimeController.text = pickedTime.format(context);
        } else {
          _endTimeController.text = pickedTime.format(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _loadDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('오류 발생: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('데이터가 없습니다.'),
          );
        }

        final studyData = snapshot.data!;
        if (isInit) {
          _startTimeController.text = studyData['std_times'][studyData['std_times'].length - 2];
          _endTimeController.text = studyData['std_times'][studyData['std_times'].length - 1];
          isInit = false;
        }
        

        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.chevron_left,
                  color: Color(0xFF0A0000),
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                '스터디 설정 변경',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'pretendard',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 25.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '학력',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'pretendard',
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          FlutterFlowChoiceChips(
                                            options: const [
                                              ChipData('1학년'),
                                              ChipData('2학년'),
                                              ChipData('3학년'),
                                              ChipData('4학년'),
                                              ChipData('휴학'),
                                              ChipData('졸업'),
                                              ChipData('석사'),
                                              ChipData('박사'),
                                              ChipData('강사/교수'),
                                              ChipData('기타')
                                            ],
                                            onChanged: (val) => setState(() => _model.stdMake2Cc01Value = val?.firstOrNull),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'pretendard',
                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                              iconColor: FlutterFlowTheme.of(context).primaryText,
                                              iconSize: 18.0,
                                              labelPadding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                              elevation: 0.0,
                                              borderColor: FlutterFlowTheme.of(context).primary,
                                              borderWidth: 1.0,
                                              borderRadius: BorderRadius.circular(16.0),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'pretendard',
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                              iconColor: FlutterFlowTheme.of(context).primaryText,
                                              iconSize: 18.0,
                                              labelPadding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                              elevation: 0.0,
                                              borderColor: FlutterFlowTheme.of(context).alternate,
                                              borderWidth: 1.0,
                                              borderRadius: BorderRadius.circular(16.0),
                                            ),
                                            chipSpacing: 8.0,
                                            rowSpacing: 8.0,
                                            multiselect: false,
                                            initialized: _model.stdMake2Cc01Value != null,
                                            alignment: WrapAlignment.start,
                                            controller: _model.stdMake2Cc01ValueController ??= FormFieldController<List<String>>(
                                              [studyData['std_position']],
                                            ),
                                            wrapped: true,
                                          ),
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 25.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '시간대',
                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                      fontFamily: 'pretendard',
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.bold,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 4.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: const [
                                                      ChipData('월'),
                                                      ChipData('화'),
                                                      ChipData('수'),
                                                      ChipData('목'),
                                                      ChipData('금'),
                                                      ChipData('토'),
                                                      ChipData('일')
                                                    ],
                                                    onChanged: (val) => setState(() => _model.stdList4Cc03Values = val),
                                                    selectedChipStyle: ChipStyle(
                                                      backgroundColor: FlutterFlowTheme.of(context).primary,
                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'pretendard',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: false,
                                                          ),
                                                      iconColor: Colors.white,
                                                      iconSize: 18.0,
                                                      elevation: 0.0,
                                                      borderWidth: 1.0,
                                                      borderRadius: BorderRadius.circular(8.0),
                                                    ),
                                                    unselectedChipStyle: ChipStyle(
                                                      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'pretendard',
                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: false,
                                                          ),
                                                      iconColor: FlutterFlowTheme.of(context).primaryText,
                                                      iconSize: 18.0,
                                                      elevation: 0.0,
                                                      borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                      borderWidth: 1.0,
                                                      borderRadius: BorderRadius.circular(8.0),
                                                    ),
                                                    chipSpacing: 5.0,
                                                    multiselect: true,
                                                    initialized: _model.stdList4Cc03Values != null,
                                                    alignment: WrapAlignment.start,
                                                    controller: _model.stdList4Cc03ValueController ??= FormFieldController<List<String>>(
                                                      List<String>.from(studyData['std_times']).sublist(0, studyData['std_times'].length - 2),
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                          child: Container(
                                                            width: 90.0,
                                                            height: 38.0,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(12.0),
                                                              border: Border.all(
                                                                color: const Color(0x7057636C),
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                              child: TextFormField(
                                                                controller: _startTimeController,
                                                                obscureText: false,
                                                                decoration: InputDecoration(
                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                        fontFamily: 'pretendard',
                                                                        letterSpacing: 0.0,
                                                                        useGoogleFonts: false,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                        fontFamily: 'pretendard',
                                                                        letterSpacing: 0.0,
                                                                        useGoogleFonts: false,
                                                                      ),
                                                                  enabledBorder: InputBorder.none,
                                                                  focusedBorder: InputBorder.none,
                                                                  errorBorder: InputBorder.none,
                                                                  focusedErrorBorder: InputBorder.none,
                                                                  contentPadding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 10.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      fontFamily: 'pretendard',
                                                                      letterSpacing: 0.0,
                                                                      useGoogleFonts: false,
                                                                    ),
                                                                readOnly: true,
                                                                onTap: () => _selectTime(context, isStartTime: true),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '시부터',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'pretendard',
                                                                fontSize: 14.0,
                                                                letterSpacing: 0.0,
                                                                useGoogleFonts: false,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                          child: Container(
                                                            width: 90.0,
                                                            height: 38.0,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(12.0),
                                                              border: Border.all(
                                                                color: const Color(0x7057636C),
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                              child: TextFormField(
                                                                controller: _endTimeController,
                                                                autofocus: true,
                                                                obscureText: false,
                                                                decoration: InputDecoration(
                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                        fontFamily: 'pretendard',
                                                                        letterSpacing: 0.0,
                                                                        useGoogleFonts: false,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                        fontFamily: 'pretendard',
                                                                        letterSpacing: 0.0,
                                                                        useGoogleFonts: false,
                                                                      ),
                                                                  enabledBorder: InputBorder.none,
                                                                  focusedBorder: InputBorder.none,
                                                                  errorBorder: InputBorder.none,
                                                                  focusedErrorBorder: InputBorder.none,
                                                                  contentPadding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 10.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      fontFamily: 'pretendard',
                                                                      letterSpacing: 0.0,
                                                                      useGoogleFonts: false,
                                                                    ),
                                                                readOnly: true,
                                                                onTap: () => _selectTime(context, isStartTime: false),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '까지',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'pretendard',
                                                                letterSpacing: 0.0,
                                                                useGoogleFonts: false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '분야',
                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                fontFamily: 'pretendard',
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        FlutterFlowChoiceChips(
                                          options: const [
                                            ChipData('어학'),
                                            ChipData('전공'),
                                            ChipData('취업준비'),
                                            ChipData('고시·공무원'),
                                            ChipData('자격증'),
                                            ChipData('프로그래밍'),
                                            ChipData('예체능'),
                                            ChipData('기타')
                                          ],
                                          onChanged: (val) => setState(() => _model.stdMake2Cc03Value = val?.firstOrNull),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'pretendard',
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                            iconColor: FlutterFlowTheme.of(context).primaryText,
                                            iconSize: 18.0,
                                            labelPadding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                            elevation: 0.0,
                                            borderColor: FlutterFlowTheme.of(context).primary,
                                            borderWidth: 1.0,
                                            borderRadius: BorderRadius.circular(16.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'pretendard',
                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                            iconColor: FlutterFlowTheme.of(context).primaryText,
                                            iconSize: 18.0,
                                            elevation: 0.0,
                                            borderColor: const Color(0xFFD9D9D9),
                                            borderWidth: 1.0,
                                            borderRadius: BorderRadius.circular(16.0),
                                          ),
                                          chipSpacing: 8.0,
                                          rowSpacing: 8.0,
                                          multiselect: false,
                                          initialized: _model.stdMake2Cc03Value != null,
                                          alignment: WrapAlignment.start,
                                          controller: _model.stdMake2Cc03ValueController ??= FormFieldController<List<String>>(
                                            [studyData['std_field']],
                                          ),
                                          wrapped: true,
                                        ),
                                      ].divide(const SizedBox(height: 12.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 48.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.stdMake2Cc01Value == "" || listEquals(_model.stdList4Cc03Values, []) == true || _model.stdMake2Cc03Value == "" || _startTimeController.text.isEmpty || _endTimeController.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("경고"),
                                  content: const Text("모든 정보를 입력해주세요."),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("확인"),
                                      onPressed: () {
                                        context.pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            return;  // 함수 실행 중지
                          }
                          

                          _model.stdList4Cc03Values?.add(_startTimeController.text);
                          _model.stdList4Cc03Values?.add(_endTimeController.text);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '스터디 정보 수정중...',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              duration: const Duration(milliseconds: 1500),
                              backgroundColor: FlutterFlowTheme.of(context).alternate,
                            ),
                          );

                          // updateStudyDetails에서 stdPrfPicture을 반드시 저장되게 했으므로 예외적으로 보존을 해줘야 함. (하지 않으려면 이 함수를 쪼개야함.)
                          // 넣어주지 않으면 null이 되기 때문
                          await _firebaseService.updateStudyDetails(widget.stdName, stdPosition: _model.stdMake2Cc01Value!, stdTimes: UtilService.sortTime(_model.stdList4Cc03Values), stdField: _model.stdMake2Cc03Value!, stdPrfPicture: studyData['std_prf_picture']);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '스터디 정보 수정 완료!',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor: FlutterFlowTheme.of(context).alternate,
                            ),
                          );

                          context.pop();
                        },
                        text: '저장하기',
                        options: FFButtonOptions(
                          width: 320.0,
                          height: 45.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFF375AC1),
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'pretendard',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
