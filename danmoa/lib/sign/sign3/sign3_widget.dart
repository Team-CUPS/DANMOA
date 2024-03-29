import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sign3_model.dart';
export 'sign3_model.dart';

class Sign3Widget extends StatefulWidget {
  const Sign3Widget({
    super.key,
    String? cond,
  }) : cond = cond ?? ' ';

  final String cond;

  @override
  State<Sign3Widget> createState() => _Sign3WidgetState();
}

class _Sign3WidgetState extends State<Sign3Widget> {
  late Sign3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Sign3Model());

    _model.sign3Tf01Controller ??= TextEditingController();
    _model.sign3Tf01FocusNode ??= FocusNode();

    _model.sign3Tf02Controller ??= TextEditingController();
    _model.sign3Tf02FocusNode ??= FocusNode();

    _model.sign3Tf03Controller ??=
        TextEditingController(text: dateTimeFormat('yMMMd', _model.datePicked));
    _model.sign3Tf03FocusNode ??= FocusNode();
    _model.sign3Tf03FocusNode!.addListener(() => setState(() {}));
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
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 80.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Align(
                                alignment: AlignmentDirectional(-0.07, 0.06),
                                child: Icon(
                                  Icons.circle,
                                  color: Color(0xFFDEE1E5),
                                  size: 16.0,
                                ),
                              ),
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
                                    '2',
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
                            ].divide(const SizedBox(width: 4.0)),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              '프로필 작성하기',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Text(
                          '이름, 생년월일은 추후 변경이 어렵습니다.',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'pretendard',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.sign3Tf01Controller,
                          focusNode: _model.sign3Tf01FocusNode,
                          autofocus: true,
                          autofillHints: const [AutofillHints.email],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: '이름',
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
                          validator: _model.sign3Tf01ControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 12.0, 16.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.sign3Tf02Controller,
                                  focusNode: _model.sign3Tf02FocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '닉네임',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'pretendard',
                                          color: const Color(0x7057636C),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'pretendard',
                                          color: const Color(0x7057636C),
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF375AC1),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 5.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'pretendard',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  textAlign: TextAlign.justify,
                                  minLines: null,
                                  validator: _model.sign3Tf02ControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 11.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: '중복체크',
                                options: FFButtonOptions(
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
                                  elevation: 0.0,
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
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 12.0, 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.sign3Tf03Controller,
                                    focusNode: _model.sign3Tf03FocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.sign3Tf03Controller',
                                      const Duration(milliseconds: 0),
                                      () => setState(() {}),
                                    ),
                                    autofocus: false,
                                    readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'pretendard',
                                            color: const Color(0x7057636C),
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      hintText: '생년월일',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'pretendard',
                                            color: const Color(0x7057636C),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFF375AC1),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'pretendard',
                                          color: const Color(0x7057636C),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    textAlign: TextAlign.justify,
                                    minLines: null,
                                    validator: _model
                                        .sign3Tf03ControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet<bool>(
                                        context: context,
                                        builder: (context) {
                                          final datePickedCupertinoTheme =
                                              CupertinoTheme.of(context);
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            child: CupertinoTheme(
                                              data: datePickedCupertinoTheme
                                                  .copyWith(
                                                textTheme:
                                                    datePickedCupertinoTheme
                                                        .textTheme
                                                        .copyWith(
                                                  dateTimePickerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily:
                                                                'pretendard',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                ),
                                              ),
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                                minimumDate: DateTime(1900),
                                                initialDateTime:
                                                    getCurrentTimestamp,
                                                maximumDate:
                                                    getCurrentTimestamp,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                use24hFormat: false,
                                                onDateTimeChanged:
                                                    (newDateTime) =>
                                                        safeSetState(() {
                                                  _model.datePicked =
                                                      newDateTime;
                                                }),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  text: '날짜선택',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'pretendard',
                                          color: const Color(0xFF375AC1),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    elevation: 0.0,
                                    borderSide: const BorderSide(
                                      color: Color(0xFF375AC1),
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
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                '성별',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowRadioButton(
                                options: ['남', '여'].toList(),
                                onChanged: (val) => setState(() {}),
                                controller: _model.sign3Rad01ValueController ??=
                                    FormFieldController<String>(null),
                                optionHeight: 32.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                selectedTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.horizontal,
                                radioButtonColor: const Color(0xFF375AC1),
                                inactiveRadioButtonColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                toggleable: true,
                                horizontalAlignment: WrapAlignment.start,
                                verticalAlignment: WrapCrossAlignment.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }

                        await currentUserReference!
                            .update(createUsersRecordData(
                          prfName: _model.sign3Tf01Controller.text,
                          displayName: _model.sign3Tf02Controller.text,
                          prfBirth: _model.datePicked,
                          prfGender: _model.sign3Rad01Value,
                        ));

                        context.pushNamed(
                          'sign4',
                          queryParameters: {
                            'dept': serializeParam(
                              '',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: '다음',
                      options: FFButtonOptions(
                        width: 300.0,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
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
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
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
