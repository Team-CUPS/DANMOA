import 'package:auto_size_text/auto_size_text.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'home1_model.dart';
export 'home1_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';

class Home1Widget extends StatefulWidget {
  const Home1Widget({super.key});

  @override
  State<Home1Widget> createState() => _Home1WidgetState();
}

class _Home1WidgetState extends State<Home1Widget> {
  late Home1Model _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseService _firebaseService = FirebaseService.instance;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Home1Model());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 0.0, 8.0),
            child: Container(
              width: 120.0,
              height: 120.0,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/danmoa_logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 15.0),
              child: Text(
                '단모아',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Black_Han',
                      color: const Color(0xFFBFC4CD),
                      fontSize: 25.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 5.0, 8.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 14.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.notifications_outlined,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 29.0,
                ),
                onPressed: () async {
                  context.pushNamed('notice1');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 500.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: PageView(
                            controller: _model.home1Pv01Controller ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1560961911-ba7ef651a56c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8bGVnb3xlbnwwfHx8fDE3MTA1OTkzMjl8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                  width: double.infinity,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://picsum.photos/seed/163/600',
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://picsum.photos/seed/836/600',
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 16.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.home1Pv01Controller ??=
                                  PageController(initialPage: 0),
                              count: 3,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.home1Pv01Controller!.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 3.0,
                                spacing: 8.0,
                                radius: 16.0,
                                dotWidth: 16.0,
                                dotHeight: 8.0,
                                dotColor: FlutterFlowTheme.of(context).accent1,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 5.0, 0.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 1.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 205.0,
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        18.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '내 스터디',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'pretendard',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('stdList1');
                                  },
                                  text: '',
                                  icon: const Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 24.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 20.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'pretendard',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
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
                              ],
                            ),
                          ),
                          FutureBuilder<List<Map<String, dynamic>>>(
                            future: _firebaseService.getUserStudies(currentUserUid, 1),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return const Center(child: Text('가입된 스터디가 없습니다.'));
                              } else {
                                final userStudyData = snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  height: 160.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: userStudyData.length > 3 ? 3 : userStudyData.length, // 최대 3개 요소만 표시
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, int index) {
                                      final study = userStudyData[index];
                                      String stdCurrentUserStatus = study['std_leader']['uid'] == currentUserUid ? '팀장' : '팀원';
                                      String stdName = study['std_name'];
                                      String stdPrfPicture = _firebaseService.getStudyPhotoUrl(study['std_prf_picture']);

                                      return InkWell(
                                        onTap: () async {
                                          if (await _firebaseService.doesStudyExist(stdName)) {
                                            await _firebaseService.updateUserStudyIfJoined(stdName, currentUserUid);
                                            await context.pushNamed(
                                              'stdHome1',
                                              queryParameters: {
                                                'stdName': serializeParam(stdName, ParamType.String),
                                              }.withoutNulls,
                                            );
                                            setState(() {});// 데이터 새로 고침
                                          }
                                          else {
                                            setState(() {});// 데이터 새로 고침
                                          }

                                          
                                        },
                                        child: Align(
                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                                            child: Container(
                                              width: 110.0,
                                              height: 110.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                borderRadius: BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(context).alternate,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                                    child: Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 0.0, 0.0),
                                                      child: Text(
                                                        stdCurrentUserStatus,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: 'Pretendard',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  AutoSizeText(
                                                    stdName,
                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                      fontFamily: 'Pretendard',
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                      useGoogleFonts: false,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                    child: Container(
                                                      width: 48.0,
                                                      height: 48.0,
                                                      clipBehavior: Clip.antiAlias,
                                                      decoration: const BoxDecoration(shape: BoxShape.circle),
                                                      child: Image.network(stdPrfPicture, fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 5.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('stdMake1');
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        constraints: const BoxConstraints(
                          minWidth: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '스터디 만들기',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'pretendard',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 17,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
                              child: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20,
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await launchURL(
                                    'https://lib.dankook.ac.kr/local/html/studyRoomGuide');
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 39,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.menu_book_sharp,
                                        color: FlutterFlowTheme.of(context).primary,
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '스터디룸 예약 ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'pretendard',
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
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
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 5, 0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await launchURL(
                                    'https://lib.dankook.ac.kr/local/html/studyRoomGuide3');
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 39,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.people,
                                        color: FlutterFlowTheme.of(context).primary,
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '도산라운지 예약 ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'pretendard',
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
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
                    ],
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
