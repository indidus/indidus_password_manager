import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indidus_password_manager/components/identity_card/identity_cards/identity_cards_widget.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';
import 'package:indidus_password_manager/src/rust/models/identity_cards.dart';

class IdentityCardSearchDelegate extends SearchDelegate<String> {
  final List<IdentityCard> identities;
  List<String> names = [];
  final Future Function() refreshList;
  IdentityCardSearchDelegate(
      {required this.identities, required this.refreshList}) {
    for (var i = 0; i < identities.length; i++) {
      names.add(identities[i].name);
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
    return FutureBuilder<List<IdentityCard>>(
      future: listIdentityCard(
        query: '''{
              "filters": [
                {
                  "column": "name",
                  "operator": "Eq",
                  "value": "$query"
                }
              ],
              "orders": [
                {
                  "column": "created_at",
                  "direction": "Desc"
                }
              ]
            }''',
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
        List<IdentityCard> listViewIdentityCardsRowList = snapshot.data!;

        return ListView.builder(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listViewIdentityCardsRowList.length,
          itemBuilder: (context, listViewIndex) {
            final listViewIdentityCardsRow =
                listViewIdentityCardsRowList[listViewIndex];
            return IdentityCardsWidget(
              key: Key(
                'Key51j_${listViewIdentityCardsRow.id.toString()}',
              ),
              identity: listViewIdentityCardsRow,
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
