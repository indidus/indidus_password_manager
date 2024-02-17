import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'empty_note_list_model.dart';

export 'empty_note_list_model.dart';

class EmptyNoteListWidget extends StatefulWidget {
  const EmptyNoteListWidget({super.key});

  @override
  State<EmptyNoteListWidget> createState() => _EmptyNoteListWidgetState();
}

class _EmptyNoteListWidgetState extends State<EmptyNoteListWidget> {
  late EmptyNoteListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyNoteListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const EmptyListCard(
      title: 'No note are saved',
      description:
          'Please click on \'+\' button at bottom right corner to add your first note.',
    );
  }
}
