import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'sign4_sht01_model.dart';
export 'sign4_sht01_model.dart';

class Sign4Sht01Widget extends StatefulWidget {
  const Sign4Sht01Widget({super.key});

  @override
  State<Sign4Sht01Widget> createState() => _Sign4Sht01WidgetState();
}

class _Sign4Sht01WidgetState extends State<Sign4Sht01Widget> {
  late Sign4Sht01Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Sign4Sht01Model());
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
                      Icons.clear,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                  Text(
                    '전공선택',
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
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              '학부',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'pretendard',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.sign4Drp01ValueController ??=
                                  FormFieldController<String>(null),
                              options: const [
                                '문과대학 ',
                                '법과대학 ',
                                '사회과학대학 ',
                                '경영경제대학 ',
                                '공과대학 ',
                                'SW융합대학 ',
                                '사범대학 ',
                                '음악 · 예술대학 ',
                                '기타'
                              ],
                              onChanged: (val) =>
                                  setState(() => _model.sign4Drp01Value = val),
                              width: double.infinity,
                              height: 46.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'pretendard',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              hintText: '학부선택',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              '학과',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'pretendard',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.sign4Drp01Value == '문과대학 ')
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: const [
                                        ChipData('국어국문학과'),
                                        ChipData('사학과'),
                                        ChipData('철학과'),
                                        ChipData('영미영문학과')
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .sign4Cc02Value = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: const Color(0xFFB6B6B6),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: const Color(0xFFD9D9D9),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.sign4Cc02ValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                if (_model.sign4Drp01Value == '법과대학 ')
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: const [ChipData('법학과')],
                                      onChanged: (val) => setState(() => _model
                                          .sign4Cc03Value = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: const Color(0xFFB6B6B6),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: const Color(0xFFD9D9D9),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.sign4Cc03ValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                if (_model.sign4Drp01Value == '사회과학대학 ')
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: const [
                                        ChipData('정치외교학과'),
                                        ChipData('행정학과'),
                                        ChipData('도시계획 · 부동산학부'),
                                        ChipData('미디어커뮤니케이션학부'),
                                        ChipData('상담학과')
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .sign4Cc04Value = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: const Color(0xFFB6B6B6),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: const Color(0xFFD9D9D9),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.sign4Cc04ValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                if (_model.sign4Drp01Value == '경영경제대학 ')
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: const [
                                        ChipData('경제학과'),
                                        ChipData('무역학과'),
                                        ChipData('경영학부'),
                                        ChipData('산업경영학과'),
                                        ChipData('글로벌경영학과')
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .sign4Cc05Value = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: const Color(0xFFB6B6B6),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: const Color(0xFFD9D9D9),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.sign4Cc05ValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                if (_model.sign4Drp01Value == '공과대학 ')
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: const [
                                        ChipData('전자전기공학과'),
                                        ChipData('융합반도체공학과'),
                                        ChipData('고분자시스템공학부'),
                                        ChipData('토목환경공학과'),
                                        ChipData('기계공학과'),
                                        ChipData('화학공학과'),
                                        ChipData('건축학부')
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .sign4Cc06Value = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: const Color(0xFFB6B6B6),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: const Color(0xFFD9D9D9),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.sign4Cc06ValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                if (_model.sign4Drp01Value == 'SW융합대학 ')
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: const [
                                        ChipData('소프트웨어학과'),
                                        ChipData('컴퓨터공학과'),
                                        ChipData('모바일시스템공학과'),
                                        ChipData('통계데이터사이언스학과'),
                                        ChipData('사이버보안학과'),
                                        ChipData('SW융합학부')
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .sign4Cc07Value = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: const Color(0xFFB6B6B6),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: const Color(0xFFD9D9D9),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.sign4Cc07ValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                if (_model.sign4Drp01Value == '사범대학 ')
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: const [
                                        ChipData('한문교육과'),
                                        ChipData('특수교육과'),
                                        ChipData('수학교육과'),
                                        ChipData('과학교육과'),
                                        ChipData('체육교육과')
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .sign4Cc08Value = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: const Color(0xFFB6B6B6),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: const Color(0xFFD9D9D9),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.sign4Cc08ValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                if (_model.sign4Drp01Value == '음악 · 예술대학 ')
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: const [
                                        ChipData('도예과'),
                                        ChipData('디자인학부'),
                                        ChipData('공연영화학부'),
                                        ChipData('무용과'),
                                        ChipData('음악학부')
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .sign4Cc09Value = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: const Color(0xFFB6B6B6),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderColor: const Color(0xFFD9D9D9),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.sign4Cc09ValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                if (_model.sign4Drp01Value == '기타')
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      '없음',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'pretendard',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                if (_model.sign4Drp01Value == null ||
                                    _model.sign4Drp01Value == '')
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      '학부를 먼저 선택해주세요.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'pretendard',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.sign4Drp01Value != null &&
                              _model.sign4Drp01Value != '') {
                            if (_model.sign4Drp01Value == '기타') {
                              Navigator.pop(context, '기타');
                            } else {
                              Navigator.pop(
                                  context,
                                  '${_model.sign4Drp01Value}${() {
                                    if (_model.sign4Drp01Value == '문과대학 ') {
                                      return _model.sign4Cc02Value;
                                    } else if (_model.sign4Drp01Value ==
                                        '법과대학 ') {
                                      return _model.sign4Cc03Value;
                                    } else if (_model.sign4Drp01Value ==
                                        '사회과학대학 ') {
                                      return _model.sign4Cc04Value;
                                    } else if (_model.sign4Drp01Value ==
                                        '경영경제대학 ') {
                                      return _model.sign4Cc05Value;
                                    } else if (_model.sign4Drp01Value ==
                                        '공과대학 ') {
                                      return _model.sign4Cc06Value;
                                    } else if (_model.sign4Drp01Value ==
                                        'SW융합대학 ') {
                                      return _model.sign4Cc07Value;
                                    } else if (_model.sign4Drp01Value ==
                                        '사범대학 ') {
                                      return _model.sign4Cc08Value;
                                    } else if (_model.sign4Drp01Value ==
                                        '음악 · 예술대학 ') {
                                      return _model.sign4Cc09Value;
                                    } else {
                                      return 'err';
                                    }
                                  }()}');
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: const Text('학부/학과를 선택해주세요.'),
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
                        text: '확인',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 45.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                          borderRadius: BorderRadius.circular(12.0),
                        ),
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
