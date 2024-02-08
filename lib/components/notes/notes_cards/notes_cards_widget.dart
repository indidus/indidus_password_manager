import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indidus_password_manager/components/notes/delete_note_dialog/delete_note_dialog_widget.dart';
import 'package:indidus_password_manager/components/notes/forms/update_note/update_note_widget.dart';
import 'package:indidus_password_manager/components/notes/forms/view_note/view_note_widget.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/notes.dart';
import 'notes_cards_model.dart';

export 'notes_cards_model.dart';

class NotesCardsWidget extends StatefulWidget {
  const NotesCardsWidget({
    super.key,
    required this.note,
    required this.refreshListCallback,
  });

  final Note note;
  final Future Function() refreshListCallback;

  @override
  State<NotesCardsWidget> createState() => _NotesCardsWidgetState();
}

class _NotesCardsWidgetState extends State<NotesCardsWidget> {
  late NotesCardsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesCardsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) async {
              logFirebaseEvent('NOTES_CARDS_COMP_delete_ICN_ON_TAP');
              logFirebaseEvent('IconButton_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: SizedBox(
                      height: 300,
                      child: DeleteNoteDialogWidget(
                        note: widget.note,
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

              logFirebaseEvent('IconButton_execute_callback');
              await widget.refreshListCallback.call();
            },
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            foregroundColor: Theme.of(context).colorScheme.error,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) async {
              logFirebaseEvent('NOTES_CARDS_COMP_edit_ICN_ON_TAP');
              logFirebaseEvent('IconButton_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.9,
                      child: UpdateNoteWidget(
                        note: widget.note,
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
              logFirebaseEvent('IconButton_execute_callback');
              await widget.refreshListCallback.call();
            },
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Theme.of(context).colorScheme.primary,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: ListTile(
        onTap: () async {
          logFirebaseEvent('NOTES_CARDS_COMP_visibility_ICN_ON_TAP');
          logFirebaseEvent('IconButton_bottom_sheet');
          await showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: SizedBox(
                  height: 360,
                  child: ViewNoteWidget(
                    note: widget.note,
                  ),
                ),
              );
            },
          );
        },
        isThreeLine: false,
        leading: const Icon(Icons.edit_note_sharp, size: 40.0),
        title: Text(
          widget.note.name,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.note.note ?? "-",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ListMetadataChip(
              createdAt: widget.note.createdAt!,
              updatedAt: widget.note.updatedAt,
            ),
          ],
        ),
      ),
    );
  }
}
