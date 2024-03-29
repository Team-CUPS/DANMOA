import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'study_member_model.dart';
export 'study_member_model.dart';

class StudyMemberWidget extends StatefulWidget {
  const StudyMemberWidget({super.key});

  @override
  State<StudyMemberWidget> createState() => _StudyMemberWidgetState();
}

class _StudyMemberWidgetState extends State<StudyMemberWidget> {
  late StudyMemberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyMemberModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: Container(
                width: 72.0,
                height: 72.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/596/600',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '박수현',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
                Text(
                  '수현이는 수현이입니다',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: FlutterFlowTheme.of(context).grey700,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).grey200,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).white,
                    ),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Text(
                      '모바일시스템공학과',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'pretendard',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 4.0)),
            ),
          ],
        ),
      ),
    );
  }
}
