import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_model.dart';

export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(40.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              autofocus: true,
              textInputAction: TextInputAction.search,
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                hintText: 'Search',
                hintStyle: FlutterFlowTheme.of(context).labelMedium,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                suffixIcon: const Icon(
                  Icons.search_sharp,
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              maxLines: null,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
        ),
      ),
    );
  }
}
