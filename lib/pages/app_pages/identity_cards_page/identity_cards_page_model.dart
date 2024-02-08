import 'dart:async';

import 'package:flutter/material.dart';
import 'package:indidus_password_manager/components/setting_button/setting_button_model.dart';

import '/components/identity_card/identity_cards/identity_cards_widget.dart';
import '/components/logout/logout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/identity_cards.dart';
import 'identity_cards_page_widget.dart' show IdentityCardsPageWidget;

class IdentityCardsPageModel extends FlutterFlowModel<IdentityCardsPageWidget> {
  ///  Local state fields for this page.

  String? searchQuery = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<IdentityCard>>? requestCompleter;
  // Model for SettingButton component.
  late SettingButtonModel settingButtonModel;
  // Models for IdentityCards dynamic component.
  late FlutterFlowDynamicModels<IdentityCardsModel> identityCardsModels;
  // Model for Logout component.
  late LogoutModel logoutModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    identityCardsModels = FlutterFlowDynamicModels(() => IdentityCardsModel());
    logoutModel = createModel(context, () => LogoutModel());
    settingButtonModel = createModel(context, () => SettingButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    identityCardsModels.dispose();
    logoutModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
