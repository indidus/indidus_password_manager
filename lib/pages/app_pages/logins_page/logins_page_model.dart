import '/backend/supabase/supabase.dart';
import '/components/logins/login_cards/login_cards_widget.dart';
import '/components/logout/logout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'logins_page_widget.dart' show LoginsPageWidget;
import 'package:flutter/material.dart';

class LoginsPageModel extends FlutterFlowModel<LoginsPageWidget> {
  ///  Local state fields for this page.

  String? searchQuery = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<LoginsRow>>? requestCompleter;
  // Models for LoginCards dynamic component.
  late FlutterFlowDynamicModels<LoginCardsModel> loginCardsModels;
  // Model for Logout component.
  late LogoutModel logoutModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loginCardsModels = FlutterFlowDynamicModels(() => LoginCardsModel());
    logoutModel = createModel(context, () => LogoutModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    loginCardsModels.dispose();
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
