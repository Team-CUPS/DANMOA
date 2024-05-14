import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'contest1_model.dart';
export 'contest1_model.dart';

class Contest1Widget extends StatefulWidget {
  const Contest1Widget({super.key});

  @override
  State<Contest1Widget> createState() => _Contest1WidgetState();
}

class _Contest1WidgetState extends State<Contest1Widget> {
  late Contest1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Contest1Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _sendDataAndGetResponse() async {
    var response = await http.post(
      Uri.parse('https://port-0-danmoa-crawserver-rccln2llw1oo1v6.sel5.cloudtype.app/crawl'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "field": _model.tfFieldValue,
        "person": _model.tfPersonValue,
        "sort": _model.tfStateValue,
        "area": _model.tfAreaValue
      }),
    );

    if (response.statusCode == 200) {
      var body = utf8.decode(response.bodyBytes);
      var data = json.decode(body) as Map<String, dynamic>;
      if (data['status'].toString() == "success"){
        print("Response Data : $data");
        context.pushNamed(
          'contest2',
          queryParameters: {
            'contents': serializeParam(
              data,
              ParamType.JSON,
            )
          }, 
        );
      }
      else {
        context.pushNamed('contest3');
      }
    }
    else {
      // Handle network error
      print('Failed to connect to the server');
    }
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
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: Text(
                      '스터디 목표를 정하셨다면,',
                      textAlign: TextAlign.justify,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'pretendard',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 14.0),
                    child: Text(
                      '원하는 공모전에 도전해보세요!',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'pretendard',
                            fontSize: 21.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.tfFieldValueController ??=
                              FormFieldController<String>(null),
                          options: const [
                            '문학/문예',
                            '경시/학문/논문',
                            '과학/공학/기술',
                            'IT/소프트웨어/게임',
                            '그림/미술',
                            '디자인/캐릭터/웹툰',
                            '음악/가요/댄스/무용',
                            '아이디어/제안',
                            '산업/사회/건축/관광/창업'
                          ],
                          onChanged: (val) =>
                              setState(() => _model.tfFieldValue = val),
                          width: double.infinity,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          hintText: '분야',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 15.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.tfPersonValueController ??=
                              FormFieldController<String>(null),
                          options: const ['전체', '대학생', '대학원생', '일반인', '외국인'],
                          onChanged: (val) =>
                              setState(() => _model.tfPersonValue = val),
                          width: double.infinity,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          hintText: '대상',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 15.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.tfStateValueController ??=
                              FormFieldController<String>(null),
                          options: const ['전체', '접수예정', '접수중'],
                          onChanged: (val) =>
                              setState(() => _model.tfStateValue = val),
                          width: double.infinity,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          hintText: '모집상태',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 15.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 12.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.tfAreaValueController ??=
                              FormFieldController<String>(null),
                          options: const [
                            '전국',
                            '온라인',
                            '서울',
                            '경기/인천',
                            '대전/세종/충북/충남',
                            '광주/전북/전남',
                            '대구/경북',
                            '부산/울산/경남',
                            '강원',
                            '제주'
                          ],
                          onChanged: (val) =>
                              setState(() => _model.tfAreaValue = val),
                          width: double.infinity,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          hintText: '지역',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 15.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 64.0),
                    child: FFButtonWidget(
                      onPressed: _sendDataAndGetResponse,
                      text: '검색',
                      options: FFButtonOptions(
                        width: 320.0,
                        height: 45.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
      ),
    );
  }
}
