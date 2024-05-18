import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:danmoa/backend/service/firebase_service.dart';

import 'std_home3_model.dart';
export 'std_home3_model.dart';

class StdHome3Widget extends StatefulWidget {
  const StdHome3Widget({
    super.key,
    required this.stdName,
  });

  final String stdName;

  @override
  State<StdHome3Widget> createState() => _StdHome3WidgetState();
}

class _StdHome3WidgetState extends State<StdHome3Widget> {
  late StdHome3Model _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseService _firebaseService = FirebaseService.instance;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdHome3Model());
  }

  Future<void> _removeMember(String uid) async {
    try {
      // 서버에서 해당 멤버 삭제
      await _firebaseService.removeMemberFromStudy(widget.stdName, uid);

      // 로컬 상태 업데이트
      setState(() {});
    } catch (e) {
      print('Error removing member: $e');
    }
  }

  Future<List<Map<String, dynamic>>> _loadStudyData() async {
    Map<String, dynamic> studyData = await _firebaseService.getStudyDataByName(widget.stdName);
    List<Map<String, dynamic>> membersData = await _firebaseService.getMembersDataFromStudyData(studyData);
    Map<String, dynamic> leaderData = await _firebaseService.getUserDataByUid(studyData['std_leader']['uid']);
    membersData.add(leaderData);

    return membersData;
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
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: const Icon(
              Icons.chevron_left,
              color: Color(0xFF0A0000),
              size: 30,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            '팀원 관리',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'pretendard',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _loadStudyData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (snapshot.hasData) {
                var membersData = snapshot.data!;
                var leaderData = membersData.removeLast();
                logger.f(leaderData);
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10, 30, 0, 0),
                        child: Text(
                          '팀장',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'pretendard',
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 70,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Container(
                                width: 50,
                                height: 50,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(_firebaseService.getUserPhotoUrl(leaderData['photo_url'])),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                '${leaderData['prf_name']} (${leaderData['display_name']})',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'pretendard',
                                      fontSize: 16,
                                      letterSpacing: 0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              '팀원 총 ${membersData.length}명',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'pretendard',
                                letterSpacing: 0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: membersData.length,
                        itemBuilder: (context, index) {
                          var member = membersData[index];
                          return Container(
                            width: double.infinity,
                            height: 70,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        _firebaseService.getUserPhotoUrl(member['photo_url']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                    child: Text(
                                      '${member['prf_name']} (${member['display_name']})',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'pretendard',
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(199, 0, 0, 0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 20,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                        color: Color(0xFFF90909),
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        _removeMember(member['uid']);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: Text("No data available"));
              }
            },
          ),
        ),
      ),
    );
  }
}
