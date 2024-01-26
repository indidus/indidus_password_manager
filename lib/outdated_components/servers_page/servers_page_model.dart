import '/components/logout/logout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/outdated_components/server_card/server_card_widget.dart';
import 'servers_page_widget.dart' show ServersPageWidget;
import 'package:flutter/material.dart';

class ServersPageModel extends FlutterFlowModel<ServersPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ServerCard component.
  late ServerCardModel serverCardModel;
  // Model for Logout component.
  late LogoutModel logoutModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    serverCardModel = createModel(context, () => ServerCardModel());
    logoutModel = createModel(context, () => LogoutModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    serverCardModel.dispose();
    logoutModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
