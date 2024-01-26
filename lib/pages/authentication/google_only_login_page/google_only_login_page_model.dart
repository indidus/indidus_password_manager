import '/components/continue_with_google/continue_with_google_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'google_only_login_page_widget.dart' show GoogleOnlyLoginPageWidget;
import 'package:flutter/material.dart';

class GoogleOnlyLoginPageModel
    extends FlutterFlowModel<GoogleOnlyLoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for ContinueWithGoogle component.
  late ContinueWithGoogleModel continueWithGoogleModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    continueWithGoogleModel =
        createModel(context, () => ContinueWithGoogleModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    continueWithGoogleModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
