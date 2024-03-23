import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'create_note_widget.dart' show CreateNoteWidget;

class CreateNoteModel extends FlutterFlowModel<CreateNoteWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  String? _nameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for noteField widget.
  FocusNode? noteFieldFocusNode;
  TextEditingController? noteFieldController;
  String? Function(BuildContext, String?)? noteFieldControllerValidator;
  String? _noteFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameFieldControllerValidator = _nameFieldControllerValidator;
    noteFieldControllerValidator = _noteFieldControllerValidator;
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    noteFieldFocusNode?.dispose();
    noteFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
