import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indidus_password_manager/components/notes/note_search_delegate/note_search_delegate_widget.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';

import '/components/logout/logout_widget.dart';
import '/components/notes/empty_note_list/empty_note_list_widget.dart';
import '/components/notes/forms/create_note/create_note_widget.dart';
import '/components/notes/notes_cards/notes_cards_widget.dart';
import '/components/setting_button/setting_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/src/rust/api/simple.dart';
import '/src/rust/models/notes.dart';
import 'notes_page_model.dart';

export 'notes_page_model.dart';

class NotesPageWidget extends StatefulWidget {
  const NotesPageWidget({super.key});

  @override
  State<NotesPageWidget> createState() => _NotesPageWidgetState();
}

class _NotesPageWidgetState extends State<NotesPageWidget> {
  late NotesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'NotesPage'});
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
          logFirebaseEvent('NOTES_FloatingActionButton_3p05vpdn_ON_T');
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
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  child: const CreateNoteWidget(),
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
            title: const Text('Notes'),
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
                  var notes = await listNote(query: getSearchQuery(null, null));
                  // ignore: use_build_context_synchronously
                  showSearch(
                    context: context,
                    delegate: NoteSearchDelegate(
                      notes: notes,
                      refreshList: () {
                        logFirebaseEvent('NOTES_Container_2r7a8tks_CALLBACK');
                        logFirebaseEvent(
                            'NoteSearchDelegate_refresh_database_request');
                        setState(() => _model.requestCompleter = null);
                        return _model.waitForRequestCompleted();
                      },
                    ),
                  ).then((value) {
                    logFirebaseEvent(
                      'NoteSearchDelegate_refresh_database_re',
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
            return FutureBuilder<List<Note>>(
              future: (_model.requestCompleter ??= Completer<List<Note>>()
                    ..complete(
                      listNote(
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
                List<Note> listViewNotesRowList = snapshot.data!;
                if (listViewNotesRowList.isEmpty) {
                  return Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 128.0,
                      child: const EmptyNoteListWidget(),
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    logFirebaseEvent(
                        'NOTES_ListView_27ifpm0h_ON_PULL_TO_REFRE');
                    logFirebaseEvent('ListView_refresh_database_request');
                    setState(() => _model.requestCompleter = null);
                    await _model.waitForRequestCompleted();
                  },
                  child: ListView.separated(
                    itemBuilder: (context, listViewIndex) {
                      final listViewNotesRow =
                          listViewNotesRowList[listViewIndex];
                      return NotesCardsWidget(
                        key: Key(
                            'Keynos_${listViewIndex}_of_${listViewNotesRowList.length}'),
                        note: listViewNotesRow,
                        refreshListCallback: () async {
                          logFirebaseEvent('NOTE_COMP_refresh_ICN_ON_TAP');
                          setState(() => _model.requestCompleter = null);
                          await _model.waitForRequestCompleted();
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: listViewNotesRowList.length,
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
