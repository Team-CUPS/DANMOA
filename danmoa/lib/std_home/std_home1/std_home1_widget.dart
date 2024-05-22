import 'package:video_player/video_player.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'std_home1_model.dart';
export 'std_home1_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';

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
  late StdHome1Model _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseService _firebaseService = FirebaseService.instance;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdHome1Model());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> _loadData() async {
    var loadedStudyData = await _firebaseService.getStudyDataByName(widget.stdName);
    var selectedMembersData = await _firebaseService.getMembersDataFromStudyData(loadedStudyData);
    bool memberStatus = UtilService.isMember(loadedStudyData, currentUserUid);

    return {
      'studyData': loadedStudyData,
      'selectedMembersData': selectedMembersData,
      'memberStatus': memberStatus,
    };
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
        body: FutureBuilder<Map<String, dynamic>>(
          future: _loadData(),
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

            final studyData = snapshot.data!['studyData'] as Map<String, dynamic>;
            final selectedMembersData = snapshot.data!['selectedMembersData'] as List<Map<String, dynamic>>;
            final memberStatus = snapshot.data!['memberStatus'] as bool;
            
            return Scaffold(
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
                              await context.pushNamed(
                                'stdHome2',
                                queryParameters: {
                                  'stdName': serializeParam(studyData['std_name'], ParamType.String),
                                  'stdPrfPicture': serializeParam(studyData['std_prf_picture'], ParamType.String),
                                }.withoutNulls,
                              );
                              setState(() {
                                _loadData();
                              });
                            },
                          ),
                        ),
                      ]
                    : [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 30,
                          icon: Icon(
                            Icons.settings_sharp,
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                centerTitle: true,
                elevation: 0,
              ),
              body: SafeArea(
                top: true,
                child: Container(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                    _firebaseService.getStudyPhotoUrl(studyData['std_prf_picture']),
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
                                      child: !memberStatus && studyData['std_leader']['uid'] != currentUserUid
                                          ? FFButtonWidget(
                                        onPressed: () async {
                                          const snackBar = SnackBar(content: Text('정상적으로 스터디에 가입 처리되었습니다.'));
                                          var personalData = await _firebaseService.getUserDataByUid(currentUserUid);
                                          await _firebaseService.joinStudy(
                                            widget.stdName,
                                            personalData['uid'],
                                            personalData['prf_name'],
                                          );

                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                          setState(() {
                                            _loadData();
                                          });
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
                                          final Uri url = Uri.parse(studyData['std_url']);
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url, mode: LaunchMode.externalApplication);
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
                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                fontFamily: 'pretendard',
                                                color: FlutterFlowTheme.of(context).grey700,
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
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                          '요일대',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                fontFamily: 'pretendard',
                                                color: FlutterFlowTheme.of(context).grey700,
                                                fontSize: 14,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                                lineHeight: 0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        '${studyData['std_times'].sublist(0, studyData['std_times'].length - 2).join(', ')}',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                fontFamily: 'pretendard',
                                                color: FlutterFlowTheme.of(context).grey700,
                                                fontSize: 14,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                                lineHeight: 0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        '${studyData['std_times'].sublist(studyData['std_times'].length - 2).join('~')}',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                fontFamily: 'pretendard',
                                                color: FlutterFlowTheme.of(context).grey700,
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
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                fontFamily: 'pretendard',
                                                color: FlutterFlowTheme.of(context).grey700,
                                                fontSize: 14,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                                lineHeight: 0,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: LayoutBuilder(
                                          builder: (context, constraints){
                                            return ConstrainedBox(
                                              constraints: BoxConstraints(
                                                minHeight: 0.0,
                                                maxHeight: 200.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child : Text(
                                                  studyData['std_intro'].trim(),
                                                  textAlign: TextAlign.start,
                                                  softWrap: true,
                                                  overflow: TextOverflow.visible,
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'pretendard',
                                                    fontSize: 14,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              )
                                            );
                                          }
                                        )
                                      )
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
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: selectedMembersData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await context.pushNamed(
                                      'prf1',
                                      queryParameters: {
                                        'userUid': serializeParam(
                                          selectedMembersData[index]['uid'],
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                    setState(() {
                                      _loadData();
                                    });
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
                                              _firebaseService.getUserPhotoUrl(selectedMembersData[index]['photo_url']),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                              child: Text(
                                                selectedMembersData[index]['display_name'],
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                  selectedMembersData[index]['prf_major'],
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        ),
                      ],
                    ),
                  ),
                )
                
              ),
            );
          },
        ),
      ),
    );
  }
}
