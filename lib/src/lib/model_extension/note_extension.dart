

// noteFromJson(Map<String, dynamic> json) => Note(
//       id: json['id'] as String?,
//       createdAt: json['created_at'] != null
//           ? DateTime.parse(json['created_at'] as String)
//           : null,
//       createdBy: json['created_by'] as String?,
//       updatedAt: json['updated_at'] != null
//           ? DateTime.parse(json['updated_at'] as String)
//           : null,
//       updatedBy: json['updated_by'] as String?,
//       name: json['name'] as String,
//       note: json['note'] as String?,
//     );

// extension NoteJson on Note {
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'created_at': createdAt?.toIso8601String(),
//       'created_by': createdBy,
//       'updated_at': updatedAt?.toIso8601String(),
//       'updated_by': updatedBy,
//       'name': name,
//       'note': note,
//     };
//   }
// }
