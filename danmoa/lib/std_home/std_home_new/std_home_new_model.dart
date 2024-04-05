import '/components/member_post_widget.dart';
import '/components/study_member_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'std_home_new_widget.dart' show StdHomeNewWidget;
import 'package:flutter/material.dart';

class StdHomeNewModel extends FlutterFlowModel<StdHomeNewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for studyMember component.
  late StudyMemberModel studyMemberModel1;
  // Model for studyMember component.
  late StudyMemberModel studyMemberModel2;
  // Model for studyMember component.
  late StudyMemberModel studyMemberModel3;
  // Model for memberPost component.
  late MemberPostModel memberPostModel1;
  // Model for memberPost component.
  late MemberPostModel memberPostModel2;
  // Model for memberPost component.
  late MemberPostModel memberPostModel3;
  // Model for memberPost component.
  late MemberPostModel memberPostModel4;
  // Model for memberPost component.
  late MemberPostModel memberPostModel5;
  // Model for memberPost component.
  late MemberPostModel memberPostModel6;
  // Model for memberPost component.
  late MemberPostModel memberPostModel7;
  // Model for memberPost component.
  late MemberPostModel memberPostModel8;
  // Model for memberPost component.
  late MemberPostModel memberPostModel9;
  // Model for memberPost component.
  late MemberPostModel memberPostModel10;
  // Model for memberPost component.
  late MemberPostModel memberPostModel11;
  // Model for memberPost component.
  late MemberPostModel memberPostModel12;
  // Model for memberPost component.
  late MemberPostModel memberPostModel13;
  // Model for memberPost component.
  late MemberPostModel memberPostModel14;
  // Model for memberPost component.
  late MemberPostModel memberPostModel15;
  // Model for memberPost component.
  late MemberPostModel memberPostModel16;
  // Model for memberPost component.
  late MemberPostModel memberPostModel17;
  // Model for memberPost component.
  late MemberPostModel memberPostModel18;
  // Model for memberPost component.
  late MemberPostModel memberPostModel19;
  // Model for memberPost component.
  late MemberPostModel memberPostModel20;

  @override
  void initState(BuildContext context) {
    studyMemberModel1 = createModel(context, () => StudyMemberModel());
    studyMemberModel2 = createModel(context, () => StudyMemberModel());
    studyMemberModel3 = createModel(context, () => StudyMemberModel());
    memberPostModel1 = createModel(context, () => MemberPostModel());
    memberPostModel2 = createModel(context, () => MemberPostModel());
    memberPostModel3 = createModel(context, () => MemberPostModel());
    memberPostModel4 = createModel(context, () => MemberPostModel());
    memberPostModel5 = createModel(context, () => MemberPostModel());
    memberPostModel6 = createModel(context, () => MemberPostModel());
    memberPostModel7 = createModel(context, () => MemberPostModel());
    memberPostModel8 = createModel(context, () => MemberPostModel());
    memberPostModel9 = createModel(context, () => MemberPostModel());
    memberPostModel10 = createModel(context, () => MemberPostModel());
    memberPostModel11 = createModel(context, () => MemberPostModel());
    memberPostModel12 = createModel(context, () => MemberPostModel());
    memberPostModel13 = createModel(context, () => MemberPostModel());
    memberPostModel14 = createModel(context, () => MemberPostModel());
    memberPostModel15 = createModel(context, () => MemberPostModel());
    memberPostModel16 = createModel(context, () => MemberPostModel());
    memberPostModel17 = createModel(context, () => MemberPostModel());
    memberPostModel18 = createModel(context, () => MemberPostModel());
    memberPostModel19 = createModel(context, () => MemberPostModel());
    memberPostModel20 = createModel(context, () => MemberPostModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    studyMemberModel1.dispose();
    studyMemberModel2.dispose();
    studyMemberModel3.dispose();
    memberPostModel1.dispose();
    memberPostModel2.dispose();
    memberPostModel3.dispose();
    memberPostModel4.dispose();
    memberPostModel5.dispose();
    memberPostModel6.dispose();
    memberPostModel7.dispose();
    memberPostModel8.dispose();
    memberPostModel9.dispose();
    memberPostModel10.dispose();
    memberPostModel11.dispose();
    memberPostModel12.dispose();
    memberPostModel13.dispose();
    memberPostModel14.dispose();
    memberPostModel15.dispose();
    memberPostModel16.dispose();
    memberPostModel17.dispose();
    memberPostModel18.dispose();
    memberPostModel19.dispose();
    memberPostModel20.dispose();
  }
}
