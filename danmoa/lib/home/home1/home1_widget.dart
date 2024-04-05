import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'home1_model.dart';
export 'home1_model.dart';

class Home1Widget extends StatefulWidget {
  const Home1Widget({super.key});

  @override
  State<Home1Widget> createState() => _Home1WidgetState();
}

class _Home1WidgetState extends State<Home1Widget> {
  late Home1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 15.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth('sign1', context.mounted);
              },
              child: Container(
                width: 120.0,
                height: 120.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://ifh.cc/g/sfqAqz.png',
                  fit: BoxFit.cover,
                ),
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 38.0,
                icon: Icon(
                  Icons.message_outlined,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 26.0,
                ),
                onPressed: () async {
                  context.pushNamed('chat1');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 15.0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 5.0, 0.0),
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
                                        15.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('timetestpage');
                                      },
                                      child: Text(
                                        '내 스터디',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              useGoogleFonts: false,
                                            ),
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
                                    size: 15.0,
                                  ),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 19.0,
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
                          Container(
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
                            child: PagedListView<DocumentSnapshot<Object?>?,
                                StudyRecord>(
                              pagingController: _model.setHome1Lv01Controller(
                                StudyRecord.collection.where(Filter.or(
                                  Filter(
                                    'std_leader_id',
                                    isEqualTo: currentUserUid,
                                  ),
                                  Filter(
                                    'std_member_ids',
                                    arrayContains: currentUserUid,
                                  ),
                                )),
                              ),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              reverse: false,
                              scrollDirection: Axis.horizontal,
                              builderDelegate:
                                  PagedChildBuilderDelegate<StudyRecord>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                ),
                                // Customize what your widget looks like when it's loading another page.
                                newPageProgressIndicatorBuilder: (_) => Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                ),

                                itemBuilder: (context, _, home1Lv01Index) {
                                  final home1Lv01StudyRecord = _model
                                      .home1Lv01PagingController!
                                      .itemList![home1Lv01Index];
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 5.0, 0.0),
                                      child: Container(
                                        width: 110.0,
                                        height: 110.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 3.0, 0.0, 0.0),
                                                  child: Text(
                                                    currentUserUid ==
                                                            home1Lv01StudyRecord
                                                                .stdLeaderId
                                                        ? '팀장'
                                                        : '팀원',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'pretendard',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                home1Lv01StudyRecord.stdName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'pretendard',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 48.0,
                                                  height: 48.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://picsum.photos/seed/319/600',
                                                    fit: BoxFit.cover,
                                                  ),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
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
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '스터디 만들기',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'pretendard',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 15.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('stdMake1');
                              },
                              text: '+',
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 19.0,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
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
                      height: 230.0,
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
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    '전체 스터디',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'pretendard',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w800,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('stdList2');
                                  },
                                  text: '',
                                  icon: const Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 15.0,
                                  ),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 19.0,
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
                            Container(
                              height: 164.0,
                              decoration: const BoxDecoration(),
                              child: PagedListView<DocumentSnapshot<Object?>?,
                                  StudyRecord>(
                                pagingController: _model.setHome1Lv02Controller(
                                  StudyRecord.collection,
                                ),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                builderDelegate:
                                    PagedChildBuilderDelegate<StudyRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),

                                  itemBuilder: (context, _, home1Lv02Index) {
                                    final home1Lv02StudyRecord = _model
                                        .home1Lv02PagingController!
                                        .itemList![home1Lv02Index];
                                    return AnimatedContainer(
                                      duration: const Duration(milliseconds: 150),
                                      curve: Curves.easeInOut,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 8.0, 12.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: Container(
                                                width: 32.0,
                                                height: 32.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'db-스터디명',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              const Color(0xFF14181B),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'db-분야',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'pretendard',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                      Text(
                                                        'db-활동점수',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'pretendard',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                      Text(
                                                        'db-팀원수',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'pretendard',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
