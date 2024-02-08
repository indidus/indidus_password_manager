import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indidus_password_manager/components/notes/forms/update_note/update_note_widget.dart';
import 'package:indidus_password_manager/components/notes/forms/view_note/view_note_widget.dart';

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
    print(Theme.of(context).colorScheme.primaryContainer);
    print(Theme.of(context).colorScheme.primary);
    return Slidable(
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
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
        leading: const Icon(Icons.note_alt),
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

class ListMetadataChip extends StatelessWidget {
  final DateTime? updatedAt;
  final DateTime createdAt;
  const ListMetadataChip({
    super.key,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Text(
          updatedAt == null
              ? 'Created  ${dateTimeFormat(
                  'relative',
                  createdAt,
                  locale: FFLocalizations.of(context).languageCode,
                )}'
              : 'Updated ${dateTimeFormat(
                  'relative',
                  updatedAt,
                  locale: FFLocalizations.of(context).languageCode,
                )}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 10.0,
                fontWeight: FontWeight.w300,
              ),
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class UpdateBottomSheet extends StatefulWidget {
  // final Function onUpdate;
  const UpdateBottomSheet({
    super.key,
    // required this.onUpdate,
  });
  @override
  _UpdateBottomSheetState createState() => _UpdateBottomSheetState();
}

class _UpdateBottomSheetState extends State<UpdateBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Fixed Header
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Update Note",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ),
            ),
            const Divider(),

            // Scrollable Body
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      // Your scrollable content here
                      ListTile(title: Text("Item 1")),
                      ListTile(title: Text("Item 2")),
                      ListTile(title: Text("Item 3")),
                      ListTile(title: Text("Item 2")),
                      ListTile(title: Text("Item 3")),
                      ListTile(title: Text("Item 2")),
                      ListTile(title: Text("Item 3")),
                      ListTile(title: Text("Item 2")),
                      ListTile(title: Text("Item 3")),
                      ListTile(title: Text("Item 2")),
                      ListTile(title: Text("Item 3")),
                      ListTile(title: Text("Item 2")),
                      ListTile(title: Text("Item 3")),
                      ListTile(title: Text("Item 2")),
                      ListTile(title: Text("Item 3")),
                      ListTile(title: Text("Item 2")),
                      ListTile(title: Text("Item 3")),
                      // ...more items
                    ],
                  ),
                ),
              ),
            ),
            // Fixed Footer
            Container(
              color: Colors.grey[200],
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Cancel"),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Submit"),
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
