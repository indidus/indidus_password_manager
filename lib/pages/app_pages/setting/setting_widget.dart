import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:indidus_password_manager/auth/firebase_auth/auth_util.dart';
import 'package:indidus_password_manager/auth/local_auth_observer.dart';
import 'package:indidus_password_manager/components/settings/forms/update_profile/update_profile_widget.dart';
import 'package:indidus_password_manager/src/lib/backup_restore_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'setting_model.dart';

export 'setting_model.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  late SettingModel _model;
  var observer = LocalAuthObserver();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  SettingsThemeData getSettingsTheme(BuildContext context) {
    return SettingsThemeData(
      settingsSectionBackground: Theme.of(context).colorScheme.background,
      settingsListBackground: Theme.of(context).colorScheme.surfaceVariant,
      titleTextColor: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingModel());

    // Ensure local authentication is required when the app is resumed
    WidgetsBinding.instance.addObserver(observer);

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Setting'});
  }

  @override
  void dispose() {
    _model.dispose();

    WidgetsBinding.instance.removeObserver(observer);

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
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            floating: false,
            automaticallyImplyLeading: false,
            title: const Text('Settings'),
            leading: IconButton(
              onPressed: () {
                context.safePop();
              },
              icon: const Icon(Icons.chevron_left),
            ),
            centerTitle: false,
            elevation: 0.0,
          )
        ],
        body: SettingsList(
          lightTheme: getSettingsTheme(context),
          sections: [
            SettingsSection(
              title: const Text('User Profile'),
              tiles: [
                SettingsTile.navigation(
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(currentUserPhoto),
                    child: Text(
                      currentUserDisplayName.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  title: Text(currentUserDisplayName),
                  description: Text(currentUserEmail),
                  enabled: true,
                  onPressed: (context) => showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.3,
                          child: const UpdateProfileWidget(),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {})),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('Backup & Restore'),
              tiles: [
                SettingsTile.navigation(
                  title: const Text('Backup'),
                  description: const Text(
                    'Back up your data to Local storage in JSON format',
                  ),
                  onPressed: (context) async {
                    logFirebaseEvent('SETTING_PAGE_Backup_ON_TAP');
                    var path = await BackupRestoreManager().backup();
                    if (path != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Backup saved to $path'),
                        ),
                      );
                    }
                    logFirebaseEvent('Backup_restore');
                  },
                ),
                SettingsTile(
                  title: const Text('Restore'),
                  description: const Text(
                    'Restore your data from a backup file',
                  ),
                  onPressed: (context) async {
                    logFirebaseEvent('SETTING_PAGE_Restore_ON_TAP');
                    var model = await BackupRestoreManager().restoreBackup();
                    model.isFailed
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Restore failed'),
                            ),
                          )
                        : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Restore success, please restart / refresh app',
                              ),
                            ),
                          );
                    logFirebaseEvent('Backup_restore');
                  },
                ),
              ],
            ),
            SettingsSection(
              title: const Text('Legal'),
              tiles: [
                SettingsTile(
                  title: const Text('Terms and Conditions'),
                  description: const Text(
                    'Terms and Conditions of Indidus Password Manager',
                  ),
                  onPressed: (context) => launchUrl(
                    Uri.parse(
                      'https://password.indidus.com/indidus-password-manager-terms-and-conditions/',
                    ),
                  ),
                ),
                SettingsTile(
                  title: const Text('Privacy Policy'),
                  description: const Text(
                    'Privacy Policy of Indidus Password Manager',
                  ),
                  onPressed: (context) => launchUrl(
                    Uri.parse(
                      'https://password.indidus.com/indidus-password-manager-privacy-policy/',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // return GestureDetector(
    //   onTap: () => _model.unfocusNode.canRequestFocus
    //       ? FocusScope.of(context).requestFocus(_model.unfocusNode)
    //       : FocusScope.of(context).unfocus(),
    //   child: Scaffold(
    //     key: scaffoldKey,
    //     body: SafeArea(
    //       top: true,
    //       child: Column(
    //         mainAxisSize: MainAxisSize.max,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Padding(
    //             padding:
    //                 const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
    //             child: Container(
    //               width: double.infinity,
    //               decoration: BoxDecoration(
    //                   color: Theme.of(context).colorScheme.background),
    //               child: Padding(
    //                 padding: const EdgeInsetsDirectional.fromSTEB(
    //                     16.0, 8.0, 16.0, 8.0),
    //                 child: Row(
    //                   mainAxisSize: MainAxisSize.max,
    //                   children: [
    //                     FlutterFlowIconButton(
    //                       borderRadius: 20.0,
    //                       borderWidth: 1.0,
    //                       buttonSize: 40.0,
    //                       icon: Icon(
    //                         Icons.chevron_left,
    //                         color: FlutterFlowTheme.of(context).primaryText,
    //                         size: 24.0,
    //                       ),
    //                       onPressed: () async {
    //                         logFirebaseEvent(
    //                             'SETTING_PAGE_chevron_left_ICN_ON_TAP');
    //                         logFirebaseEvent(
    //                             'IconButton_close_dialog,_drawer,_etc');
    //                         context.safePop();
    //                       },
    //                     ),
    //                     Container(
    //                       width: 72.0,
    //                       height: 72.0,
    //                       decoration: BoxDecoration(
    //                         color: FlutterFlowTheme.of(context)
    //                             .secondaryBackground,
    //                         shape: BoxShape.circle,
    //                         border: Border.all(
    //                           color: FlutterFlowTheme.of(context).secondaryText,
    //                           width: 2.0,
    //                         ),
    //                       ),
    //                       child: Row(
    //                         mainAxisSize: MainAxisSize.max,
    //                         children: [
    //                           if (currentUserPhoto != '')
    //                             Padding(
    //                               padding: const EdgeInsets.all(4.0),
    //                               child: AuthUserStreamWidget(
    //                                 builder: (context) => ClipRRect(
    //                                   borderRadius: BorderRadius.circular(40.0),
    //                                   child: Image.network(
    //                                     currentUserPhoto,
    //                                     width: 60.0,
    //                                     height: 60.0,
    //                                     fit: BoxFit.cover,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           if (currentUserPhoto == '')
    //                             Padding(
    //                               padding: const EdgeInsetsDirectional.fromSTEB(
    //                                   3.0, 0.0, 0.0, 0.0),
    //                               child: AuthUserStreamWidget(
    //                                 builder: (context) => Icon(
    //                                   Icons.person,
    //                                   color: FlutterFlowTheme.of(context)
    //                                       .secondaryText,
    //                                   size: 62.0,
    //                                 ),
    //                               ),
    //                             ),
    //                         ],
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsetsDirectional.fromSTEB(
    //                           16.0, 0.0, 0.0, 0.0),
    //                       child: Column(
    //                         mainAxisSize: MainAxisSize.max,
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           AuthUserStreamWidget(
    //                             builder: (context) => Text(
    //                               currentUserDisplayName,
    //                               style: FlutterFlowTheme.of(context)
    //                                   .headlineSmall
    //                                   .override(
    //                                     fontFamily: 'Readex Pro',
    //                                     fontWeight: FontWeight.w300,
    //                                   ),
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsetsDirectional.fromSTEB(
    //                                 0.0, 4.0, 0.0, 0.0),
    //                             child: Text(
    //                               currentUserEmail,
    //                               style:
    //                                   FlutterFlowTheme.of(context).labelMedium,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding:
    //                 const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
    //             child: Text(
    //               'Account',
    //               style: FlutterFlowTheme.of(context).labelLarge,
    //             ),
    //           ),
    //           Padding(
    //             padding:
    //                 const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
    //             child: InkWell(
    //               splashColor: Colors.transparent,
    //               focusColor: Colors.transparent,
    //               hoverColor: Colors.transparent,
    //               highlightColor: Colors.transparent,
    //               onTap: () async {
    //                 logFirebaseEvent('SETTING_PAGE_Container_wgj90aeh_ON_TAP');
    //                 logFirebaseEvent('Container_bottom_sheet');
    //                 showModalBottomSheet(
    //                   isScrollControlled: true,
    //                   backgroundColor: Colors.transparent,
    //                   useSafeArea: true,
    //                   context: context,
    //                   builder: (context) {
    //                     return GestureDetector(
    //                       onTap: () => _model.unfocusNode.canRequestFocus
    //                           ? FocusScope.of(context)
    //                               .requestFocus(_model.unfocusNode)
    //                           : FocusScope.of(context).unfocus(),
    //                       child: Padding(
    //                         padding: MediaQuery.viewInsetsOf(context),
    //                         child: SizedBox(
    //                           height: MediaQuery.sizeOf(context).height * 0.3,
    //                           child: const UpdateProfileWidget(),
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                 ).then((value) => safeSetState(() {}));
    //               },
    //               child: Container(
    //                 width: double.infinity,
    //                 height: 60.0,
    //                 decoration: BoxDecoration(
    //                   color: FlutterFlowTheme.of(context).secondaryBackground,
    //                   borderRadius: BorderRadius.circular(12.0),
    //                 ),
    //                 alignment: const AlignmentDirectional(0.0, 0.0),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(12.0),
    //                   child: Row(
    //                     mainAxisSize: MainAxisSize.max,
    //                     children: [
    //                       Icon(
    //                         Icons.account_circle_outlined,
    //                         color: FlutterFlowTheme.of(context).secondaryText,
    //                         size: 24.0,
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsetsDirectional.fromSTEB(
    //                             12.0, 0.0, 0.0, 0.0),
    //                         child: Text(
    //                           'Edit Profile',
    //                           style: FlutterFlowTheme.of(context)
    //                               .labelMedium
    //                               .override(
    //                                 fontFamily: 'Inter',
    //                                 fontWeight: FontWeight.normal,
    //                               ),
    //                         ),
    //                       ),
    //                       Expanded(
    //                         child: Align(
    //                           alignment: const AlignmentDirectional(0.9, 0.0),
    //                           child: Icon(
    //                             Icons.arrow_forward_ios,
    //                             color:
    //                                 FlutterFlowTheme.of(context).secondaryText,
    //                             size: 18.0,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding:
    //                 const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
    //             child: InkWell(
    //               splashColor: Colors.transparent,
    //               focusColor: Colors.transparent,
    //               hoverColor: Colors.transparent,
    //               highlightColor: Colors.transparent,
    //               onTap: () async {
    //                 logFirebaseEvent('SETTING_PAGE_Container_f9dqpkv3_ON_TAP');
    //                 logFirebaseEvent('Container_bottom_sheet');
    //                 showModalBottomSheet(
    //                   isScrollControlled: true,
    //                   backgroundColor: Colors.transparent,
    //                   useSafeArea: true,
    //                   context: context,
    //                   builder: (context) {
    //                     return GestureDetector(
    //                       onTap: () => _model.unfocusNode.canRequestFocus
    //                           ? FocusScope.of(context)
    //                               .requestFocus(_model.unfocusNode)
    //                           : FocusScope.of(context).unfocus(),
    //                       child: Padding(
    //                         padding: MediaQuery.viewInsetsOf(context),
    //                         child: const SizedBox(
    //                           height: 200.0,
    //                           child: SupprotWidget(),
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                 ).then((value) => safeSetState(() {}));
    //               },
    //               child: Container(
    //                 width: double.infinity,
    //                 height: 60.0,
    //                 decoration: BoxDecoration(
    //                   color: FlutterFlowTheme.of(context).secondaryBackground,
    //                   borderRadius: BorderRadius.circular(12.0),
    //                 ),
    //                 alignment: const AlignmentDirectional(0.0, 0.0),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(12.0),
    //                   child: Row(
    //                     mainAxisSize: MainAxisSize.max,
    //                     children: [
    //                       Icon(
    //                         Icons.help_outline_rounded,
    //                         color: FlutterFlowTheme.of(context).secondaryText,
    //                         size: 24.0,
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsetsDirectional.fromSTEB(
    //                             12.0, 0.0, 0.0, 0.0),
    //                         child: Text(
    //                           'Support',
    //                           style: FlutterFlowTheme.of(context)
    //                               .labelMedium
    //                               .override(
    //                                 fontFamily: 'Inter',
    //                                 fontWeight: FontWeight.normal,
    //                               ),
    //                         ),
    //                       ),
    //                       Expanded(
    //                         child: Align(
    //                           alignment: const AlignmentDirectional(0.9, 0.0),
    //                           child: Icon(
    //                             Icons.arrow_forward_ios,
    //                             color:
    //                                 FlutterFlowTheme.of(context).secondaryText,
    //                             size: 18.0,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding:
    //                 const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
    //             child: Container(
    //               width: double.infinity,
    //               height: 60.0,
    //               decoration: BoxDecoration(
    //                 color: FlutterFlowTheme.of(context).secondaryBackground,
    //                 borderRadius: BorderRadius.circular(12.0),
    //               ),
    //               alignment: const AlignmentDirectional(0.0, 0.0),
    //               child: Padding(
    //                 padding: const EdgeInsets.all(12.0),
    //                 child: Row(
    //                   mainAxisSize: MainAxisSize.max,
    //                   children: [
    //                     Icon(
    //                       Icons.privacy_tip_rounded,
    //                       color: FlutterFlowTheme.of(context).secondaryText,
    //                       size: 24.0,
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsetsDirectional.fromSTEB(
    //                           12.0, 0.0, 0.0, 0.0),
    //                       child: Text(
    //                         'Terms of Service',
    //                         style: FlutterFlowTheme.of(context)
    //                             .labelMedium
    //                             .override(
    //                               fontFamily: 'Inter',
    //                               fontWeight: FontWeight.normal,
    //                             ),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Align(
    //                         alignment: const AlignmentDirectional(0.9, 0.0),
    //                         child: Icon(
    //                           Icons.arrow_forward_ios,
    //                           color: FlutterFlowTheme.of(context).secondaryText,
    //                           size: 18.0,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Align(
    //             alignment: const AlignmentDirectional(0.0, 0.0),
    //             child: Padding(
    //               padding:
    //                   const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
    //               child: FFButtonWidget(
    //                 onPressed: () async {
    //                   logFirebaseEvent('SETTING_PAGE_LOG_OUT_BTN_ON_TAP');
    //                   logFirebaseEvent('Button_auth');
    //                   GoRouter.of(context).prepareAuthEvent();
    //                   await authManager.signOut();
    //                   // if (asyncFuncVar != null) {
    //                   //   await asyncFuncVar!();
    //                   // }
    //                   GoRouter.of(context).clearRedirectLocation();

    //                   context.goNamedAuth(
    //                     'GoogleOnlyLoginPage',
    //                     context.mounted,
    //                   );
    //                 },
    //                 text: 'Log Out',
    //                 options: FFButtonOptions(
    //                   width: 150.0,
    //                   height: 44.0,
    //                   padding: const EdgeInsetsDirectional.fromSTEB(
    //                       0.0, 0.0, 0.0, 0.0),
    //                   iconPadding: const EdgeInsetsDirectional.fromSTEB(
    //                       0.0, 0.0, 0.0, 0.0),
    //                   color: FlutterFlowTheme.of(context).primaryBackground,
    //                   textStyle:
    //                       FlutterFlowTheme.of(context).labelLarge.override(
    //                             fontFamily: 'Inter',
    //                             fontWeight: FontWeight.normal,
    //                           ),
    //                   elevation: 0.0,
    //                   borderSide: const BorderSide(
    //                     color: Color(0x00000000),
    //                     width: 2.0,
    //                   ),
    //                   borderRadius: BorderRadius.circular(38.0),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
