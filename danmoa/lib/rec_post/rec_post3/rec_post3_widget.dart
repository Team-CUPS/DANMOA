import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'rec_post3_model.dart';
export 'rec_post3_model.dart';

class RecPost3Widget extends StatefulWidget {
  const RecPost3Widget({super.key});

  @override
  State<RecPost3Widget> createState() => _RecPost3WidgetState();
}

class _RecPost3WidgetState extends State<RecPost3Widget> {
  late RecPost3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecPost3Model());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 15.0, 5.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.more_vert,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 86.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Text(
                            '제목',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'pretendard',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.remove_red_eye,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '조회수',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.mode_comment,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 18.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '댓글수',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
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
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Container(
                  width: double.infinity,
                  height: 59.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 45.0,
                        height: 45.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://picsum.photos/seed/184/600',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        child: Text(
                          'YunhoChoi',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'yyyy.mm.dd',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Text(
                                '36.5 ℃',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Icon(
                                Icons.emoji_emotions,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Container(
                  width: double.infinity,
                  height: 216.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: '내용',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'pretendard',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'pretendard',
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
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                      minLines: null,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Text(
                      '정보',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'pretendard',
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                              ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F8FF),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://picsum.photos/seed/126/600',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F8FF),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            '0 0 명\n  인원',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'pretendard',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F8FF),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://picsum.photos/seed/126/600',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 160.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F8FF),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          '0 0 원\n  회비',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F8FF),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 5.0),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/126/600',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            '스터디 이름',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'pretendard',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: '1:1 메세지로 신청',
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'pretendard',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
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
