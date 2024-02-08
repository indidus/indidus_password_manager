import 'package:flutter/material.dart';
import 'package:indidus_password_manager/auth/firebase_auth/auth_util.dart';

String getSearchQuery(String? inputQuery, String? fieldName) {
  if (inputQuery == null || inputQuery.isEmpty || inputQuery.trim().isEmpty) {
    return '{"filters": [{"column": "created_by", "operator": "Eq", "value": "$currentUserUid"}], "orders": [{"column": "created_at", "direction": "Desc"}]}';
  }
  if (fieldName == null || fieldName.isEmpty || fieldName.trim().isEmpty) {
    return '{"filters": [{"column": "name", "operator": "Eq", "value": "$inputQuery"}], "orders": [{"column": "created_at", "direction": "Desc"}]}';
  }
  return '{"filters": [{"column": "$fieldName", "operator": "Eq", "value": "$inputQuery"}], "orders": [{"column": "created_at", "direction": "Desc"}]}';
}

// it will return null if the query is empty and the query if it is not empty
String? sanitizeString(String? query) {
  if (query == null || query.isEmpty || query.trim().isEmpty) {
    return null;
  }
  return query.trim();
}

class ModalBottomSheetHeaderText extends StatelessWidget {
  final String level;
  const ModalBottomSheetHeaderText({
    super.key,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          level,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
      ),
    );
  }
}

class ModalBottomSheetUpperBar extends StatelessWidget {
  const ModalBottomSheetUpperBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            width: 60.0,
            height: 3.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
      ],
    );
  }
}

EdgeInsets getModalBottomSheetFooterPadding() {
  return const EdgeInsets.symmetric(
    vertical: 12.0,
    horizontal: 20.0,
  );
}

BoxDecoration getModalBottomSheetBoxDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).colorScheme.surface,
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(0.0),
      bottomRight: Radius.circular(0.0),
      topLeft: Radius.circular(16.0),
      topRight: Radius.circular(16.0),
    ),
  );
}

EdgeInsetsDirectional getEdgeInsetsDirectional() {
  return const EdgeInsetsDirectional.fromSTEB(
    16.0,
    16.0,
    16.0,
    0.0,
  );
}

InputDecoration getInputDecoration(
  BuildContext context,
  String lebel,
) {
  return InputDecoration(
    labelText: lebel,
    enabledBorder: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 1.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
        width: 2.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
        width: 2.0,
      ),
    ),
  );
}
