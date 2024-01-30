import 'dart:async';

import 'package:flutter/material.dart';

import '/components/logout/logout_widget.dart';
import '/components/setting_button/setting_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/notes.dart';
import 'notes_page_widget.dart' show NotesPageWidget;

class NotesPageModel extends FlutterFlowModel<NotesPageWidget> {
  ///  Local state fields for this page.

  String? searchQuery = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<Note>>? requestCompleter;
  // Model for Logout component.
  late LogoutModel logoutModel;
  // Model for SettingButton component.
  late SettingButtonModel settingButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    logoutModel = createModel(context, () => LogoutModel());
    settingButtonModel = createModel(context, () => SettingButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    logoutModel.dispose();
    settingButtonModel.dispose();
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
