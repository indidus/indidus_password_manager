import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indidus_password_manager/components/identity_card/identity_card_search_delegate/identity_card_search_delegate_widget.dart';
import 'package:indidus_password_manager/components/setting_button/setting_button_widget.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/components/identity_card/empty_identity_card_list/empty_identity_card_list_widget.dart';
import '/components/identity_card/forms/create_identity_card/create_identity_card_widget.dart';
import '/components/identity_card/identity_cards/identity_cards_widget.dart';
import '/components/logout/logout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/api/simple.dart';
import '/src/rust/models/identity_cards.dart';
import 'identity_cards_page_model.dart';

export 'identity_cards_page_model.dart';

class IdentityCardsPageWidget extends StatefulWidget {
  const IdentityCardsPageWidget({super.key});

  @override
  State<IdentityCardsPageWidget> createState() =>
      _IdentityCardsPageWidgetState();
}

class _IdentityCardsPageWidgetState extends State<IdentityCardsPageWidget> {
  late IdentityCardsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IdentityCardsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'IdentityCardsPage'});
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
          logFirebaseEvent('IDENTITY_CARDS_FloatingActionButton_kdg6');
          logFirebaseEvent('FloatingActionButton_bottom_sheet');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  child: const CreateIdentityCardWidget(),
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
            title: const Text('Identities'),
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
                  var identities =
                      await listIdentityCard(query: getSearchQuery(null, null));
                  // ignore: use_build_context_synchronously
                  await showSearch(
                    context: context,
                    delegate: IdentityCardSearchDelegate(
                      identities: identities,
                      refreshList: () {
                        logFirebaseEvent(
                            'IDENTITY_CARD_Container_2r7a8tks_CALLBACK');
                        logFirebaseEvent(
                            'IdentityCardSearchDelegate_refresh_database_request');
                        setState(() => _model.requestCompleter = null);
                        return _model.waitForRequestCompleted();
                      },
                    ),
                  ).then((value) {
                    logFirebaseEvent(
                      'IdentityCardSearchDelegate_refresh_database_re',
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
            return FutureBuilder<List<IdentityCard>>(
              future:
                  (_model.requestCompleter ??= Completer<List<IdentityCard>>()
                        ..complete(
                          listIdentityCard(
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
                List<IdentityCard> listViewIdentityCardsRowList =
                    snapshot.data!;
                if (listViewIdentityCardsRowList.isEmpty) {
                  return Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 150.0,
                      child: const EmptyIdentityCardListWidget(),
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    logFirebaseEvent(
                        'IDENTITY_CARDS_ListView_dxlxnu2u_ON_PULL');
                    logFirebaseEvent('ListView_refresh_database_request');
                    setState(() => _model.requestCompleter = null);
                    await _model.waitForRequestCompleted();
                  },
                  child: ListView.separated(
                    itemBuilder: (context, listViewIndex) {
                      final listViewIdentityCardsRow =
                          listViewIdentityCardsRowList[listViewIndex];
                      return IdentityCardsWidget(
                        key: Key(
                          'Key46l_${listViewIdentityCardsRow.id.toString()}',
                        ),
                        identity: listViewIdentityCardsRow,
                        refreshListCallback: () async {
                          logFirebaseEvent('NOTE_COMP_refresh_ICN_ON_TAP');
                          setState(() => _model.requestCompleter = null);
                          await _model.waitForRequestCompleted();
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: listViewIdentityCardsRowList.length,
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
