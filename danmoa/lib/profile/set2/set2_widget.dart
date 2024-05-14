import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/sign/sign4_sht_01/sign4_sht01_widget.dart';
import 'package:flutter/material.dart';
import 'package:danmoa/backend/backend.dart';

import 'set2_model.dart';
export 'set2_model.dart';

class Set2Widget extends StatefulWidget {
  const Set2Widget({super.key});

  @override
  State<Set2Widget> createState() => _Set2WidgetState();
}

class _Set2WidgetState extends State<Set2Widget> {
  late Set2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  XFile? returnedImg;
  XFile? _imageFile;
  Map<String, dynamic> userData = {};
  bool isLoading = true;
  bool isPickedImg = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Set2Model());

    _model.displayNameTextController ??= TextEditingController();
    _model.displayNameFocusNode ??= FocusNode();

    _model.introTextController ??= TextEditingController();
    _model.introFocusNode ??= FocusNode();
    initData();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> initData() async {
    var loadedCurrentUserData = await loadUserDataByUid(currentUserUid);
    isLoading = false;
    setState(() {
      userData = loadedCurrentUserData;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Container(
          color: Colors.black.withOpacity(0.5), // 반투명 배경
          child: const Center(
            child: CircularProgressIndicator(), // 로딩 인디케이터
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: const Icon(
              Icons.chevron_left,
              color: Color(0xFF0A0000),
              size: 30,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0,
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
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFFBDBDBD),
                                    ),
                                    image: isPickedImg == false
                                    ? DecorationImage(
                                        image: NetworkImage(userData['photo_url'] ?? 'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/users%2Fdefault%2F1000000036.jpg?alt=media&token=e89a0182-6090-465d-8065-ee98fc2c7c35'),
                                        fit: BoxFit.cover,
                                      )
                                    : DecorationImage(
                                        image: FileImage(File(_imageFile!.path)),
                                        fit: BoxFit.cover,
                                      ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, -1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 32),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    returnedImg = await getImageFromGallery();

                                    setState(() {
                                      if (returnedImg != null ){
                                        isPickedImg = true;
                                      }
                                      _imageFile = returnedImg;
                                    });
                                  },
                                  text: '프로필 사진 편집',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'pretendard',
                                          letterSpacing: 0,
                                          useGoogleFonts: false,
                                        ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 16, 16),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.displayNameTextController,
                                          focusNode:
                                              _model.displayNameFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: '닉네임',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'pretendard',
                                                      color: const Color(0x7057636C),
                                                      letterSpacing: 0,
                                                      useGoogleFonts: false,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'pretendard',
                                                      color: const Color(0x7057636C),
                                                      fontSize: 25,
                                                      letterSpacing: 0,
                                                      useGoogleFonts: false,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF375AC1),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 5),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'pretendard',
                                                fontSize: 14,
                                                letterSpacing: 0,
                                                useGoogleFonts: false,
                                              ),
                                          textAlign: TextAlign.justify,
                                          validator: _model
                                              .displayNameTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 11),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '중복체크',
                                        options: FFButtonOptions(
                                          height: 40,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24, 0, 24, 0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          color: const Color(0xFF375AC1),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'pretendard',
                                                    color: Colors.white,
                                                    letterSpacing: 0,
                                                    useGoogleFonts: false,
                                                  ),
                                          elevation: 0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(50),
                                            bottomRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: TextFormField(
                                controller: _model.introTextController,
                                focusNode: _model.introFocusNode,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: '자기소개',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: const Color(0x7057636C),
                                        letterSpacing: 0,
                                        useGoogleFonts: false,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: const Color(0x7057636C),
                                        letterSpacing: 0,
                                        useGoogleFonts: false,
                                      ),
                                  errorStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'pretendard',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        letterSpacing: 0,
                                        useGoogleFonts: false,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF375AC1),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      letterSpacing: 0,
                                      useGoogleFonts: false,
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primary,
                                validator: _model.introTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1, 0),
                                    child: Text(
                                      '학과',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'pretendard',
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 8, 0),
                                      child: Container(
                                        width: 150,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.dept,
                                                '학과를 선택해주세요.',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'pretendard',
                                                        letterSpacing: 0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 16, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: const SizedBox(
                                                  height: 400,
                                                  child: Sign4Sht01Widget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(
                                            () => _model.dept = value));

                                        setState(() {});
                                      },
                                      text: '학과찾기',
                                      options: FFButtonOptions(
                                        height: 40,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 24, 0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'pretendard',
                                              color: const Color(0xFF375AC1),
                                              fontSize: 16,
                                              letterSpacing: 0,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 0,
                                        borderSide: const BorderSide(
                                          color: Color(0xFF375AC1),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50),
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1, 0),
                                    child: Text(
                                      '학력',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'pretendard',
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          19, 8, 0, 0),
                                      child: FlutterFlowChoiceChips(
                                        options: const [
                                          ChipData('1학년'),
                                          ChipData('2학년'),
                                          ChipData('3학년'),
                                          ChipData('4학년'),
                                          ChipData('휴학'),
                                          ChipData('졸업'),
                                          ChipData('석사생'),
                                          ChipData('박사생'),
                                          ChipData('교수/강사'),
                                          ChipData('기타')
                                        ],
                                        onChanged: (val) => setState(() =>
                                            _model.positionValue =
                                                val?.firstOrNull),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'pretendard',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          iconSize: 18,
                                          labelPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          elevation: 0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderWidth: 1,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'pretendard',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0,
                                                useGoogleFonts: false,
                                              ),
                                          iconColor: const Color(0xFFB6B6B6),
                                          iconSize: 18,
                                          labelPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          elevation: 0,
                                          borderColor: const Color(0xFFD9D9D9),
                                          borderWidth: 1,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        chipSpacing: 8,
                                        rowSpacing: 8,
                                        multiselect: false,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .positionValueController ??=
                                            FormFieldController<List<String>>(
                                          [],
                                        ),
                                        wrapped: true,
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
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
                  child: FFButtonWidget(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '프로필 수정중...',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          duration: const Duration(milliseconds: 2000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                      );

                      // _model.introTextController
                      String? photoUrl = await storeStudyImageToStorage(returnedImg?.path, currentUserUid)?? "";
                      await updateProfile(currentUserUid, _model.displayNameTextController.text, _model.dept ?? "", _model.positionValue ?? "", photoUrl);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '프로필 수정 완료!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                      );


                      context.pop();
                    },
                    text: '수정완료',
                    options: FFButtonOptions(
                      width: 320,
                      height: 45,
                      padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: const Color(0xFF375AC1),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'pretendard',
                                color: Colors.white,
                                letterSpacing: 0,
                                useGoogleFonts: false,
                              ),
                      elevation: 0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
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
