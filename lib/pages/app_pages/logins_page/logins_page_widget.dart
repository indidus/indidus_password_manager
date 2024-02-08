import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indidus_password_manager/components/logins/login_cards/login_cards_widget.dart';
import 'package:indidus_password_manager/components/logins/login_search_delegate/login_search_delegate_widget.dart';
import 'package:indidus_password_manager/components/logout/logout_widget.dart';
import 'package:indidus_password_manager/components/setting_button/setting_button_widget.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';

import '/components/logins/empty_login_list/empty_login_list_widget.dart';
import '/components/logins/forms/create_login/create_login_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/models/logins.dart';
import 'logins_page_model.dart';

export 'logins_page_model.dart';

class LoginsPageWidget extends StatefulWidget {
  const LoginsPageWidget({super.key});

  @override
  State<LoginsPageWidget> createState() => _LoginsPageWidgetState();
}

class _LoginsPageWidgetState extends State<LoginsPageWidget> {
  late LoginsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginsPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LoginsPage'});
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
          logFirebaseEvent('LOGINS_FloatingActionButton_2r798tkq_ON_');
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
                  height: MediaQuery.sizeOf(context).height * 0.75,
                  child: const CreateLoginWidget(),
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
            title: const Text('Logins'),
            leading: wrapWithModel(
              model: _model.logoutModel,
              updateCallback: () => setState(() {}),
              child: const LogoutWidget(),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  logFirebaseEvent('LOGINS_IconButton_2r7a8tks_ON_');
                  logFirebaseEvent('IconButton_search_button');
                  var logins =
                      await listLogin(query: getSearchQuery(null, null));
                  // ignore: use_build_context_synchronously
                  showSearch(
                    context: context,
                    delegate: LoginSearchDelegate(
                      logins: logins,
                      refreshList: () {
                        logFirebaseEvent('LOGINS_Container_2r7a8tks_CALLBACK');
                        logFirebaseEvent(
                            'LoginSearchDelegate_refresh_database_request');
                        setState(() => _model.requestCompleter = null);
                        return _model.waitForRequestCompleted();
                      },
                    ),
                  ).then((value) {
                    logFirebaseEvent(
                      'LoginSearchDelegate_refresh_database_re',
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
            return FutureBuilder<List<Login>>(
              future: (_model.requestCompleter ??= Completer<List<Login>>()
                    ..complete(
                      listLogin(
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
                List<Login> listViewLoginsRowList = snapshot.data!;
                if (listViewLoginsRowList.isEmpty) {
                  return Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 128.0,
                      child: const EmptyLoginListWidget(),
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    logFirebaseEvent(
                        'LOGINS_ListView_b8tupkag_ON_PULL_TO_REFR');
                    setState(() => _model.requestCompleter = null);
                    await _model.waitForRequestCompleted();
                  },
                  child: ListView.separated(
                    itemBuilder: (context, listViewIndex) {
                      final listViewLoginsRow =
                          listViewLoginsRowList[listViewIndex];
                      return wrapWithModel(
                        model: _model.loginCardsModels.getModel(
                          listViewLoginsRow.id.toString(),
                          listViewIndex,
                        ),
                        updateCallback: () => setState(() {}),
                        child: LoginCardsWidget(
                          key: Key(
                              'Keynos_${listViewIndex}_of_${listViewLoginsRowList.length}'),
                          login: listViewLoginsRow,
                          refreshListCallback: () async {
                            logFirebaseEvent(
                                'LOGINS_CARDS_COMP_refresh_ICN_ON_TAP');
                            setState(() => _model.requestCompleter = null);
                            await _model.waitForRequestCompleted();
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: listViewLoginsRowList.length,
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
