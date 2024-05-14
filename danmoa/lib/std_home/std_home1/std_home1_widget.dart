import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'std_home1_model.dart';
export 'std_home1_model.dart';
import 'package:logger/logger.dart';
import 'package:danmoa/backend/backend.dart';

class StdHome1Widget extends StatefulWidget {
  const StdHome1Widget({
      super.key,
      required this.stdName,
    });

    final String stdName;

  @override
  State<StdHome1Widget> createState() => _StdHome1WidgetState();
}

class _StdHome1WidgetState extends State<StdHome1Widget> {
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  late StdHome1Model _model;
  String studyName = "";

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, dynamic> studyData = {};
  List<Map<String, dynamic>> userData = [];
  List<Map<String, dynamic>> selectedUserData = [];
  bool isLoading = true;
  bool memberStatus = false;

  @override
  void initState() {
    logger.i('init() in stdhome1');
    super.initState();
    _model = createModel(context, () => StdHome1Model());
    initData();
  }

  @override
  void dispose() {
    logger.i('dispose() in stdhome1');
    _model.dispose();

    super.dispose();
  }

  Future<void> initData() async {
    studyName = widget.stdName;
    var loadedStudyData  = await loadStudyDataByName(studyName);
    var loadedUserData = await loadUserData();
    selectedUserData = getUsersFromStudyData(loadedUserData, loadedStudyData);
    isLoading = false;
    setState(() {
      studyData = loadedStudyData;
      userData = loadedUserData;
    });
  }

  Future<void> refreshData(studyName) async {
    var loadedStudyData  = await loadStudyDataByName(studyName);
    var loadedUserData = await loadUserData();
    selectedUserData = getUsersFromStudyData(loadedUserData, loadedStudyData);
    isLoading = false;
    setState(() {
      studyData = loadedStudyData;
      userData = loadedUserData;
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
    logger.i("build() in stdhome1");
    logger.i('stdhome1 BuildContext: ${context.toString()}');
    
    memberStatus = isMember(studyData, currentUserUid);
    logger.i('멤버정보?: $selectedUserData');
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: MediaQuery.sizeOf(context).width * 0.959,
            icon: const Icon(
              Icons.chevron_left,
              color: Color(0xFF0A0000),
              size: 30,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Text(
                  '스터디 이름',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'pretendard',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ],
          ),
          actions: studyData['std_leader']['uid'] == currentUserUid
          ? [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20,
                  borderWidth: 1,
                  buttonSize: 30,
                  icon: Icon(
                    Icons.settings_sharp,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24,
                  ),
                  onPressed: () async {
                    var result = await context.pushNamed(
                      'stdHome2',
                      queryParameters: {
                        'stdName': serializeParam(studyData['std_name'], ParamType.String),
                      }.withoutNulls,
                    );
                    studyName = result as String;
                    isLoading = true;
                    await refreshData(studyName);
                    setState(() {});
                  },
                ),
              ),
            ]
          : [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            studyData['std_prf_picture'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Text(
                                studyData['std_name'],
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'pretendard',
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20, 8, 0, 0),
                              child: !memberStatus
                                ? FFButtonWidget(
                                    onPressed: () async {
                                    final localContext = context; // 현재의 context를 로컬 변수에 저장
                                    const snackBar = SnackBar(content: Text('정상적으로 스터디에 가입 처리되었습니다.'));
                                    var personalData = getUserInfoByUid(userData, currentUserUid);
                                    // 비동기 함수 호출
                                    await addMemberToStudy(
                                      widget.stdName, 
                                      personalData['uid'], 
                                      personalData['prf_name'],
                                    );

                                    if (mounted) {
                                      ScaffoldMessenger.of(localContext).showSnackBar(snackBar);
                                    }

                                    initData();

                                    // 현재 페이지 새로고침
                                    setState(() {});
                                  },
                                    text: '즉시 가입하기',
                                    options: FFButtonOptions(
                                      width: 140,
                                      height: 35,
                                      padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                      color: FlutterFlowTheme.of(context).primary,
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
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () async {
                                      final Uri url = Uri.parse(studyData['std_url']);  // URL을 직접 파싱하여 Uri 객체 생성
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url, mode: LaunchMode.externalApplication);  // 외부 브라우저에서 URL 열기
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Could not launch $url')),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      '오픈 카카오톡 링크로 이동',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 8)).addToStart(const SizedBox(height: 20)),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '기본정보',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'pretendard',
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  '팀장',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: FlutterFlowTheme.of(context)
                                            .grey700,
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                        lineHeight: 0,
                                      ),
                                ),
                              ),
                              Text(
                                studyData['std_leader']['name'],
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  '소개',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: FlutterFlowTheme.of(context)
                                            .grey700,
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                        lineHeight: 0,
                                      ),
                                ),
                              ),
                              Text(
                                studyData['std_intro'],
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  '시간대',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: FlutterFlowTheme.of(context)
                                            .grey700,
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                        lineHeight: 0,
                                      ),
                                ),
                              ),
                              Text(
                                '요일: ${studyData['std_times'].sublist(0, studyData['std_times'].length - 2).join(', ')} / 시간: ${studyData['std_times'].sublist(studyData['std_times'].length - 2).join('~')}',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  '개설일',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: FlutterFlowTheme.of(context)
                                            .grey700,
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                        lineHeight: 0,
                                      ),
                                ),
                              ),
                              Text(
                                DateFormat('yyyy.MM.dd').format(studyData['std_created_time'].toDate()).toString(),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(height: 4)),
                      ),
                    ].divide(const SizedBox(height: 8)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Text(
                    '멤버',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'pretendard',
                          fontSize: 18,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: selectedUserData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: InkWell(
                      onTap: () async {
                        await context.pushNamed(
                            'prf1',
                            queryParameters: {
                              'userUid': serializeParam(
                                selectedUserData[index]['uid'],
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        await initData();
                        setState(() {},);
                      },

                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                              child: Container(
                                width: 72,
                                height: 72,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  selectedUserData[index]['photo_url'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            // Image.network(
                            //             snapshot.data!,
                            //             fit: BoxFit.cover,
                            //           );
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                  child: Text(
                                    selectedUserData[index]['prf_name'], // 멤버의 이름 동적 표시
                                    style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'pretendard',
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                  ),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                    minHeight: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).grey200,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                                  ),
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                                    child: Text(
                                      selectedUserData[index]['prf_major'],
                                      style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'pretendard',
                                          fontSize: 12,
                                          letterSpacing: 0,
                                          useGoogleFonts: false,
                                        ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}