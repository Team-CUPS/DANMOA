import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'std_make2_model.dart';
export 'std_make2_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';

class StdMake2Widget extends StatefulWidget {
  const StdMake2Widget({
    super.key,
    required this.stdName,
    required this.stdPrfPicture,
    required this.stdIntro,
    required this.stdUrl,
  });

  final String stdName;
  final String? stdPrfPicture;
  final String stdIntro;
  final String stdUrl;

  @override
  State<StdMake2Widget> createState() => _StdMake2WidgetState();
}

class _StdMake2WidgetState extends State<StdMake2Widget> {
  late StdMake2Model _model;
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseService _firebaseService = FirebaseService.instance;
  late Future<Map<String, dynamic>> _loadDataFuture;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdMake2Model());
    _loadDataFuture = _loadData();
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
  void dispose() {
    _model.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> _loadData() async {
    var userData = await _firebaseService.getUserDataByUid(currentUserUid);
    return {
      'userData': userData,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _loadDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('오류 발생: ${snapshot.error}'),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Scaffold(
            body: Center(
              child: Text('데이터가 없습니다.'),
            ),
          );
        }

        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                '스터디 만들기(2/2)',
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '학력',
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
                                              elevation: 0.0,
                                              borderColor: const Color(0xFFD9D9D9),
                                              borderWidth: 1.0,
                                              borderRadius: BorderRadius.circular(16.0),
                                            ),
                                            chipSpacing: 8.0,
                                            rowSpacing: 8.0,
                                            multiselect: false,
                                            initialized: _model.stdMake2Cc01Value != null,
                                            alignment: WrapAlignment.start,
                                            controller: _model.stdMake2Cc01ValueController ??= FormFieldController<List<String>>(
                                              [],
                                            ),
                                            wrapped: true,
                                          ),
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
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
                                                      [],
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
                                                                  contentPadding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 10.0),
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
                                                                  contentPadding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 10.0),
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
                                            ChipData('문학·문예'),
                                            ChipData('네이밍·슬로건'),
                                            ChipData('과학·공학·기술'),
                                            ChipData('IT·소프트웨어·게임'),
                                            ChipData('디자인·캐릭터·웹툰'),
                                            ChipData('음악·가요·댄스·무용'),
                                            ChipData('산업·사회·건축·관광·창업')
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
                                            [],
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
                      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.stdMake2Cc01Value == "" || _model.stdMake2Cc03Value == "" || listEquals(_model.stdList4Cc03Values, []) == true || _startTimeController.text == "" || _endTimeController.text == "") {
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
                                        Navigator.of(context).pop();  // 대화 상자 닫기
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

                          String? userName = snapshot.data!['userData']['prf_name'];

                          
                          String? firebaseStoragePicUrl = await _firebaseService.storeStudyImageToStorage(widget.stdPrfPicture, 'profile', widget.stdName);
                          Map<String, dynamic> studyData = {
                            'std_leader': {
                              'name': userName,
                              'uid': currentUserUid,
                            },
                            'std_members': [],
                            'std_name': widget.stdName.trim(),
                            'std_position': _model.stdMake2Cc01Value,
                            'std_field': _model.stdMake2Cc03Value,
                            'std_created_time': DateTime.now(),
                            'std_updated_time': DateTime.now(),
                            'std_times': UtilService.sortTime(_model.stdList4Cc03Values),
                            'std_intro': widget.stdIntro,
                            'std_url': widget.stdUrl,
                            'std_prf_picture': firebaseStoragePicUrl,
                          };

                          try {
                            await _firebaseService.createStudy(widget.stdName.trim(), currentUserUid, studyData);
                            print('Study data added successfully.');
                          } catch (e) {
                            print('Error adding study data: $e');
                          }

                          if (context.mounted) {
                            context.pushNamed('stdMake3');
                          }
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
                          elevation: 3.0,
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
