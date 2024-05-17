import 'package:auto_size_text/auto_size_text.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'contest2_model.dart';
export 'contest2_model.dart';

class Contest2Widget extends StatefulWidget {
  const Contest2Widget({
    super.key,
    required this.contents,
  });

  final Map<String, dynamic> contents;

  @override
  State<Contest2Widget> createState() => _Contest2WidgetState();
}

class _Contest2WidgetState extends State<Contest2Widget> {
  late Contest2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Contest2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic>? items = (widget.contents['contents'] as List<dynamic>?)!;
    print("Get Data : $items");

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).black,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding( // 리스트뷰 시작
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: (context, index){
                      return Padding( // 컨테이너 시작
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(
                                '${items[index][0]}');
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 1,
                            child: Container(
                              width: 100,
                              height: 90,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    offset: Offset(
                                      0,
                                      1,
                                    ),
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 0, 0),
                                      child: AutoSizeText(
                                        '${items[index][1]}',
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'pretendard',
                                              fontSize: 14,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w800,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 10, 0, 8),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '주최',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'pretendard',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                6, 3, 0, 0),
                                                    child: AutoSizeText(
                                                      '${items[index][2]}',
                                                      softWrap: false,
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'pretendard',
                                                            color: Color(
                                                                0xAE57636C),
                                                            fontSize: 12,
                                                            letterSpacing: 0,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 2, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '대상',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'pretendard',
                                                            fontSize: 12,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6, 3, 0, 0),
                                                      child: Text(
                                                        '${items[index][3]}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'pretendard',
                                                              color: Color(
                                                                  0xAE57636C),
                                                              fontSize: 12,
                                                              letterSpacing: 0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 16, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '접수',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'pretendard',
                                                        color:
                                                            Color(0xFF0019F4),
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(6, 2, 0, 0),
                                                  child: Text(
                                                    '${items[index][4]}',
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'pretendard',
                                                          fontSize: 12,
                                                          letterSpacing: 0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 2, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '심사',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'pretendard',
                                                          color:
                                                              Color(0xFF66BB6A),
                                                          fontSize: 12,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 2, 0, 0),
                                                    child: Text(
                                                      '${items[index][5]}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'pretendard',
                                                            fontSize: 12,
                                                            letterSpacing: 0,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ); // 컨테이너 종료
                    },
                  ),
                ), // 리스트뷰 종료
                // 아래부터 임시 테스트 출력 코드
                /*
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 12.0, 12.0, 12.0),
                    child: Text(
                      "현재 임시테스트중 : POST response중 첫번째거만 임시로 표시합니다.",
                      style: FlutterFlowTheme.of(context)
                        .titleLarge
                        .override(
                          fontFamily: 'pretendard',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),),
                ),
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 12.0, 12.0, 12.0),
                    child: Text(first[0].toString()),
                ),
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 12.0, 12.0, 12.0),
                    child: Text(first[1].toString()),
                ),
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 12.0, 12.0, 12.0),
                    child: Text(first[2].toString()),
                ),
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 12.0, 12.0, 12.0),
                    child: Text(first[3].toString()),
                ),
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 12.0, 12.0, 12.0),
                    child: Text(first[4].toString()),
                ),
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 12.0, 12.0, 12.0),
                    child: Text(first[5].toString()),
                ),  */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
