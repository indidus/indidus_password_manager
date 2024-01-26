import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/logout/logout_widget.dart';
import '/components/notes/empty_note_list/empty_note_list_widget.dart';
import '/components/notes/forms/create_note/create_note_widget.dart';
import '/components/notes/notes_cards/notes_cards_widget.dart';
import '/components/setting_button/setting_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                child: const SizedBox(
                  height: 60.0,
                  child: CreateNoteWidget(),
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
          SliverAppBar(
            pinned: true,
            floating: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Notes',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                wrapWithModel(
                  model: _model.logoutModel,
                  updateCallback: () => setState(() {}),
                  child: const LogoutWidget(),
                ),
                wrapWithModel(
                  model: _model.settingButtonModel,
                  updateCallback: () => setState(() {}),
                  child: const SettingButtonWidget(),
                ),
              ],
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          )
        ],
        body: Builder(
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        const Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      onFieldSubmitted: (_) async {
                        logFirebaseEvent(
                            'NOTES_TextField_n15j3gf9_ON_TEXTFIELD_SU');
                        logFirebaseEvent('TextField_update_page_state');
                        setState(() {
                          _model.searchQuery = _model.textController.text;
                        });
                        logFirebaseEvent('TextField_refresh_database_request');
                        setState(() => _model.requestCompleter = null);
                        await _model.waitForRequestCompleted();
                      },
                      textInputAction: TextInputAction.search,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintText: 'Search',
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        suffixIcon: _model.textController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textController?.clear();
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.clear,
                                  size: 24.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      maxLines: null,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.75,
                  decoration: const BoxDecoration(),
                  child: FutureBuilder<List<NotesRow>>(
                    future:
                        (_model.requestCompleter ??= Completer<List<NotesRow>>()
                              ..complete(NotesTable().queryRows(
                                queryFn: (q) => q
                                    .eq(
                                      'created_by',
                                      currentUserUid,
                                    )
                                    .eq(
                                      'name',
                                      _model.searchQuery!,
                                    )
                                    .order('created_at'),
                                limit: 20,
                              )))
                            .future,
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<NotesRow> listViewNotesRowList = snapshot.data!;
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
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewNotesRowList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewNotesRow =
                                listViewNotesRowList[listViewIndex];
                            return NotesCardsWidget(
                              key: Key(
                                  'Keynos_${listViewIndex}_of_${listViewNotesRowList.length}'),
                              note: listViewNotesRow,
                              refreshListCallback: () async {},
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
