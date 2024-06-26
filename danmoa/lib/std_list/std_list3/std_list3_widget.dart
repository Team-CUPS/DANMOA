import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'std_list3_model.dart';
export 'std_list3_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';

class StdList3Widget extends StatefulWidget {
  const StdList3Widget({super.key});

  @override
  State<StdList3Widget> createState() => _StdList3WidgetState();
}

class _StdList3WidgetState extends State<StdList3Widget> {
  late StdList3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String filter = '';
  List<Map<String, dynamic>> studyData = [];
  final FirebaseService _firebaseService = FirebaseService.instance;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdList3Model());
    _model.stdList3Tf01TextController ??= TextEditingController();
    _model.stdList3Tf01FocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> initStudyData() async {
    return await _firebaseService.getStudyData(2); // 1: created time DESC, 2: updated time DESC
  }

  Future<List<Map<String, dynamic>>> getFilteredSearchStudyData(String filter) async {
    return _firebaseService.getFilteredSearchStudyData(studyData, filter);
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: FlutterFlowIconButton(
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
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.75,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                            border: Border.all(
                              color: const Color(0x7914181B),
                            ),
                          ),
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0, 12.0, 0),
                            child: TextFormField(
                              controller: _model.stdList3Tf01TextController,
                              focusNode: _model.stdList3Tf01FocusNode,
                              autofocus: true,
                              obscureText: false,
                              onChanged: (value) {
                                setState(() {
                                  filter = value;
                                });
                              },
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'pretendard',
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                hintText: '스터디 이름 검색 ',
                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                      fontFamily: 'pretendard',
                                      color: const Color(0x7057636C),
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              validator: _model.stdList3Tf01TextControllerValidator.asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: initStudyData(),
                builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> studySnapshot) {
                  if (studySnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (studySnapshot.hasError) {
                    return Text('오류 발생: ${studySnapshot.error}');
                  } else if (studySnapshot.hasData) {
                    studyData = studySnapshot.data!;
                    return FutureBuilder<List<Map<String, dynamic>>>(
                      future: getFilteredSearchStudyData(filter),
                      builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> filteredSnapshot) {
                        if (filteredSnapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (filteredSnapshot.hasError) {
                          return Text('오류 발생: ${filteredSnapshot.error}');
                        } else {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: filteredSnapshot.data!.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              var study = filteredSnapshot.data![index];
                              String stdName = study['std_name'];
                              String stdField = study['std_field'];
                              String stdPrfPicture = _firebaseService.getStudyPhotoUrl(study['std_prf_picture']);
                              String stdPeopleNums = study['std_members'] != null ? (study['std_members'].length + 1).toString() : '1';
                              return Container(
                                width: double.infinity,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
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
                                                  stdName, // 실제 데이터 사용
                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                        fontFamily: 'Pretendard',
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
                                                    stdField, // 실제 데이터 사용
                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                          fontFamily: 'Pretendard',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  Text(
                                                    ' / 팀원 $stdPeopleNums명 ', // 실제 데이터 사용
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: 'Pretendard',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
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
                    );
                  } else {
                    return const Center(child: Text('데이터가 없습니다.'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
