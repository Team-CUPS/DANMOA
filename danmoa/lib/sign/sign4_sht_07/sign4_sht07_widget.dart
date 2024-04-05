import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'sign4_sht07_model.dart';
export 'sign4_sht07_model.dart';

class Sign4Sht07Widget extends StatefulWidget {
  const Sign4Sht07Widget({super.key});

  @override
  State<Sign4Sht07Widget> createState() => _Sign4Sht07WidgetState();
}

class _Sign4Sht07WidgetState extends State<Sign4Sht07Widget> {
  late Sign4Sht07Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Sign4Sht07Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 50.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                  Text(
                    '공과대학',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'pretendard',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: ListView(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'sign4',
                          queryParameters: {
                            'dept': serializeParam(
                              '전자전기공학과',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: '전자전기공학과',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'pretendard',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'sign4',
                          queryParameters: {
                            'dept': serializeParam(
                              '융합반도체공학과',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: '융합반도체공학과',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'pretendard',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'sign4',
                          queryParameters: {
                            'dept': serializeParam(
                              '고분자시스템공학부',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: '고분자시스템공학부',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'pretendard',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'sign4',
                          queryParameters: {
                            'dept': serializeParam(
                              '토목환경공학과',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: '토목환경공학과',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'pretendard',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'sign4',
                          queryParameters: {
                            'dept': serializeParam(
                              '기계공학과',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: '기계공학과',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'pretendard',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'sign4',
                          queryParameters: {
                            'dept': serializeParam(
                              '화학공학과',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: '화학공학과',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'pretendard',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'sign4',
                          queryParameters: {
                            'dept': serializeParam(
                              '건축학부',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: '건축학부',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'pretendard',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
