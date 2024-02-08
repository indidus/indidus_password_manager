import 'package:flutter/material.dart';

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
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 0.02,
              color: Color(0x33000000),
              offset: Offset(0.0, 0.03),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 0.01,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Text(
                  'No note are saved',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Text(
                'Please click on \'+\' button at bottom right corner to add your first note.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
