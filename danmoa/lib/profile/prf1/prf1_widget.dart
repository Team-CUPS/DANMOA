import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:danmoa/backend/service/firebase_service.dart';

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

  final FirebaseService _firebaseService = FirebaseService.instance;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Prf1Model());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> _loadData() async {
    var userUid = widget.userUid ?? currentUserUid;
    var filteredPersonalStudyData = await _firebaseService.getUserStudies(userUid, 1);
    var userData = await _firebaseService.getUserDataByUid(userUid);

    return {
      'filteredPersonalStudyData': filteredPersonalStudyData,
      'userData': userData,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
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

        final filteredPersonalStudyData = snapshot.data!['filteredPersonalStudyData'] as List<Map<String, dynamic>>;
        final userData = snapshot.data!['userData'] as Map<String, dynamic>;
        print(userData['photo_url']);

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
                            setState(() {
                              _loadData();
                            });
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
                                      userData['photo_url'] ?? 'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/users%2Fdefault%2Fprofile_bear.jpeg?alt=media&token=3808c534-4f0b-43b8-a96d-85559ae578cc',
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
                                userData['display_name'] ?? '이름 없음',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'pretendard',
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Text(
                              userData['prf_major'] ?? '전공 없음',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Text(
                              userData['prf_position'] ?? '직위 없음',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                '가입 스터디',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(), // 스크롤 비활성화
                                    scrollDirection: Axis.vertical,
                                    itemCount: filteredPersonalStudyData.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      final study = filteredPersonalStudyData[index];
                                      String stdName = study['std_name'];
                                      String stdCurrentUserStatus = study['std_leader']['uid'] == currentUserUid ? '팀장' : '팀원';
                                      String stdPrfPicture = _firebaseService.getStudyPhotoUrl(study['std_prf_picture']);

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
                                              padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
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
                                ),
                              ),
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
        );
      },
    );
  }
}
