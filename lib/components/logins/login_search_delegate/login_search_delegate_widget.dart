import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indidus_password_manager/components/logins/login_cards/login_cards_widget.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';
import 'package:indidus_password_manager/src/rust/models/logins.dart';

class LoginSearchDelegate extends SearchDelegate<String> {
  final List<Login> logins;
  List<String> names = [];
  final Future Function() refreshList;
  LoginSearchDelegate({required this.logins, required this.refreshList}) {
    for (var i = 0; i < logins.length; i++) {
      names.add(logins[i].name);
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
    return FutureBuilder<List<Login>>(
      future: listLogin(
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
        List<Login> listViewLoginsRowList = snapshot.data!;

        return ListView.builder(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listViewLoginsRowList.length,
          itemBuilder: (context, listViewIndex) {
            final listViewLoginsRow = listViewLoginsRowList[listViewIndex];
            return LoginCardsWidget(
              key: Key(
                'Key51j_${listViewLoginsRow.id.toString()}',
              ),
              login: listViewLoginsRow,
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
