import '/flutter_flow/flutter_flow_util.dart';
import 'update_login_widget.dart' show UpdateLoginWidget;
import 'package:flutter/material.dart';

class UpdateLoginModel extends FlutterFlowModel<UpdateLoginWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for usernameField widget.
  FocusNode? usernameFieldFocusNode;
  TextEditingController? usernameFieldController;
  String? Function(BuildContext, String?)? usernameFieldControllerValidator;
  // State field(s) for passwordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;
  // State field(s) for urlField widget.
  FocusNode? urlFieldFocusNode;
  TextEditingController? urlFieldController;
  String? Function(BuildContext, String?)? urlFieldControllerValidator;
  // State field(s) for passwordHintField widget.
  FocusNode? passwordHintFieldFocusNode;
  TextEditingController? passwordHintFieldController;
  String? Function(BuildContext, String?)? passwordHintFieldControllerValidator;
  // State field(s) for noteField widget.
  FocusNode? noteFieldFocusNode;
  TextEditingController? noteFieldController;
  String? Function(BuildContext, String?)? noteFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordFieldVisibility = false;
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    usernameFieldFocusNode?.dispose();
    usernameFieldController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldController?.dispose();

    urlFieldFocusNode?.dispose();
    urlFieldController?.dispose();

    passwordHintFieldFocusNode?.dispose();
    passwordHintFieldController?.dispose();

    noteFieldFocusNode?.dispose();
    noteFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
