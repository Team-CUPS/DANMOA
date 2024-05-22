import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'photo_sht_prf_model.dart';
export 'photo_sht_prf_model.dart';
import 'package:danmoa/backend/service/firebase_service.dart';

class PhotoShtPrfWidget extends StatefulWidget {
  PhotoShtPrfWidget({
    super.key,
    required this.isPickedImgSht,
    required this.shtXfileImg,
    required this.shtStringImg,
  });

  bool isPickedImgSht;
  XFile? shtXfileImg;
  String? shtStringImg;

  @override
  State<PhotoShtPrfWidget> createState() => _PhotoShtPrfWidgetState();
}

class _PhotoShtPrfWidgetState extends State<PhotoShtPrfWidget> {
  late PhotoShtPrfModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoShtPrfModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                // 앨범에서 사진 선택 클릭시  
                widget.shtXfileImg = await UtilService.getImageFromGallery();

                if (widget.shtXfileImg != null) {
                  widget.isPickedImgSht = true;
                  widget.shtStringImg = 'not url'; // 크게 의미 있는 코드는 아니다. 추후 개발시 null과 구분할 가능성 염두해 설정.
                  Navigator.pop(context, {'isPickedImgSht': widget.isPickedImgSht, 'shtXfileImg': widget.shtXfileImg, 'shtStringImg': widget.shtStringImg});
                }     
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.95,
                height: 47.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    '앨범에서 사진 선택',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'pretendard',
                          color: const Color(0xFF5592FC),
                          fontSize: 19.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                // 기본 이미지 적용 클릭시
                widget.isPickedImgSht = false;
                widget.shtStringImg = null;
                Navigator.pop(context, {'isPickedImgSht': widget.isPickedImgSht, 'shtXfileImg': widget.shtXfileImg, 'shtStringImg': widget.shtStringImg});
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.95,
                height: 47.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    '기본 이미지 적용',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'pretendard',
                          color: const Color(0xFF5592FC),
                          fontSize: 19.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              // 취소버튼 클릭 시 (온 그대로 반환)
              Navigator.pop(context, {'isPickedImgSht': widget.isPickedImgSht, 'shtXfileImg': widget.shtXfileImg, 'shtStringImg': widget.shtStringImg});
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.95,
              height: 45.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  '취소',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pretendard',
                        color: const Color(0xFF5592FC),
                        fontSize: 19.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}