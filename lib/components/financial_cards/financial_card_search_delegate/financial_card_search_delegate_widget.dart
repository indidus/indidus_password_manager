import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indidus_password_manager/components/financial_cards/financial_cards/financial_cards_widget.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';
import 'package:indidus_password_manager/src/rust/models/financial_cards.dart';

class FinancialCardSearchDelegate extends SearchDelegate<String> {
  final List<FinancialCard> cards;
  List<String> names = [];
  final Future Function() refreshList;
  FinancialCardSearchDelegate(
      {required this.cards, required this.refreshList}) {
    for (var i = 0; i < cards.length; i++) {
      names.add(cards[i].name);
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
    return FutureBuilder<List<FinancialCard>>(
      future: listFinancialCard(
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
        List<FinancialCard> listViewFinancialCardsRowList = snapshot.data!;

        return ListView.builder(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listViewFinancialCardsRowList.length,
          itemBuilder: (context, listViewIndex) {
            final listViewFinancialCardsRow =
                listViewFinancialCardsRowList[listViewIndex];
            return FinancialCardsWidget(
              key: Key(
                'Key51j_${listViewFinancialCardsRow.id.toString()}',
              ),
              card: listViewFinancialCardsRow,
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
