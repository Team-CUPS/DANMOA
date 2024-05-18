import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'std_make1_model.dart';
export 'std_make1_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';
import '/std_make/photo_sht_stdmake/photo_sht_stdmake_widget.dart';


class StdMake1Widget extends StatefulWidget {
  const StdMake1Widget({super.key});

  @override
  State<StdMake1Widget> createState() => _StdMake1WidgetState();
}

class _StdMake1WidgetState extends State<StdMake1Widget> {
  late StdMake1Model _model;
  bool isPickedImg = false;
  XFile? returnedXfileImg;
  String? returnedStringImg;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseService _firebaseService = FirebaseService.instance;


  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdMake1Model());

    _model.stdNameTextController ??= TextEditingController();
    _model.stdNameFocusNode ??= FocusNode();

    _model.stdIntroTextController ??= TextEditingController();
    _model.stdIntroFocusNode ??= FocusNode();

    _model.stdUrlTextController ??= TextEditingController();
    _model.stdUrlFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Icons.close,
              color: Color(0xFF0A0000),
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            '스터디 만들기(1/2)',
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => _model
                                          .unfocusNode.canRequestFocus
                                      ? FocusScope.of(context)
                                          .requestFocus(
                                              _model.unfocusNode)
                                      : FocusScope.of(context)
                                          .unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(
                                        context),
                                    child: PhotoShtStdmakeWidget(
                                      isPickedImgSht: isPickedImg,
                                      shtXfileImg: returnedXfileImg,
                                      shtStringImg: returnedStringImg,
                                    ),
                                  ),
                                );
                              },
                            ).then((result) {
                              isPickedImg = result['isPickedImgSht'];
                              returnedXfileImg = result['shtXfileImg'];
                              returnedStringImg = result['shtStringImg'];

                              setState(() {});
                            });
                          },
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFBDBDBD),
                              ),
                              image: isPickedImg == false
                                    ? DecorationImage(
                                        image: NetworkImage(_firebaseService.getStudyPhotoUrl(returnedStringImg)),
                                        fit: BoxFit.cover,
                                      )
                                    : DecorationImage(
                                        image: FileImage(File(returnedXfileImg!.path)),
                                        fit: BoxFit.cover,
                                      ),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(1.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 3.0, 3.0),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 0.0, 10.0),
                              child: Text(
                                '그룹명',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 16.0),
                            child: TextFormField(
                              controller: _model.stdNameTextController,
                              focusNode: _model.stdNameFocusNode,
                              textCapitalization: TextCapitalization.words,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '스터디 이름을 정해주세요',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 0.0, 24.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              validator: _model.stdNameTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  25.0, 15.0, 0.0, 0.0),
                              child: Text(
                                '소개 및 링크 ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 12.0),
                            child: TextFormField(
                              controller: _model.stdIntroTextController,
                              focusNode: _model.stdIntroFocusNode,
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                hintText: '소개글을 간단하게 적어주세요',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 0.0, 24.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              validator: _model.stdIntroTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 16.0),
                            child: TextFormField(
                              controller: _model.stdUrlTextController,
                              focusNode: _model.stdUrlFocusNode,
                              textCapitalization: TextCapitalization.words,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '채팅방 링크를 넣어주세요',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 0.0, 24.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              validator: _model.stdUrlTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ],
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
                      String chatLink = _model.stdUrlTextController.text;
                      //!chatLink.startsWith('https://open.kakao.com')
                      if(_model.stdNameTextController.text == "" ||   _model.stdIntroTextController.text == "" || _model.stdUrlTextController.text == "") {
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
                        // 위 조건에 의해 빈 문자열은 스터디이름이 되지 않음
                      } else if (!(await _firebaseService.isStudyNameUnique(_model.stdNameTextController.text))) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("경고"),
                              content: const Text("동일한 스터디 이름이 존재합니다."),
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
                      } else if (!chatLink.startsWith('https://open.kakao.com')) {
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

                      
                      context.pushNamed(
                        'stdMake2',
                        queryParameters: {
                          'stdName': serializeParam(
                            _model.stdNameTextController.text,
                            ParamType.String,
                          ),
                          'stdIntro': serializeParam(
                            _model.stdIntroTextController.text,
                            ParamType.String,
                          ),
                          'stdUrl': serializeParam(
                            _model.stdUrlTextController.text,
                            ParamType.String,
                          ),
                          'stdPrfPicture': serializeParam(
                            isPickedImg ? returnedXfileImg!.path : returnedStringImg,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: '다음',
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
                      elevation: 0.0,
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
