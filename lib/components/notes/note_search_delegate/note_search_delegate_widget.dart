import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indidus_password_manager/components/notes/notes_cards/notes_cards_widget.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';
import 'package:indidus_password_manager/src/rust/models/notes.dart';

class NoteSearchDelegate extends SearchDelegate<String> {
  final List<Note> notes;
  List<String> names = [];
  final Future Function() refreshList;
  NoteSearchDelegate({required this.notes, required this.refreshList}) {
    for (var i = 0; i < notes.length; i++) {
      names.add(notes[i].name);
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          // Navigator.of(context).pop();
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () async {
        query = '';
        Navigator.of(context).pop();
        // await refreshList();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Note>>(
      future: listNote(
        query: getSearchQuery(query, null),
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          if (kDebugMode) {
            print(snapshot.error);
          }
        }
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (kDebugMode) {
          print(snapshot.data?.length);
        }
        List<Note> listViewNotesRowList = snapshot.data!;

        return ListView.builder(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listViewNotesRowList.length,
          itemBuilder: (context, listViewIndex) {
            final listViewNotesRow = listViewNotesRowList[listViewIndex];
            return NotesCardsWidget(
              key: Key(
                'Key51j_${listViewNotesRow.id.toString()}',
              ),
              note: listViewNotesRow,
              refreshListCallback: () async {
                await refreshList();
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = query.isEmpty
        ? names
        : names
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            // Call for the filter
            // showResults(context);
            close(context, query);
          },
        );
      },
    );
  }
}
