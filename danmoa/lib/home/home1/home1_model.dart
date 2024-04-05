import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home1_widget.dart' show Home1Widget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Home1Model extends FlutterFlowModel<Home1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for home1_pv_01 widget.
  PageController? home1Pv01Controller;

  int get home1Pv01CurrentIndex => home1Pv01Controller != null &&
          home1Pv01Controller!.hasClients &&
          home1Pv01Controller!.page != null
      ? home1Pv01Controller!.page!.round()
      : 0;
  // State field(s) for home1_lv_01 widget.

  PagingController<DocumentSnapshot?, StudyRecord>? home1Lv01PagingController;
  Query? home1Lv01PagingQuery;
  List<StreamSubscription?> home1Lv01StreamSubscriptions = [];

  // State field(s) for home1_lv_02 widget.

  PagingController<DocumentSnapshot?, StudyRecord>? home1Lv02PagingController;
  Query? home1Lv02PagingQuery;
  List<StreamSubscription?> home1Lv02StreamSubscriptions = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in home1Lv01StreamSubscriptions) {
      s?.cancel();
    }
    home1Lv01PagingController?.dispose();

    for (var s in home1Lv02StreamSubscriptions) {
      s?.cancel();
    }
    home1Lv02PagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, StudyRecord> setHome1Lv01Controller(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    home1Lv01PagingController ??= _createHome1Lv01Controller(query, parent);
    if (home1Lv01PagingQuery != query) {
      home1Lv01PagingQuery = query;
      home1Lv01PagingController?.refresh();
    }
    return home1Lv01PagingController!;
  }

  PagingController<DocumentSnapshot?, StudyRecord> _createHome1Lv01Controller(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, StudyRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryStudyRecordPage(
          queryBuilder: (_) => home1Lv01PagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: home1Lv01StreamSubscriptions,
          controller: controller,
          pageSize: 3,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, StudyRecord> setHome1Lv02Controller(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    home1Lv02PagingController ??= _createHome1Lv02Controller(query, parent);
    if (home1Lv02PagingQuery != query) {
      home1Lv02PagingQuery = query;
      home1Lv02PagingController?.refresh();
    }
    return home1Lv02PagingController!;
  }

  PagingController<DocumentSnapshot?, StudyRecord> _createHome1Lv02Controller(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, StudyRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryStudyRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: home1Lv02StreamSubscriptions,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
