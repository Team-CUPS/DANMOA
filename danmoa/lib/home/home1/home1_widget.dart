import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home1Widget extends StatefulWidget {
  const Home1Widget({super.key});

  @override
  State<Home1Widget> createState() => _Home1WidgetState();
}

class _Home1WidgetState extends State<Home1Widget> {
  late Home1Model _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseService _firebaseService = FirebaseService.instance;

  static List<dynamic>? week;
  static List<dynamic>? menu1;
  static List<dynamic>? menu2;
  static var week_status;
  static var menu1_status;
  static var menu2_status;
  static bool dataFetched = false; // 데이터 한번만 fetch하기 위함
  static bool isLoading = true; // 데이터 로딩 상태를 관리

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Home1Model());
    if (!dataFetched) {
      fetchData();
    }
  }

  Future<void> fetchData() async { // 주간일정, 학생식당메뉴, 교직원식당메뉴 크롤링 데이터 저장
    setState(() {
      isLoading = true; // 데이터 로딩 시작
    });

    try {
      final weekResponse = await http.post(
        Uri.parse('https://port-0-danmoa-crawserver-rccln2llw1oo1v6.sel5.cloudtype.app/week'),
      );
      final menu1Response = await http.post(
        Uri.parse('https://port-0-danmoa-crawserver-rccln2llw1oo1v6.sel5.cloudtype.app/menu1'),
      );
      final menu2Response = await http.post(
        Uri.parse('https://port-0-danmoa-crawserver-rccln2llw1oo1v6.sel5.cloudtype.app/menu2'),
      );

      if (weekResponse.statusCode == 200 && menu1Response.statusCode == 200 && menu2Response.statusCode == 200) {
        setState(() {
          var weekData = json.decode(utf8.decode(weekResponse.bodyBytes)) as Map<String, dynamic>;
          var menu1Data = json.decode(utf8.decode(menu1Response.bodyBytes)) as Map<String, dynamic>;
          var menu2Data = json.decode(utf8.decode(menu2Response.bodyBytes)) as Map<String, dynamic>;
          week = (weekData['contents'] as List<dynamic>?) ?? [];
          menu1 = (menu1Data['contents'] as List<dynamic>?) ?? [];
          menu2 = (menu2Data['contents'] as List<dynamic>?) ?? [];
          week_status = weekData['status'];
          menu1_status = menu1Data['status'];
          menu2_status = menu2Data['status'];

          dataFetched = true;
          isLoading = false; // 데이터 로딩 완료
        });
      } else {
        // Handle error
        print('Failed to fetch data');
        setState(() {
          isLoading = false; // 데이터 로딩 실패
        });
      }
    } catch (e) {
      // Handle exception
        print('Error: $e');
        if (mounted) {
          setState(() {
          isLoading = false; // 데이터 로딩 실패
        });
      }
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    print("Get Data : $week");
    print("Status : $week_status");
    print("Get Data : $menu1");
    print("Status : $menu1_status");
    print("Get Data : $menu2");
    print("Status : $menu2_status");
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
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 1,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context)
                          .secondaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 20),
                            child: PageView(
                              controller: _model
                                      .home1Pv01Controller ??=
                                  PageController(initialPage: 0),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional
                                      .fromSTEB(10, 0, 10, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize:
                                            MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(0, 10,
                                                        0, 0),
                                            child: FaIcon(
                                              FontAwesomeIcons.school,
                                              color: FlutterFlowTheme
                                                      .of(context)
                                                  .secondaryText,
                                              size: 20,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(5, 10,
                                                        0, 0),
                                            child: Text(
                                              '이번주 학사일정',
                                              style: FlutterFlowTheme
                                                      .of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'pretendard',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 18,
                                                    letterSpacing:
                                                        0,
                                                    fontWeight:
                                                        FontWeight
                                                            .bold,
                                                    useGoogleFonts:
                                                        false,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: FlutterFlowTheme.of(
                                                context)
                                            .alternate,
                                      ),
                                      isLoading
                                      ? const Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 90, 0, 0),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                      : week_status == "empty"
                                        ? Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                child: Center(
                                                  child: Text(
                                                    '이번주는 쉬어가는 한주입니다!',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: 'pretendard',
                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                          fontSize: 16,
                                                          letterSpacing: 0,
                                                          fontWeight: FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                )
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                child: Center(
                                                  child: Image.asset(
                                                    'assets/images/danmoa_rest.png',
                                                    width: 120,
                                                    height: 150,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ),
                                            ]
                                          )
                                        : ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: week != null ? (week!.length > 4 ? 4 : week!.length) : 0,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 4),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    week![index][0],
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: 'pretendard',
                                                          letterSpacing: 0,
                                                          fontWeight: FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  Text(
                                                    week![index][1],
                                                    style: FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'pretendard',
                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                          fontSize: 14,
                                                          letterSpacing: 0,
                                                          fontWeight: FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional
                                      .fromSTEB(10, 0, 10, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize:
                                            MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(0, 10,
                                                        0, 0),
                                            child: Icon(
                                              Icons.fastfood_rounded,
                                              color: FlutterFlowTheme
                                                      .of(context)
                                                  .secondaryText,
                                              size: 24,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(5, 10,
                                                        0, 0),
                                            child: Text(
                                              '학생식당 ',
                                              style: FlutterFlowTheme
                                                      .of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'pretendard',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 18,
                                                    letterSpacing:
                                                        0,
                                                    fontWeight:
                                                        FontWeight
                                                            .bold,
                                                    useGoogleFonts:
                                                        false,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: FlutterFlowTheme.of(
                                                context)
                                            .alternate,
                                      ),
                                      isLoading
                                      ? const Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 90, 0, 0),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                      : menu1_status == "empty"
                                        ? Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                child: Center(
                                                  child: Text(
                                                    '오늘은 식당이 쉬는날입니다.',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: 'pretendard',
                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                          fontSize: 16,
                                                          letterSpacing: 0,
                                                          fontWeight: FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                )
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                child: Center(
                                                  child: Image.asset(
                                                    'assets/images/danmoa_play.png',
                                                    width: 120,
                                                    height: 150,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ),
                                            ]
                                          )
                                        : Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [ 
                                              Flexible(
                                                flex: 1,
                                                child:
                                                  ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  itemCount: menu1?[0].length ?? 0,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(16, 2, 4, 2),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            menu1![0][index],
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  fontFamily: 'pretendard',
                                                                  letterSpacing: 0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: 13,
                                                                  useGoogleFonts: false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: 
                                                  ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  itemCount: menu1?[1].length ?? 0,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(16, 2, 4, 2),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            menu1![1][index],
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  fontFamily: 'pretendard',
                                                                  letterSpacing: 0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: 13,
                                                                  useGoogleFonts: false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child:
                                                  ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  itemCount: menu1?[2].length ?? 0,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(16, 2, 4, 2),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            menu1![2][index],
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  fontFamily: 'pretendard',
                                                                  letterSpacing: 0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: 13,
                                                                  useGoogleFonts: false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional
                                      .fromSTEB(10, 0, 10, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize:
                                            MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(0, 10,
                                                        0, 0),
                                            child: Icon(
                                              Icons.food_bank,
                                              color: FlutterFlowTheme
                                                      .of(context)
                                                  .secondaryText,
                                              size: 24,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(5, 10,
                                                        0, 0),
                                            child: Text(
                                              '교직원식당',
                                              style: FlutterFlowTheme
                                                      .of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'pretendard',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 18,
                                                    letterSpacing:
                                                        0,
                                                    fontWeight:
                                                        FontWeight
                                                            .bold,
                                                    useGoogleFonts:
                                                        false,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: FlutterFlowTheme.of(
                                                context)
                                            .alternate,
                                      ),
                                      isLoading
                                      ? const Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 90, 0, 0),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                      : menu2_status == "empty"
                                        ? Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                child: Center(
                                                  child: Text(
                                                    '오늘은 식당이 쉬는날입니다.',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: 'pretendard',
                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                          fontSize: 16,
                                                          letterSpacing: 0,
                                                          fontWeight: FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                )
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                child: Center(
                                                  child: Image.asset(
                                                    'assets/images/danmoa_play.png',
                                                    width: 120,
                                                    height: 150,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ),
                                            ]
                                          )
                                        : Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child:
                                                  ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  itemCount: menu2?[0].length ?? 0,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(20, 2, 4, 2),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            menu2![0][index],
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  fontFamily: 'pretendard',
                                                                  letterSpacing: 0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: 13,
                                                                  useGoogleFonts: false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: 
                                                  ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  itemCount: menu2?[1].length ?? 0,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(20, 2, 4, 2),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            menu2![1][index],
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  fontFamily: 'pretendard',
                                                                  letterSpacing: 0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: 13,
                                                                  useGoogleFonts: false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, 1),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 16),
                              child: smooth_page_indicator
                                  .SmoothPageIndicator(
                                controller: _model
                                        .home1Pv01Controller ??=
                                    PageController(initialPage: 0),
                                count: 3,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.home1Pv01Controller!
                                      .animateToPage(
                                    i,
                                    duration:
                                        const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  setState(() {});
                                },
                                effect: smooth_page_indicator
                                    .ExpandingDotsEffect(
                                  expansionFactor: 3,
                                  spacing: 8,
                                  radius: 16,
                                  dotWidth: 16,
                                  dotHeight: 8,
                                  dotColor:
                                      FlutterFlowTheme.of(context)
                                          .accent1,
                                  activeDotColor:
                                      FlutterFlowTheme.of(context)
                                          .primary,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                    await context.pushNamed('stdList1');
                                    setState(() {});
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
                                    itemCount: userStudyData.length,
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
                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 5.0),
                                                    child: AutoSizeText(
                                                      stdName,
                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                            fontFamily: 'Pretendard',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                            useGoogleFonts: false,
                                                          ),
                                                      maxLines: 1, // 줄바꿈 없이 글씨 크기를 줄입니다.
                                                      minFontSize: 10.0, // 최소 글씨 크기 설정
                                                      overflow: TextOverflow.ellipsis, // 글씨가 줄어들어도 공간이 부족하면 생략 부호를 추가합니다.
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 5.0),
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
                      setState(() {});
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
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 32, 0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
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
                                shape: const RoundedRectangleBorder(
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
                                    borderRadius: const BorderRadius.only(
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 5, 0),
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
                                shape: const RoundedRectangleBorder(
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
                                    borderRadius: const BorderRadius.only(
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
