import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'std_home2_model.dart';
export 'std_home2_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';

class StdHome2Widget extends StatefulWidget {
  const StdHome2Widget({
    super.key,
    required this.stdName,
    required this.stdPrfPicture,
  });

  final String stdName;
  final String stdPrfPicture;

  @override
  State<StdHome2Widget> createState() => _StdHome2WidgetState();
}

class _StdHome2WidgetState extends State<StdHome2Widget> {
  late StdHome2Model _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseService _firebaseService = FirebaseService.instance;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdHome2Model());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> _loadStudyData() async {
    return await _firebaseService.getStudyDataByName(widget.stdName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _loadStudyData(),
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
                  Icons.close,
                  color: Color(0xFF0A0000),
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                '스터디 관리',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'pretendard',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
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
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 5.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [ 
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await context.pushNamed(
                                'stdHome3',
                                queryParameters: {
                                  'stdName': serializeParam(widget.stdName, ParamType.String),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              height: 60.0,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '팀원 관리',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'pretendard',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await context.pushNamed(
                                'stdHome4',
                                queryParameters: {
                                  'stdName': serializeParam(widget.stdName, ParamType.String),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              height: 60.0,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '스터디 설정 변경',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'pretendard',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await context.pushNamed(
                                'stdHome5',
                                queryParameters: {
                                  'stdName': serializeParam(widget.stdName, ParamType.String),
                                }.withoutNulls,
                              );
                              setState(() {
                                _loadStudyData();
                              });
                            },
                            child: Container(
                              height: 60.0,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '소개 변경',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'pretendard',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse = await showDialog<bool>(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('스터디를 삭제하시겠습니까?'),
                                        content: const Text('삭제한 정보는 복구되지 않습니다.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, false),
                                            child: const Text('아니오'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, true),
                                            child: const Text('예'),
                                          ),
                                        ],
                                      );
                                    },
                                  ) ??
                                  false;
                              if (confirmDialogResponse) {
                                _firebaseService.deleteStudy(studyData['std_name']);
                                while(context.canPop()) {
                                  context.pop();
                                }
                                context.pushNamed('home1');
                              }
                            },
                            child: Container(
                              height: 60.0,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '스터디 삭제',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'pretendard',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
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
        );
      },
    );
  }
}
