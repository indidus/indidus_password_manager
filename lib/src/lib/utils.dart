import 'package:flutter/material.dart';
import 'package:indidus_password_manager/auth/firebase_auth/auth_util.dart';
import 'package:indidus_password_manager/flutter_flow/flutter_flow_util.dart';

class EmptyListCard extends StatelessWidget {
  const EmptyListCard({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 0.02,
              color: Color(0x33000000),
              offset: Offset(0.0, 0.03),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 0.01,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class ListMetadataChip extends StatelessWidget {
  final DateTime? updatedAt;
  final DateTime createdAt;
  const ListMetadataChip({
    super.key,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Text(
          updatedAt == null
              ? 'Created  ${dateTimeFormat(
                  'relative',
                  createdAt,
                  locale: FFLocalizations.of(context).languageCode,
                )}'
              : 'Updated ${dateTimeFormat(
                  'relative',
                  updatedAt,
                  locale: FFLocalizations.of(context).languageCode,
                )}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 10.0,
                fontWeight: FontWeight.w300,
              ),
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
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

BoxDecoration getModalBottomSheetBoxDecoration(
  BuildContext context, {
  bool isAll = false,
}) {
  return BoxDecoration(
    color: Theme.of(context).colorScheme.surface,
    borderRadius: BorderRadius.only(
      bottomLeft:
          isAll ? const Radius.circular(16.0) : const Radius.circular(0.0),
      bottomRight:
          isAll ? const Radius.circular(16.0) : const Radius.circular(0.0),
      topLeft: const Radius.circular(16.0),
      topRight: const Radius.circular(16.0),
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

class SiteIconImage extends StatelessWidget {
  const SiteIconImage({
    super.key,
    required this.url,
    required this.initials,
  });

  final String? url;
  final String initials;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: NetworkImage(
        'https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=256&url=$url',
      ),
      radius: 30.0,
      backgroundColor:
          Colors.primaries[initials.codeUnitAt(0) % Colors.primaries.length],
      child: Text(
        initials.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
