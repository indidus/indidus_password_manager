import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'update_login_widget.dart' show UpdateLoginWidget;

class UpdateLoginModel extends FlutterFlowModel<UpdateLoginWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? _nameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for usernameField widget.
  FocusNode? usernameFieldFocusNode;
  TextEditingController? usernameFieldController;
  String? Function(BuildContext, String?)? usernameFieldControllerValidator;
  String? _usernameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for passwordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;
  // State field(s) for urlField widget.
  FocusNode? urlFieldFocusNode;
  TextEditingController? urlFieldController;
  String? Function(BuildContext, String?)? urlFieldControllerValidator;
  String? _urlFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      // If the value is empty, we don't need to validate it.
      return null;
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Has to be a valid website. eg, https://www.example.com';
    }
    return null;
  }

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
    nameFieldControllerValidator = _nameFieldControllerValidator;
    usernameFieldControllerValidator = _usernameFieldControllerValidator;
    urlFieldControllerValidator = _urlFieldControllerValidator;
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
