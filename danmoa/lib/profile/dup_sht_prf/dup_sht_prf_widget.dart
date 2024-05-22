import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'dup_sht_prf_model.dart';
export 'dup_sht_prf_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';


class DupShtPrfWidget extends StatefulWidget {
  const DupShtPrfWidget({super.key});

  @override
  State<DupShtPrfWidget> createState() => _DupShtPrfWidgetState();
}

class _DupShtPrfWidgetState extends State<DupShtPrfWidget> {
  late DupShtPrfModel _model;
  final FirebaseService _firebaseService = FirebaseService.instance;
  bool _isChecked = false;
  bool _isUnique = false;
  String _helperText = '';
  Color _helperTextColor = Colors.red;
  bool _isCheckButtonEnabled = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DupShtPrfModel());

    _model.displayNameTextController ??= TextEditingController();
    _model.displayNameFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  Future<void> checkDisplayName() async {
    String displayName = _model.displayNameTextController?.text ?? '';
    bool isUnique = await _firebaseService.isDisplayNameUnique(displayName); // 실질적 중복 체크
    setState(() {
      _isChecked = true;
      _isUnique = isUnique;
      _helperText = isUnique ? '사용 가능한 닉네임입니다.' : '이미 사용 중인 닉네임입니다.';
      _helperTextColor = isUnique ? Colors.green : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 230.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 250.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 10, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.displayNameTextController,
                              focusNode: _model.displayNameFocusNode,
                              autofocus: false,
                              obscureText: false,
                              // onChanged이벤트 발생 시
                              // 1. validateDisplayName에 따른 helperText 내용 생성
                              // 2. 닉네임 3-10자, 한글,영문,숫자일 때만 _isCheckButtonEnabled = true. _isButtonEnabled = false이면, 추후 버튼 비활성화
                              // 3. _helperTextColor는 _isButtonEnabled = false일 때, Black->Red로 변경
                              // 4. 한 번이라도 클릭 시 _isChecked = false가 되어, 다시 중복 체크를 해야 함.
                              onChanged: (value) {
                                final result = UtilService.validateDisplayName(value);
                                setState(() {
                                  _helperText = result['helperText'];
                                  _isCheckButtonEnabled = result['isCheckButtonEnabled'];
                                  _helperTextColor = result['helperTextColor'];
                                  _isChecked = false;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: '닉네임 ',
                                labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                      fontFamily: 'pretendard',
                                      color: const Color(0x7057636C),
                                      letterSpacing: 0,
                                      useGoogleFonts: false,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                      fontFamily: 'pretendard',
                                      color: const Color(0x7057636C),
                                      fontSize: 25,
                                      letterSpacing: 0,
                                      useGoogleFonts: false,
                                    ),
                                // TextFormField의 decoration: InputDecoration에 존재하는 helperText, helperTextStyle 속성
                                // onChanged에서 정해진 _helperText(내용), _helperTextColor(색상) 이용
                                helperText: _helperText,
                                helperStyle: TextStyle(color: _helperTextColor),
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
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'pretendard',
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    useGoogleFonts: false,
                                  ),
                              textAlign: TextAlign.justify,
                              validator: _model.displayNameTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 12, 16),
                          child: FFButtonWidget(
                            // 닉네임 필드에 타자를 칠 때 마다 _isCheckButtonEnabled 가 참인지 검사
                            // 해당 조건이 참인 경우는 위에서 서술했 듯 닉네임 3-10자, 한글,영문,숫자일 때이다. 
                            onPressed: _isCheckButtonEnabled ? checkDisplayName : null,
                            text: '',
                            icon: const Icon(
                              Icons.check,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              height: 40,
                              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                              color: _isCheckButtonEnabled ? const Color(0xFF375AC1) : Colors.grey,
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          if (!_isChecked) {
                            UtilService.showDialogWithMessage(
                              context,
                              '오류',
                              '먼저 닉네임 중복 검사를 해주세요',
                            );
                          } else if (!_isUnique) {
                            UtilService.showDialogWithMessage(
                              context,
                              '오류',
                              '중복된 닉네임은 이용하실 수 없습니다',
                            );
                          } else {
                            String displayName = _model.displayNameTextController?.text ?? '';
                            Navigator.pop(context, displayName);
                          }
                        },
                        text: '확인',
                        options: FFButtonOptions(
                          width: 150.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'pretendard',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          context.pop();
                        },
                        text: '취소',
                        options: FFButtonOptions(
                          width: 150.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Lexend Deca',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
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
