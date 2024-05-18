import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/sign/sign4_sht_01/sign4_sht01_widget.dart';
import 'package:flutter/material.dart';
import 'package:danmoa/backend/service/firebase_service.dart';
import '/profile/photo_sht_prf/photo_sht_prf_widget.dart';
import '/profile/dup_sht_prf/dup_sht_prf_widget.dart';
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

  final FirebaseService _firebaseService = FirebaseService.instance;
  XFile? returnedXfileImg;
  String? returnedStringImg;
  bool isPickedImg = false;
  String displayName = '';
  bool isInit = true;
  late Future<Map<String, dynamic>> _loadDataFuture;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Set2Model());

    _model.introTextController ??= TextEditingController();
    _model.introFocusNode ??= FocusNode();

    _loadDataFuture = _loadData();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> _loadData() async {
    var loadedCurrentUserData = await _firebaseService.getUserDataByUid(currentUserUid);
    return loadedCurrentUserData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _loadDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('오류 발생: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('데이터가 없습니다.'),
          );
        }

        final userData = snapshot.data!;
        if (isInit) {
          displayName = userData['display_name'] ?? '';
          _model.introTextController.text = userData['prf_intro'] ?? '';
          returnedStringImg = userData['photo_url'];
          _model.dept = userData['prf_major'];
          isInit = false;
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
                                                image: NetworkImage(_firebaseService.getUserPhotoUrl(returnedStringImg)),
                                                fit: BoxFit.cover,
                                              )
                                            : DecorationImage(
                                                image: FileImage(File(returnedXfileImg!.path)),
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, -1),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 32),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model
                                                      .unfocusNode.canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding: MediaQuery.viewInsetsOf(
                                                    context),
                                                child: PhotoShtPrfWidget(
                                                  isPickedImgSht: isPickedImg,
                                                  shtXfileImg: returnedXfileImg,
                                                  shtStringImg: returnedStringImg,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((result) {
                                          isPickedImg = result['isPickedImgSht'];
                                          returnedXfileImg = result['shtXfileImg'];
                                          returnedStringImg = result['shtStringImg'];

                                          setState(() {});
                                        });
                                      },
                                      text: '프로필 사진 편집',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'pretendard',
                                              letterSpacing: 0,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '닉네임',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'pretendard',
                                              letterSpacing: 0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 8, 16),
                                          child: Container(
                                            width: 120,
                                            height: 42,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(context).alternate,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 8, 10),
                                              child: Text(
                                                displayName,
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: 'pretendard',
                                                      color: FlutterFlowTheme.of(context).black,
                                                      fontSize: 14,
                                                      letterSpacing: 0,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 11),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor: Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => _model.unfocusNode.canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model.unfocusNode)
                                                        : FocusScope.of(context).unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery.viewInsetsOf(context),
                                                      child: const DupShtPrfWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(() {
                                                if (value != null && value is String) {
                                                  setState(() {
                                                    displayName = value;
                                                  });
                                                }
                                              }));
                                            },
                                            text: '변경',
                                            options: FFButtonOptions(
                                              height: 40,
                                              padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                                              color: const Color(0xFF375AC1),
                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '소개 ',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'pretendard',
                                            letterSpacing: 0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 12),
                                        child: TextFormField(
                                          controller: _model.introTextController,
                                          focusNode: _model.introFocusNode,
                                          textCapitalization: TextCapitalization.sentences,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '자기소개',
                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                  fontFamily: 'pretendard',
                                                  color: const Color(0x7057636C),
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  useGoogleFonts: false,
                                                ),
                                            errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'pretendard',
                                                  color: FlutterFlowTheme.of(context).error,
                                                  letterSpacing: 0,
                                                  useGoogleFonts: false,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(context).alternate,
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
                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                            contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 24, 0, 24),
                                          ),
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'pretendard',
                                                letterSpacing: 0,
                                                useGoogleFonts: false,
                                              ),
                                          textAlign: TextAlign.start,
                                          maxLines: 3,
                                          cursorColor: FlutterFlowTheme.of(context).primary,
                                          validator: _model.introTextControllerValidator.asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(-1, 0),
                                        child: Text(
                                          '학과',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
                                          child: Container(
                                            width: 150,
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight: Radius.circular(12),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(context).alternate,
                                                width: 2,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model.dept,
                                                    userData['prf_major'],
                                                  ),
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontFamily: 'pretendard',
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor: Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model.unfocusNode.canRequestFocus
                                                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                      : FocusScope.of(context).unfocus(),
                                                  child: Padding(
                                                    padding: MediaQuery.viewInsetsOf(context),
                                                    child: const SizedBox(
                                                      height: 550.0,
                                                      child: Sign4Sht01Widget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(() => _model.dept = value));

                                            setState(() {});
                                          },
                                          text: '학과찾기',
                                          options: FFButtonOptions(
                                            height: 40,
                                            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(-1, 0),
                                        child: Text(
                                          '학력',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                          padding: const EdgeInsetsDirectional.fromSTEB(19, 8, 0, 0),
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
                                            onChanged: (val) => setState(() => _model.positionValue = val?.firstOrNull),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'pretendard',
                                                    color: FlutterFlowTheme.of(context).primary,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                              iconColor: FlutterFlowTheme.of(context).primaryText,
                                              iconSize: 18,
                                              labelPadding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                              elevation: 0,
                                              borderColor: FlutterFlowTheme.of(context).primary,
                                              borderWidth: 1,
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'pretendard',
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                    letterSpacing: 0,
                                                    useGoogleFonts: false,
                                                  ),
                                              iconColor: const Color(0xFFB6B6B6),
                                              iconSize: 18,
                                              labelPadding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                              elevation: 0,
                                              borderColor: const Color(0xFFD9D9D9),
                                              borderWidth: 1,
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            chipSpacing: 8,
                                            rowSpacing: 8,
                                            multiselect: false,
                                            alignment: WrapAlignment.start,
                                            controller: _model.positionValueController ??= FormFieldController<List<String>>(
                                              [userData['prf_position']],
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
                      child: ElevatedButton(
                        onPressed: () async {
                          //***저장할 때 isPickedImg가 false인 경우***//
                          // 1. 페이지 들어와서 앨범이나 촬영으로 사진을 선택한 경험이 없는 경우
                          // 2. 마지막으로 선택한게 기본 이미지 적용인 경우

                          //***2번의 경우는 똑같이 두 가지로 나뉨***//
                          // 1. 페이지 들어와서 앨범이나 촬영으로 사진을 선택한 경험이 없는 경우
                          // 2. 마지막으로 선택한게 기본 이미지 적용인 경우

                          //***만약 2-2인 경우, returnedImg는 null값이 아닌 XFile값이 할당된 상태***//
                          // 따라서, isPickedImg가 false인 경우 예외처리를 해주어야 함
                          // if isPickedImg == null, then returnedImg = null;
                          if(displayName == "" || _model.dept == "" ||  _model.positionValue == "") {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("경고"),
                                  content: const Text("모든 정보를 입력해주세요.(소개 제외)"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("확인"),
                                      onPressed: () {
                                        Navigator.of(context).pop();  // 대화 상자 닫기
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            return;  // 함수 실행 중지
                          }
                          
                          if (isPickedImg == false) {
                            logger.w('isPickedImg == false');
                            await _firebaseService.updateProfile(currentUserUid, displayName, _model.introTextController.text, _model.dept ?? "", _model.positionValue ?? "", returnedStringImg);
                          } else if (returnedXfileImg == null) {
                            logger.w('프로필 이미지 수정 문제 발생');
                          } else {
                            logger.w('${returnedXfileImg?.path}');
                            String? photoUrl = await _firebaseService.storeUserImageToStorage(returnedXfileImg?.path, 'profile', userData['prf_name']);
                            await _firebaseService.updateProfile(currentUserUid, displayName, _model.introTextController.text, _model.dept ?? "", _model.positionValue ?? "", photoUrl);
                          }
                          
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '프로필 수정 완료!',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              duration: const Duration(milliseconds: 3000),
                              backgroundColor: FlutterFlowTheme.of(context).alternate,
                            ),
                          );

                          context.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF375AC1),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                          minimumSize: const Size(320, 45),
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'pretendard',
                            color: Colors.white,
                            letterSpacing: 0,
                            useGoogleFonts: false,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          '수정완료',
                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'pretendard',
                                color: Colors.white,
                                letterSpacing: 0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
