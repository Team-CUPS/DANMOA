import 'package:danmoa/backend/backend.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'std_list2_model.dart';
export 'std_list2_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';


class StdList2Widget extends StatefulWidget {
  const StdList2Widget({super.key});

  @override
  State<StdList2Widget> createState() => _StdList2WidgetState();
}

class _StdList2WidgetState extends State<StdList2Widget> {
  late StdList2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<dynamic>? selectedFilter;
  String? rtnStdPosition;
  List<String>? rtnStdTimes;
  String? rtnStdField;
  final FirebaseService _firebaseService = FirebaseService.instance;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdList2Model());
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
          title: Text(
            '전체 스터디',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'pretendard',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.search_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('stdList3');
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
            child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          selectedFilter = await context.pushNamed('stdList4');
                          setState(() {
                            rtnStdPosition = selectedFilter?[0];
                            rtnStdTimes = selectedFilter?[1];
                            rtnStdField = selectedFilter?[2];
                          });
                          
                        },
                        text: '필터',
                        icon: const Icon(
                          Icons.filter_alt,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 24.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'pretendard',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: _firebaseService.getFilteredStudyData(
                      stdPosition: rtnStdPosition,
                      stdTimes: rtnStdTimes,
                      stdField: rtnStdField,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('오류 발생: ${snapshot.error}');
                      } else {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final study = snapshot.data![index];
                            String stdName = study['std_name'];
                            String stdField = study['std_field'];
                            String stdPrfPicture = _firebaseService.getStudyPhotoUrl(study['std_prf_picture']);
                            String stdPeopleNums = study['std_members'] != null ? (study['std_members'].length + 1).toString() : '1';
                            return InkWell(
                              onTap: () async {
                                await _firebaseService.updateUserStudyIfJoined(stdName, currentUserUid);
                                await context.pushNamed(
                                  'stdHome1',
                                  queryParameters: {
                                    'stdName': serializeParam(
                                      stdName,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                                setState(() {},);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                ),
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Text(
                                                stdName,
                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                  fontFamily: 'pretendard',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  stdField,
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'pretendard',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  ' / 팀원 $stdPeopleNums명 ',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'pretendard',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
