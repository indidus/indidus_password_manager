import '/flutter_flow/flutter_flow_util.dart';
import '/outdated_components/search/search_widget.dart';
import 'credential1_widget.dart' show Credential1Widget;
import 'package:flutter/material.dart';

class Credential1Model extends FlutterFlowModel<Credential1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Search component.
  late SearchModel searchModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    searchModel = createModel(context, () => SearchModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
