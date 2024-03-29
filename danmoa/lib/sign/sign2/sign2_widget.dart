import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sign2_model.dart';
export 'sign2_model.dart';

class Sign2Widget extends StatefulWidget {
  const Sign2Widget({super.key});

  @override
  State<Sign2Widget> createState() => _Sign2WidgetState();
}

class _Sign2WidgetState extends State<Sign2Widget> {
  late Sign2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Sign2Model());

    _model.sign2Tf01Controller ??= TextEditingController();
    _model.sign2Tf01FocusNode ??= FocusNode();

    _model.sign2Tf02Controller ??= TextEditingController();
    _model.sign2Tf02FocusNode ??= FocusNode();

    _model.sign2Tf03Controller ??= TextEditingController();
    _model.sign2Tf03FocusNode ??= FocusNode();
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
            icon: const FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Color(0xFF0A0000),
              size: 25.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxWidth: 430.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                '1',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          const Align(
                            alignment: AlignmentDirectional(-0.07, 0.06),
                            child: Icon(
                              Icons.circle,
                              color: Color(0xFFDEE1E5),
                              size: 16.0,
                            ),
                          ),
                          const Align(
                            alignment: AlignmentDirectional(-0.07, 0.06),
                            child: Icon(
                              Icons.circle,
                              color: Color(0xFFDEE1E5),
                              size: 16.0,
                            ),
                          ),
                        ].divide(const SizedBox(width: 4.0)),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          '계정 입력하기',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
                      child: Text(
                        '단국대 이메일만 사용 가능합니다. (dankook.ac.kr)',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'pretendard',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.sign2Tf01Controller,
                          focusNode: _model.sign2Tf01FocusNode,
                          autofocus: true,
                          autofillHints: const [AutofillHints.email],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: '이메일',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'pretendard',
                                  color: const Color(0x7057636C),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF375AC1),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          minLines: null,
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.sign2Tf01ControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.sign2Tf02Controller,
                          focusNode: _model.sign2Tf02FocusNode,
                          autofocus: true,
                          autofillHints: const [AutofillHints.password],
                          obscureText: !_model.sign2Tf02Visibility,
                          decoration: InputDecoration(
                            labelText: '비밀번호',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'pretendard',
                                  color: const Color(0x7057636C),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF375AC1),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.sign2Tf02Visibility =
                                    !_model.sign2Tf02Visibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.sign2Tf02Visibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          minLines: null,
                          validator: _model.sign2Tf02ControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.sign2Tf03Controller,
                          focusNode: _model.sign2Tf03FocusNode,
                          autofocus: true,
                          autofillHints: const [AutofillHints.password],
                          obscureText: !_model.sign2Tf03Visibility,
                          decoration: InputDecoration(
                            labelText: '비밀번호 확인',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'pretendard',
                                  color: const Color(0x7057636C),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF375AC1),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.sign2Tf03Visibility =
                                    !_model.sign2Tf03Visibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.sign2Tf03Visibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          validator: _model.sign2Tf03ControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 30.0, 0.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if ((String emailVar) {
                              return emailVar.contains("dankook.ac.kr");
                            }(_model.sign2Tf01Controller.text)) {
                              GoRouter.of(context).prepareAuthEvent();
                              if (_model.sign2Tf02Controller.text !=
                                  _model.sign2Tf03Controller.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Passwords don\'t match!',
                                    ),
                                  ),
                                );
                                return;
                              }

                              final user =
                                  await authManager.createAccountWithEmail(
                                context,
                                _model.sign2Tf01Controller.text,
                                _model.sign2Tf02Controller.text,
                              );
                              if (user == null) {
                                return;
                              }

                              await authManager.sendEmailVerification();

                              context.pushNamedAuth('sign3', context.mounted);
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('이메일 오류'),
                                    content:
                                        const Text('단국대 이메일이 아닌 이메일은 사용 불가능합니다.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('확인'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          text: '다음',
                          options: FFButtonOptions(
                            width: 300.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF375AC1),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
