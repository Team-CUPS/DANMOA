import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'std_home5_model.dart';
export 'std_home5_model.dart';

class StdHome5Widget extends StatefulWidget {
  const StdHome5Widget({super.key});

  @override
  State<StdHome5Widget> createState() => _StdHome5WidgetState();
}

class _StdHome5WidgetState extends State<StdHome5Widget> {
  late StdHome5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdHome5Model());

    _model.stdMake3Tf02TextController ??= TextEditingController();
    _model.stdMake3Tf02FocusNode ??= FocusNode();

    _model.stdMake3Tf03TextController ??= TextEditingController();
    _model.stdMake3Tf03FocusNode ??= FocusNode();
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
              Icons.chevron_left,
              color: Color(0xFF0A0000),
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            '소개 변경',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 48.0, 0.0, 12.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        '소개글',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.stdMake3Tf02TextController,
                                          focusNode:
                                              _model.stdMake3Tf02FocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'pretendard',
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'pretendard',
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFADB3B2),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'pretendard',
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .stdMake3Tf02TextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        '채팅방 링크',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.stdMake3Tf03TextController,
                                          focusNode:
                                              _model.stdMake3Tf03FocusNode,
                                          autofocus: true,
                                          obscureText:
                                              !_model.stdMake3Tf03Visibility,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'pretendard',
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'pretendard',
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFADB3B2),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                () => _model
                                                        .stdMake3Tf03Visibility =
                                                    !_model
                                                        .stdMake3Tf03Visibility,
                                              ),
                                              focusNode: FocusNode(
                                                  skipTraversal: true),
                                              child: Icon(
                                                _model.stdMake3Tf03Visibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                size: 22,
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'pretendard',
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .stdMake3Tf03TextControllerValidator
                                              .asValidator(context),
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
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('stdMake3_btn_02 pressed ...');
                    },
                    text: '저장하기',
                    options: FFButtonOptions(
                      width: 320.0,
                      height: 45.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                      elevation: 3.0,
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
    );
  }
}
