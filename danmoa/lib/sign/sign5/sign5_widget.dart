import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'sign5_model.dart';
export 'sign5_model.dart';

class Sign5Widget extends StatefulWidget {
  const Sign5Widget({super.key});

  @override
  State<Sign5Widget> createState() => _Sign5WidgetState();
}

class _Sign5WidgetState extends State<Sign5Widget> {
  late Sign5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Sign5Model());
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    '\thttps://cdn.pixabay.com/photo/2016/09/30/08/13/christmas-1704641_1280.jpg',
                    width: 210.0,
                    height: 280.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  '가입완료!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        fontSize: 36.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  '단국대 이메일로 인증 링크를 보냈습니다.\n확인하여 계정 활성화 후 로그인 부탁드립니다.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto Condensed',
                        color: const Color(0x8014181B),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(30.0, 150.0, 30.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('sign1');
                    },
                    text: '로그인 하러 가기',
                    options: FFButtonOptions(
                      width: 400.0,
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
    );
  }
}
