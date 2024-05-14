import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:danmoa/backend/backend.dart';

import 'prf1_model.dart';
export 'prf1_model.dart';

class Prf1Widget extends StatefulWidget {
  const Prf1Widget({
      super.key,
      required this.userUid,
    });

    final String? userUid;

  @override
  State<Prf1Widget> createState() => _Prf1WidgetState();
}

class _Prf1WidgetState extends State<Prf1Widget> {
  late Prf1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> filteredPersonalStudyData = [];
  Map<String, dynamic> userData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Prf1Model());
    initData();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> initData() async {
    var loadedStudyData = await loadStudyData(1);
    var loadedFilterdPersonalStudyData  = await loadFilteredPersonalStudyData(loadedStudyData, widget.userUid ?? currentUserUid);
    var loadedCurrentUserData = await loadUserDataByUid(widget.userUid ?? currentUserUid);
    isLoading = false;
    setState(() {
      filteredPersonalStudyData = loadedFilterdPersonalStudyData;
      userData = loadedCurrentUserData;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Container(
          color: Colors.black.withOpacity(0.5), // 반투명 배경
          child: const Center(
            child: CircularProgressIndicator(), // 로딩 인디케이터
          ),
        ),
      );
    }
    if (widget.userUid == null) {
      logger.i('현재 유저ㅣ 로그인한 유저 그자체');
    } else {
      logger.i('현재 유저ㅣ ${widget.userUid}');
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF375AC1),
        appBar: AppBar(
          backgroundColor: const Color(0xFF375AC1),
          automaticallyImplyLeading: false,
          leading: widget.userUid != null
          ? FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: const Icon(
                Icons.close,
                color: Color(0xFF0A0000),
                size: 24,
              ),
              onPressed: () async {
                context.pop();
              },
            )
          : null,
          actions: widget.userUid == null
          ? [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 15, 5),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20,
                  borderWidth: 1,
                  buttonSize: 40,
                  icon: Icon(
                    Icons.settings_outlined,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 30,
                  ),
                  onPressed: () async {
                    await context.pushNamed('set1');
                    await initData();
                    setState(() {});
                  },
                ),
              ),
            ]
          : [],
          centerTitle: true,
          elevation: 0,
        ),
        body: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  userData['photo_url'] ?? 'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/users%2Fdefault%2F1000000036.jpg?alt=media&token=e89a0182-6090-465d-8065-ee98fc2c7c35',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Text(
                            userData['display_name'],
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'pretendard',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Text(
                          userData['prf_major'],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Text(
                          userData['prf_position'],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            -1,
                          ),
                        )
                      ],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Text(
                                    '가입 스터디',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'pretendard',
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: filteredPersonalStudyData.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final study = filteredPersonalStudyData[index];
                                    print("prf1, 가입 스터디: $study");
                                    String stdName = study['std_name'];
                                    String stdCurrentUserStatus = study['std_leader']['uid'] == currentUserUid ? '팀장' : '팀원';
                                    String stdPrfPicture = study['std_prf_picture'] ?? 'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/study%2Fdefault%2Fdefault_white.png?alt=media&token=e78c656d-4dc3-4b91-b2ad-2bb69a913f64';

                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'stdHome1',
                                            queryParameters: {
                                              'stdName': serializeParam(stdName, ParamType.String),
                                              'stdPrfPicture': serializeParam(stdPrfPicture, ParamType.String),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 150),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                  child: Container(
                                                    width: 32,
                                                    height: 32,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: const BoxDecoration(shape: BoxShape.circle),
                                                    child: Image.network(
                                                      stdPrfPicture,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        stdName,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: 'Plus Jakarta Sans',
                                                          color: const Color(0xFF14181B),
                                                          fontSize: 14,
                                                          letterSpacing: 0,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            stdCurrentUserStatus,
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontFamily: 'pretendard',
                                                              letterSpacing: 0,
                                                              useGoogleFonts: false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),


                              ],
                            ),
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
      ),
    );
  }
}
