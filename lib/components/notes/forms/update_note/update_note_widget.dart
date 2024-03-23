import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/api/simple.dart';
import '/src/rust/models/notes.dart';
import 'update_note_model.dart';

export 'update_note_model.dart';

class UpdateNoteWidget extends StatefulWidget {
  const UpdateNoteWidget({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  State<UpdateNoteWidget> createState() => _UpdateNoteWidgetState();
}

class _UpdateNoteWidgetState extends State<UpdateNoteWidget> {
  late UpdateNoteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateNoteModel());

    _model.nameFieldController ??=
        TextEditingController(text: widget.note.name);
    _model.nameFieldFocusNode ??= FocusNode();

    _model.noteFieldController ??=
        TextEditingController(text: widget.note.note);
    _model.noteFieldFocusNode ??= FocusNode();
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
        decoration: getModalBottomSheetBoxDecoration(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalBottomSheetUpperBar(),
            const ModalBottomSheetHeaderText(level: "Update a note"),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.nameFieldController,
                          focusNode: _model.nameFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Name of the note",
                          ),
                          validator: _model.nameFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: getEdgeInsetsDirectional(),
                        child: TextFormField(
                          controller: _model.noteFieldController,
                          focusNode: _model.noteFieldFocusNode,
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: false,
                          decoration: getInputDecoration(
                            context,
                            "Leave a note here",
                          ),
                          maxLines: 4,
                          validator: _model.noteFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
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
                  FilledButton(
                    onPressed: () async {
                      if (_model.formKey.currentState!.validate()) {
                        logFirebaseEvent(
                            'UPDATE_NOTE_COMP_NoteUpdateButton_ON_TAP');
                        putNote(
                          id: widget.note.id!,
                          data: Note(
                            createdAt: widget.note.createdAt!,
                            createdBy: widget.note.createdBy!,
                            updatedAt: getCurrentTimestamp,
                            updatedBy: currentUserUid,
                            name: _model.nameFieldController.text,
                            note: _model.noteFieldController.text,
                          ),
                        );
                        logFirebaseEvent('NoteUpdateButton_navigate_back');
                        context.pop();
                      }
                    },
                    child: const Text("Update"),
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
