import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indidus_password_manager/components/financial_cards/financial_card_search_delegate/financial_card_search_delegate_widget.dart';
import 'package:indidus_password_manager/components/setting_button/setting_button_widget.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';

import '/components/financial_cards/empty_financial_card_list/empty_financial_card_list_widget.dart';
import '/components/financial_cards/financial_cards/financial_cards_widget.dart';
import '/components/financial_cards/forms/create_financial_card/create_financial_card_widget.dart';
import '/components/logout/logout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/financial_cards.dart';
import 'financial_cards_page_model.dart';

export 'financial_cards_page_model.dart';

class FinancialCardsPageWidget extends StatefulWidget {
  const FinancialCardsPageWidget({super.key});

  @override
  State<FinancialCardsPageWidget> createState() =>
      _FinancialCardsPageWidgetState();
}

class _FinancialCardsPageWidgetState extends State<FinancialCardsPageWidget> {
  late FinancialCardsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinancialCardsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FinancialCardsPage'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('FINANCIAL_CARDS_FloatingActionButton_dja');
          logFirebaseEvent('FloatingActionButton_bottom_sheet');
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  child: const CreateFinancialCardWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          logFirebaseEvent('FloatingActionButton_refresh_database_re');
          setState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
        },
        elevation: 8.0,
        child: const Icon(
          Icons.add,
          size: 24.0,
        ),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, _) => [
          SliverAppBar.large(
            pinned: true,
            floating: false,
            automaticallyImplyLeading: false,
            title: const Text('Bank Cards'),
            leading: wrapWithModel(
              model: _model.logoutModel,
              updateCallback: () => setState(() {}),
              child: const LogoutWidget(),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  logFirebaseEvent('NOTES_IconButton_2r7a8tks_ON_');
                  logFirebaseEvent('IconButton_search_button');
                  var cards = await listFinancialCard(
                      query: getSearchQuery(null, null));
                  // ignore: use_build_context_synchronously
                  await showSearch(
                    context: context,
                    delegate: FinancialCardSearchDelegate(
                      cards: cards,
                      refreshList: () {
                        logFirebaseEvent(
                            'FINANTIAL_CARD_Container_2r7a8tks_CALLBACK');
                        logFirebaseEvent(
                            'FinancialCardSearchDelegate_refresh_database_request');
                        setState(() => _model.requestCompleter = null);
                        return _model.waitForRequestCompleted();
                      },
                    ),
                  ).then((value) {
                    logFirebaseEvent(
                      'FinancialCardSearchDelegate_refresh_database_re',
                    );
                    _model.searchQuery = value;
                    setState(() => _model.requestCompleter = null);
                    return _model.waitForRequestCompleted();
                  });
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              wrapWithModel(
                model: _model.settingButtonModel,
                updateCallback: () => safeSetState(() {}),
                child: const SettingButtonWidget(),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
            bottom: sanitizeString(_model.searchQuery) != null
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: sanitizeString(_model.searchQuery) != null
                          ? RawChip(
                              label: Text(
                                'Name: ${sanitizeString(_model.searchQuery)}',
                              ),
                              onDeleted: () {
                                safeSetState(() {
                                  _model.searchQuery = null;
                                  _model.requestCompleter = null;
                                });
                              },
                            )
                          : Container(),
                    ),
                  )
                : null,
          )
        ],
        body: Builder(
          builder: (context) {
            return FutureBuilder<List<FinancialCard>>(
              future:
                  (_model.requestCompleter ??= Completer<List<FinancialCard>>()
                        ..complete(
                          listFinancialCard(
                            query: getSearchQuery(
                              _model.searchQuery,
                              null,
                            ),
                          ),
                        ))
                      .future,
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return const Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                List<FinancialCard> listViewFinancialCardsRowList =
                    snapshot.data!;
                if (listViewFinancialCardsRowList.isEmpty) {
                  return Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 128.0,
                      child: const EmptyFinancialCardListWidget(),
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    logFirebaseEvent(
                        'FINANCIAL_CARDS_ListView_f0k41zum_ON_PUL');
                    logFirebaseEvent('ListView_refresh_database_request');
                    setState(() => _model.requestCompleter = null);
                    await _model.waitForRequestCompleted();
                  },
                  child: ListView.separated(
                    itemBuilder: (context, listViewIndex) {
                      final listViewFinancialCardsRow =
                          listViewFinancialCardsRowList[listViewIndex];
                      return FinancialCardsWidget(
                        key: Key(
                          'Keywzf_${listViewFinancialCardsRow.id.toString()}',
                        ),
                        card: listViewFinancialCardsRow,
                        refreshListCallback: () async {
                          logFirebaseEvent('NOTE_COMP_refresh_ICN_ON_TAP');
                          setState(() => _model.requestCompleter = null);
                          await _model.waitForRequestCompleted();
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: listViewFinancialCardsRowList.length,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
