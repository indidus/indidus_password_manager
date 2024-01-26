import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_note_widget.dart' show ViewNoteWidget;
import 'package:flutter/material.dart';

class ViewNoteModel extends FlutterFlowModel<ViewNoteWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for TextField component.
  late TextFieldModel textFieldModel1;
  // Model for TextField component.
  late TextFieldModel textFieldModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textFieldModel1 = createModel(context, () => TextFieldModel());
    textFieldModel2 = createModel(context, () => TextFieldModel());
  }

  @override
  void dispose() {
    textFieldModel1.dispose();
    textFieldModel2.dispose();
  }

  /// Action blocks are added here.

  Future mmmm(BuildContext context) async {}

  /// Additional helper methods are added here.
}
