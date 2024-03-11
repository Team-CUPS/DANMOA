import 'package:flutter/material.dart';
import 'package:danmoa/flutter_flow/flutter_flow_theme.dart';
import 'package:danmoa/flutter_flow/flutter_flow_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
      home: DanMoa()
    )
  );
}

class DanMoa extends StatelessWidget {
const DanMoa({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 0, 0), // EdgeInsetsDirectional과 달리 좌우방향 고정
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/danmoa.png',
                  fit: BoxFit.cover,
                ),
              )
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 90, 0, 0),
            child: FFButtonWidget(
              onPressed: () {
                
              },
              text: 'Kakao 로그인',
              icon: const FaIcon(
                FontAwesomeIcons.solidComment,
              ),
              options: FFButtonOptions(
                width: 300,
                height: 40,
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).warning,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                elevation: 3,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
            child: FFButtonWidget(
              onPressed: () {
                
              },
              text: 'Google 로그인',
              icon: const FaIcon(
                FontAwesomeIcons.google,
              ),
              options: FFButtonOptions(
                width: 300,
                height: 40,
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).secondary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                elevation: 3,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],
      )
    );
  }
}