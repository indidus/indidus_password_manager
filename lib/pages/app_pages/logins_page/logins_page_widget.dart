import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indidus_password_manager/components/logins/login_search_delegate/login_search_delegate_widget.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';

import '/components/logins/empty_login_list/empty_login_list_widget.dart';
import '/components/logins/forms/create_login/create_login_widget.dart';
import '/components/logout/logout_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            logFirebaseEvent('LOGINS_FloatingActionButton_2r798tkq_ON_');
            logFirebaseEvent('FloatingActionButton_bottom_sheet');
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              useSafeArea: true,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.75,
                      child: CreateLoginWidget(
                        refreshCallback: () async {
                          logFirebaseEvent('_refresh_database_request');
                          setState(() => _model.requestCompleter = null);
                          await _model.waitForRequestCompleted();
                        },
                      ),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));

            logFirebaseEvent('FloatingActionButton_refresh_database_re');
            setState(() => _model.requestCompleter = null);
            await _model.waitForRequestCompleted();
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar.large(
              pinned: true,
              floating: false,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: const Text('Logins'),
              actions: [
                wrapWithModel(
                  model: _model.logoutModel,
                  updateCallback: () => setState(() {}),
                  child: const LogoutWidget(),
                ),
                IconButton(
                  onPressed: () async {
                    logFirebaseEvent('LOGINS_IconButton_2r7a8tks_ON_');
                    logFirebaseEvent('IconButton_search_button');
                    var logins = await listLogin(query: "{}");
                    // ignore: use_build_context_synchronously
                    showSearch(
                      context: context,
                      delegate: LoginSearchDelegate(
                        logins: logins,
                        refreshList: () {
                          logFirebaseEvent(
                              'LOGINS_Container_2r7a8tks_CALLBACK');
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
              ],
              centerTitle: false,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                    ),
                    FutureBuilder<List<Login>>(
                      future:
                          (_model.requestCompleter ??= Completer<List<Login>>()
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
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
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
                            logFirebaseEvent(
                                'ListView_refresh_database_request');
                            setState(() => _model.requestCompleter = null);
                            await _model.waitForRequestCompleted();
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewLoginsRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewLoginsRow =
                                  listViewLoginsRowList[listViewIndex];
                              return wrapWithModel(
                                model: _model.loginCardsModels.getModel(
                                  listViewLoginsRow.id.toString(),
                                  listViewIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: LoginListTile(
                                  id: listViewLoginsRow.id.toString(),
                                  accountName: listViewLoginsRow.name,
                                  loginId: listViewLoginsRow.username,
                                  siteUrl: listViewLoginsRow.url!,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LoginListTile extends StatelessWidget {
  final String id;
  final String accountName;
  final String siteUrl;
  final String loginId;

  const LoginListTile({
    super.key,
    required this.id,
    required this.accountName,
    this.loginId = '',
    this.siteUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      visualDensity: VisualDensity.standard,
      leading: const InkWell(
        // onTap: () async {
        //   try {
        //     final Uri url = Uri.parse(siteUrl);
        //     await launchUrl(url);
        //   } catch (e) {
        //     // TODOS: Show snackbar
        //   }
        // },
        child: Icon(Icons.login),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.copy),
        onPressed: () {
          Clipboard.setData(const ClipboardData(text: "your text"));
        },
      ),
      title: Text(
        accountName,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.roboto(
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        loginId,
        style: GoogleFonts.roboto(
          fontSize: 16,
        ),
      ),
      onTap: () {},
    );
  }
}

class LeadingFaviconImage extends StatelessWidget {
  final ImageProvider<Object> imageProvider;
  const LeadingFaviconImage({
    required this.imageProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0,
      height: 48.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
