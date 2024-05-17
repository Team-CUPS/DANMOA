import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'std_list1_model.dart';
export 'std_list1_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';


class StdList1Widget extends StatefulWidget {
  const StdList1Widget({super.key});

  @override
  State<StdList1Widget> createState() => _StdList1WidgetState();
}

class _StdList1WidgetState extends State<StdList1Widget> {
  late StdList1Model _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseService _firebaseService = FirebaseService.instance;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdList1Model());
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
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.close,
              color: Color(0xFF0A0000),
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            '내 스터디',
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
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _firebaseService.getUserStudies(currentUserUid, 1),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data found'));
              } else {
                final userStudyData = snapshot.data!;
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: userStudyData.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      final study = userStudyData[index];
                      String stdPosition = study['std_leader']['uid'] == currentUserUid ? '팀장' : '팀원';
                      String stdName = study['std_name'];
                      DateTime stdUpdatedTime = study['std_updated_time'].toDate();
                      String formattedUpdateTime = UtilService.formatUpdateTime(stdUpdatedTime);
                      String stdPrfPicture = _firebaseService.getStudyPhotoUrl(study['std_prf_picture']);


                      return InkWell(
                        onTap: () async {
                          await _firebaseService.updateUserStudyIfJoined(stdName, currentUserUid);
                          await context.pushNamed(
                            'stdHome1',
                            queryParameters: {
                              'stdName': serializeParam(stdName, ParamType.String),
                            }.withoutNulls,
                          );
                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.0,
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                offset: const Offset(0.0, 1.0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    width: 44.0,
                                    height: 44.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(shape: BoxShape.circle),
                                    child: Image.network(stdPrfPicture, fit: BoxFit.cover),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                          child: Text(
                                            stdPosition,
                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                              fontFamily: 'pretendard',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          stdName,
                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                            fontFamily: 'pretendard',
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  formattedUpdateTime,
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
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
