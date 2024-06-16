import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'std_home5_model.dart';
export 'std_home5_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';
import '/std_home/photo_sht_stdhome/photo_sht_stdhome_widget.dart';

class StdHome5Widget extends StatefulWidget {
  const StdHome5Widget({
    super.key,
    required this.stdName,
  });

  final String stdName;

  @override
  State<StdHome5Widget> createState() => _StdHome5WidgetState();
}

class _StdHome5WidgetState extends State<StdHome5Widget> {
  late StdHome5Model _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseService _firebaseService = FirebaseService.instance;
  final ScrollController _scrollController = ScrollController();
  XFile? returnedXfileImg;
  String? returnedStringImg;
  bool isPickedImg = false;
  bool isInit = true;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdHome5Model());

    _model.myBioTextController ??= TextEditingController();
    _model.myBioFocusNode ??= FocusNode();
    _model.myBioFocusNode!.addListener(() {
      if (_model.myBioFocusNode!.hasFocus) {
        _scrollToFocusedField(_model.myBioFocusNode!);
      }
    });

    _model.cityTextController ??= TextEditingController();
    _model.cityFocusNode ??= FocusNode();
    _model.cityFocusNode!.addListener(() {
      if (_model.cityFocusNode!.hasFocus) {
        _scrollToFocusedField(_model.cityFocusNode!);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToFocusedField(FocusNode focusNode) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (focusNode.context != null) {
        final object = focusNode.context!.findRenderObject();
        if (object is RenderBox) {
          _scrollController.animateTo(
            _scrollController.offset + object.localToGlobal(Offset.zero).dy - 100,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  Future<Map<String, dynamic>> _loadData(String studyName) async {
    var loadedStudyData = await _firebaseService.getStudyDataByName(studyName);
    return loadedStudyData;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
            '소개 변경',
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
        body: FutureBuilder<Map<String, dynamic>>(
          future: _loadData(widget.stdName),
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
              _model.myBioTextController.text = studyData['std_intro'] ?? '';
              _model.cityTextController.text = studyData['std_url'] ?? '';
              returnedStringImg = studyData['std_prf_picture'];
              isInit = false;
            }

            return SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
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
                                        onTap: () => _model.unfocusNode.canRequestFocus
                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding: MediaQuery.viewInsetsOf(context),
                                          child: PhotoShtStdhomeWidget(
                                            isPickedImgSht: isPickedImg,
                                            shtXfileImg: returnedXfileImg,
                                            shtStringImg: returnedStringImg,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((result) {
                                    setState(() {
                                      isPickedImg = result['isPickedImgSht'];
                                      returnedXfileImg = result['shtXfileImg'];
                                      returnedStringImg = result['shtStringImg'];
                                    });
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 3.0),
                                      child: Icon(
                                        Icons.add_a_photo,
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 50.0, 20.0, 0.0),
                            child: SizedBox(
                              height: 150.0, // Set the desired height
                              child: TextFormField(
                                controller: _model.myBioTextController,
                                focusNode: _model.myBioFocusNode,
                                textCapitalization: TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: '소개글을 간단하게 적어주세요',
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).alternate,
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
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  contentPadding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                validator: _model.myBioTextControllerValidator.asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                            child: SizedBox(
                              height: 60.0, // Set the desired height
                              child: TextFormField(
                                controller: _model.cityTextController,
                                focusNode: _model.cityFocusNode,
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: '채팅방 링크를 넣어주세요',
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).alternate,
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
                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  contentPadding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                validator: _model.cityTextControllerValidator.asValidator(context),
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      // 이미지 파이어스토어 저장 경로 : returnedImg?.path
                      // _model.myBioTextController.text : 소개
                      // _model.cityTextController.text : 링크
                      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 48.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          String chatLink = _model.cityTextController.text;
                          if (_model.cityTextController.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("경고"),
                                  content: const Text("채팅방 링크는 필수 입력 항목입니다."),
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

                          if (isPickedImg) {
                            String? photoUrl = await _firebaseService.storeStudyImageToStorage(
                                returnedXfileImg?.path, 'profile', studyData['std_name']);
                            // picked되면 photoUrl는 null 불가능
                            await _firebaseService.updateStudyDetails(
                              widget.stdName,
                              stdPrfPicture: photoUrl!,
                              stdIntro: _model.myBioTextController.text,
                              stdUrl: _model.cityTextController.text,
                            );
                          } else {
                            await _firebaseService.updateStudyDetails(
                              widget.stdName,
                              stdPrfPicture: returnedStringImg,
                              stdIntro: _model.myBioTextController.text,
                              stdUrl: _model.cityTextController.text,
                            );
                          }

                          context.pop();
                        },
                        text: '저장하기',
                        options: FFButtonOptions(
                          width: 320.0,
                          height: 45.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFF375AC1),
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
              )
            );
          },
        ),
      ),
    );
  }
}