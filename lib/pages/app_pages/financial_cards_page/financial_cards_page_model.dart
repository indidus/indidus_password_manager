import 'dart:async';

import 'package:flutter/material.dart';

import '/components/financial_cards/financial_cards/financial_cards_widget.dart';
import '/components/logout/logout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/finantial_cards.dart';
import 'financial_cards_page_widget.dart' show FinancialCardsPageWidget;

class FinancialCardsPageModel
    extends FlutterFlowModel<FinancialCardsPageWidget> {
  ///  Local state fields for this page.

  String? searchQuery = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<FinantialCard>>? requestCompleter;
  // Models for FinancialCards dynamic component.
  late FlutterFlowDynamicModels<FinancialCardsModel> financialCardsModels;
  // Model for Logout component.
  late LogoutModel logoutModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    financialCardsModels =
        FlutterFlowDynamicModels(() => FinancialCardsModel());
    logoutModel = createModel(context, () => LogoutModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    financialCardsModels.dispose();
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
