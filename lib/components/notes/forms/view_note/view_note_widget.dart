import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/notes.dart';
import 'view_note_model.dart';

export 'view_note_model.dart';

class ViewNoteWidget extends StatefulWidget {
  const ViewNoteWidget({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  State<ViewNoteWidget> createState() => _ViewNoteWidgetState();
}

class _ViewNoteWidgetState extends State<ViewNoteWidget> {
  late ViewNoteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewNoteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height * 0.6,
          maxHeight: MediaQuery.sizeOf(context).height * 0.6,
        ),
        decoration: getModalBottomSheetBoxDecoration(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalBottomSheetUpperBar(),
            const ModalBottomSheetHeaderText(level: "View Note"),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    wrapWithModel(
                      model: _model.textFieldModel1,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Name',
                        fieldValue: widget.note.name,
                        isThreeLine: true,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.textFieldModel2,
                      updateCallback: () => setState(() {}),
                      child: TextFieldWidget(
                        fieldName: 'Note',
                        fieldValue: widget.note.note,
                        isThreeLine: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Container(
              padding: getModalBottomSheetFooterPadding(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
