import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'std_make2_model.dart';
export 'std_make2_model.dart';

class StdMake2Widget extends StatefulWidget {
  const StdMake2Widget({
    super.key,
    required this.stdName,
  });

  final String? stdName;

  @override
  State<StdMake2Widget> createState() => _StdMake2WidgetState();
}

class _StdMake2WidgetState extends State<StdMake2Widget> {
  late StdMake2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdMake2Model());
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
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            '스터디 만들기',
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '학력',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'pretendard',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            FlutterFlowChoiceChips(
                              options: const [
                                ChipData('1학년'),
                                ChipData('2학년'),
                                ChipData('3학년'),
                                ChipData('4학년')
                              ],
                              onChanged: (val) => setState(() =>
                                  _model.stdMake2Cc01Value = val?.firstOrNull),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).accent2,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).secondary,
                                borderWidth: 2.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 8.0,
                              multiselect: false,
                              initialized: _model.stdMake2Cc01Value != null,
                              alignment: WrapAlignment.start,
                              controller: _model.stdMake2Cc01ValueController ??=
                                  FormFieldController<List<String>>(
                                ['1학년'],
                              ),
                              wrapped: true,
                            ),
                          ]
                              .divide(const SizedBox(height: 12.0))
                              .addToEnd(const SizedBox(height: 32.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '시간대',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'pretendard',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            FlutterFlowChoiceChips(
                              options: const [
                                ChipData('아침'),
                                ChipData('점심'),
                                ChipData('저녁'),
                                ChipData('밤')
                              ],
                              onChanged: (val) => setState(
                                  () => _model.stdMake2Cc02Values = val),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).accent2,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).secondary,
                                borderWidth: 2.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 8.0,
                              multiselect: true,
                              initialized: _model.stdMake2Cc02Values != null,
                              alignment: WrapAlignment.start,
                              controller: _model.stdMake2Cc02ValueController ??=
                                  FormFieldController<List<String>>(
                                [],
                              ),
                              wrapped: true,
                            ),
                          ]
                              .divide(const SizedBox(height: 12.0))
                              .addToEnd(const SizedBox(height: 32.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '분야',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'pretendard',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: FlutterFlowChoiceChips(
                                options: const [
                                  ChipData('문학·문예'),
                                  ChipData('네이밍·슬로건'),
                                  ChipData('과학·공학·기술'),
                                  ChipData('IT·소프트웨어·게임'),
                                  ChipData('디자인·캐릭터·웹툰'),
                                  ChipData('음악·가요·댄스·무용'),
                                  ChipData('산업·사회·건축·관광·창업')
                                ],
                                onChanged: (val) => setState(
                                    () => _model.stdMake2Cc03Values = val),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: const Color(0xFFBFC4CD),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderWidth: 2.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderWidth: 2.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                chipSpacing: 8.0,
                                rowSpacing: 8.0,
                                multiselect: true,
                                initialized: _model.stdMake2Cc03Values != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.stdMake2Cc03ValueController ??=
                                        FormFieldController<List<String>>(
                                  [],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ]
                              .divide(const SizedBox(height: 12.0))
                              .addToEnd(const SizedBox(height: 32.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 40.0, 0.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(
                              'stdMake3',
                              queryParameters: {
                                'stdName': serializeParam(
                                  widget.stdName,
                                  ParamType.String,
                                ),
                                'stdPosition': serializeParam(
                                  _model.stdMake2Cc01Value,
                                  ParamType.String,
                                ),
                                'stdTimes': serializeParam(
                                  _model.stdMake2Cc02Values,
                                  ParamType.String,
                                  true,
                                ),
                                'stdField': serializeParam(
                                  _model.stdMake2Cc03Values,
                                  ParamType.String,
                                  true,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: '다음',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 45.0,
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
                            borderRadius: BorderRadius.circular(8.0),
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
      ),
    );
  }
}
