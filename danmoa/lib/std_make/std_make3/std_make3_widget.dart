import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'std_make3_model.dart';
export 'std_make3_model.dart';
import 'package:danmoa/backend/backend.dart';
import 'package:logger/logger.dart';

class StdMake3Widget extends StatefulWidget {
  const StdMake3Widget({
    super.key,
    required this.stdName,
    required this.stdPosition,
    required this.stdTimes,
    required this.stdField,
    required this.stdPrfPicture,
  });

  final String? stdName;
  final String? stdPosition;
  final List<dynamic>? stdTimes;
  final String? stdField;
  final String? stdPrfPicture;

  @override
  State<StdMake3Widget> createState() => _StdMake3WidgetState();
}

class _StdMake3WidgetState extends State<StdMake3Widget> {
  late StdMake3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdMake3Model());

    _model.stdMake3Tf02TextController ??= TextEditingController();
    _model.stdMake3Tf02FocusNode ??= FocusNode();

    _model.stdMake3Tf03TextController ??= TextEditingController();
    _model.stdMake3Tf03FocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logger.i(widget.stdTimes);
    var sortedTime = sortTime(widget.stdTimes);
    logger.i(sortedTime);

    


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
              widget.stdTimes!.clear();
              context.pop();
            },
          ),
          title: Text(
            '스터디 만들기(3/3)',
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 48.0, 0.0, 12.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        '소개글',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model.stdMake3Tf02TextController,
                                          focusNode: _model.stdMake3Tf02FocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                  fontFamily: 'pretendard',
                                                  letterSpacing: 0,
                                                  useGoogleFonts: false,
                                                ),
                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                  fontFamily: 'pretendard',
                                                  letterSpacing: 0,
                                                  useGoogleFonts: false,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFADB3B2),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(context).error,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(context).error,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'pretendard',
                                                letterSpacing: 0,
                                                useGoogleFonts: false,
                                              ),
                                          maxLines: 3,
                                          keyboardType: TextInputType.multiline,
                                          validator:
                                              _model.stdMake3Tf02TextControllerValidator.asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        '채팅방 링크',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model.stdMake3Tf03TextController,
                                          focusNode: _model.stdMake3Tf03FocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                  fontFamily: 'pretendard',
                                                  letterSpacing: 0,
                                                  useGoogleFonts: false,
                                                ),
                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                  fontFamily: 'pretendard',
                                                  letterSpacing: 0,
                                                  useGoogleFonts: false,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFADB3B2),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(context).error,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(context).error,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'pretendard',
                                                letterSpacing: 0,
                                                useGoogleFonts: false,
                                              ),
                                          keyboardType: TextInputType.url,
                                          validator:
                                              _model.stdMake3Tf03TextControllerValidator.asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      String chatLink = _model.stdMake3Tf03TextController.text;
    
                      // 링크 검증
                      if (!chatLink.startsWith('https://open.kakao.com')) {
                        // 링크가 올바르지 않을 경우 경고 대화 상자 표시
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("경고"),
                              content: const Text("카카오톡 오픈채팅방 주소를 올바르게 입력해주세요."),
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



                      // widget.stdName, widget.stdTimes, widget.stdPosition, widget.stdField : page parameter
                      // _model.stdMake3Tf02TextController.text : 소개글
                      // _model.stdMake3Tf03TextController.text : 채팅방 링크
                      String? userName = await getUserInfo('prf_name');
                      String? firebaseStoragePicUrl = await storeImageToStorage(widget.stdPrfPicture, widget.stdName);
                      Map<String, dynamic> studyData = {
                        'std_leader': {
                          'name': userName,
                          'uid': currentUserUid
                        },
                        'std_members': [],
                        'std_name': widget.stdName,  // List<String>? 타입일 경우 처리 필요
                        'std_position': widget.stdPosition,
                        'std_field': widget.stdField,
                        'std_created_time': DateTime.now(),
                        'std_updated_time': DateTime.now(),
                        'std_times': sortedTime,
                        'std_intro': _model.stdMake3Tf02TextController.text,
                        'std_url': _model.stdMake3Tf03TextController.text,
                        'std_prf_picture': firebaseStoragePicUrl,
                      };

                      // 스터디 문서 추가
                      

                      
                      await storeStudyData(studyData);

                      if (context.mounted) {
                        context.pushNamed('stdMake4',);
                      }
                    },
                    text: '저장하기',
                    options: FFButtonOptions(
                      width: 320.0,
                      height: 45.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF375AC1),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
  }
}
