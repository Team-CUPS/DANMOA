import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'qa3_model.dart';
export 'qa3_model.dart';
import 'package:danmoa/backend/backend.dart';


class Qa3Widget extends StatefulWidget {
  const Qa3Widget({super.key,});


  @override
  State<Qa3Widget> createState() => _Qa3WidgetState();
}

class _Qa3WidgetState extends State<Qa3Widget> with TickerProviderStateMixin {
  late Qa3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Qa3Model());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 110.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            '답변 리스트',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'pretendard',
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        FutureBuilder<List<Map<String, dynamic>>>(
                          future: loadFilteredQAData(),
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
                                  final qa = snapshot.data![index];
                                  logger.i(qa);

                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var result = await context.pushNamed(
                                          'QA4',
                                          queryParameters: {
                                            'usr_input_txt': serializeParam(qa['usr_input_txt'], ParamType.String),
                                            'ai_output': serializeParam(qa['ai_output'], ParamType.String),
                                          }.withoutNulls,
                                          
                                          );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 500.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                          borderRadius: BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context).alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                qa['usr_input_txt'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                  fontFamily: 'Pretendard',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
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
