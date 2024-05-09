import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'std_list1_model.dart';
export 'std_list1_model.dart';
import 'package:danmoa/backend/backend.dart';

class StdList1Widget extends StatefulWidget {
  const StdList1Widget({super.key});

  @override
  State<StdList1Widget> createState() => _StdList1WidgetState();
}

class _StdList1WidgetState extends State<StdList1Widget> {
  late StdList1Model _model;


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    logger.i('init() in std_list1');
    super.initState();
    _model = createModel(context, () => StdList1Model());
  }

  @override
  void dispose() {
    logger.i('dispose() in std_list1');
    _model.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    logger.i("didChangeDependencies() in std_list1: ${context.toString()}");
    super.didChangeDependencies(); 
  }

  @override
  Widget build(BuildContext context) {
    logger.i("build() in std_list1: ${context.toString()}");
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: loadFilteredPersonalStudyData(1), // 1: updated time DESC / 2: created time DESC
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('오류 발생: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      final study = snapshot.data![index];
                      String stdPosition = study['std_leader']['uid'] == currentUserUid ? '팀장' : '팀원';
                      String stdName = study['std_name'];
                      DateTime stdUpdatedTime = study['std_updated_time'];
                      String formattedUpdateTime = formatUpdateTime(stdUpdatedTime);
                      //String stdPrfPicture = study['std_prf_picture'] ?? 'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/study%2Fdefault%2Fdefault_white.png?alt=media&token=e78c656d-4dc3-4b91-b2ad-2bb69a913f64';
                      return InkWell(
                        onTap: () async {
                          try {
                            await updateStudyUpdateTime(stdName);
                            var result = await Navigator.pushNamed(
                              context,
                              'stdList1',
                              arguments: {
                                'stdName': serializeParam(stdName, ParamType.String),
                                'stdPosition': serializeParam(stdPosition, ParamType.String),
                              }.withoutNulls,
                            );
                            if (result == null) {
                              print('저장을 실패했다.');
                            } else {
                              print('돌아왔다. $result');
                            }
                          } catch (e) {
                            print('Error during navigation: $e');
                          }
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
                              )
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
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      stdPrfPicture,
                                      fit: BoxFit.cover,
                                    ),
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
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
