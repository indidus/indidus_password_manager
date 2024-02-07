import 'package:indidus_password_manager/auth/firebase_auth/auth_util.dart';

String getSearchQuery(String? query, String? name) {
  if (query == null || query.isEmpty || query.trim().isEmpty) {
    return '{"filters": [{"column": "created_by", "operator": "Eq", "value": "$currentUserUid"}], "orders": [{"column": "created_at", "direction": "Desc"}]}';
  }
  if (name == null || name.isEmpty || name.trim().isEmpty) {
    return '{"filters": [{"column": "name", "operator": "Eq", "value": "$query"}], "orders": [{"column": "created_at", "direction": "Desc"}]}';
  }
  return '{"filters": [{"column": "$name", "operator": "Eq", "value": "$query"}], "orders": [{"column": "created_at", "direction": "Desc"}]}';
}

// it will return null if the query is empty and the query if it is not empty
String? sanitizeString(String? query) {
  if (query == null || query.isEmpty || query.trim().isEmpty) {
    return null;
  }
  return query.trim();
}
