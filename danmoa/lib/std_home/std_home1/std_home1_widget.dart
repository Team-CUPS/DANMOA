import '/components/member_post_widget.dart';
import '/components/study_member_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'std_home1_model.dart';
export 'std_home1_model.dart';

class StdHome1Widget extends StatefulWidget {
  const StdHome1Widget({super.key});

  @override
  State<StdHome1Widget> createState() => _StdHome1WidgetState();
}

class _StdHome1WidgetState extends State<StdHome1Widget>
    with TickerProviderStateMixin {
  late StdHome1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StdHome1Model());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).white,
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
          title: Text(
            '스터디 이름',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'pretendard',
                  color: FlutterFlowTheme.of(context).black,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.person_add,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 26.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'pretendard',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            unselectedLabelStyle: const TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            tabs: const [
                              Tab(
                                text: '소개',
                              ),
                              Tab(
                                text: '공지',
                              ),
                              Tab(
                                text: '게시판',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Container(
                                decoration: const BoxDecoration(),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '[db-스터디명]',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'pretendard',
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            Text(
                                              '· 60점',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'pretendard',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grey700,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: '가입하기',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 45.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'pretendard',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(const SizedBox(height: 8.0))
                                          .addToStart(const SizedBox(height: 20.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '기본정보',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'pretendard',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 60.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Text(
                                                    '팀장',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'pretendard',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grey700,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                          lineHeight: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '홍길동',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'pretendard',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 60.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Text(
                                                    '회비',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'pretendard',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grey700,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                          lineHeight: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '2,000 원',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'pretendard',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 60.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Text(
                                                    '시간대',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'pretendard',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grey700,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                          lineHeight: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '아침',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'pretendard',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 60.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Text(
                                                    '개설일',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'pretendard',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grey700,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                          lineHeight: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '2024.03.12',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'pretendard',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ].divide(const SizedBox(height: 4.0)),
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '멤버',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'pretendard',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model.studyMemberModel1,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const StudyMemberWidget(),
                                            ),
                                            wrapWithModel(
                                              model: _model.studyMemberModel2,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const StudyMemberWidget(),
                                            ),
                                            wrapWithModel(
                                              model: _model.studyMemberModel3,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const StudyMemberWidget(),
                                            ),
                                          ].divide(const SizedBox(height: 16.0)),
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ].divide(const SizedBox(height: 32.0)),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          wrapWithModel(
                                            model: _model.memberPostModel1,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel3,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel4,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel5,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel6,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel7,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel8,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel9,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel10,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel11,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel12,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel13,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel14,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel15,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel16,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                                ].addToStart(const SizedBox(height: 20.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          wrapWithModel(
                                            model: _model.memberPostModel17,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel18,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel19,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                          wrapWithModel(
                                            model: _model.memberPostModel20,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const MemberPostWidget(),
                                          ),
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                                ].addToStart(const SizedBox(height: 20.0)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
