// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllNotesHash() => r'deab3280c9af87e644957b1571385c9929b8a74a';

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
///
/// Copied from [getAllNotes].
@ProviderFor(getAllNotes)
final getAllNotesProvider = AutoDisposeFutureProvider<List<Note>>.internal(
  getAllNotes,
  name: r'getAllNotesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllNotesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllNotesRef = AutoDisposeFutureProviderRef<List<Note>>;
String _$selectNoteHash() => r'31cf07431ce948eb25ccea684d33087ab5e05d11';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [selectNote].
@ProviderFor(selectNote)
const selectNoteProvider = SelectNoteFamily();

/// See also [selectNote].
class SelectNoteFamily extends Family<AsyncValue<Note?>> {
  /// See also [selectNote].
  const SelectNoteFamily();

  /// See also [selectNote].
  SelectNoteProvider call(
    String? id,
  ) {
    return SelectNoteProvider(
      id,
    );
  }

  @override
  SelectNoteProvider getProviderOverride(
    covariant SelectNoteProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'selectNoteProvider';
}

/// See also [selectNote].
class SelectNoteProvider extends AutoDisposeFutureProvider<Note?> {
  /// See also [selectNote].
  SelectNoteProvider(
    String? id,
  ) : this._internal(
          (ref) => selectNote(
            ref as SelectNoteRef,
            id,
          ),
          from: selectNoteProvider,
          name: r'selectNoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectNoteHash,
          dependencies: SelectNoteFamily._dependencies,
          allTransitiveDependencies:
              SelectNoteFamily._allTransitiveDependencies,
          id: id,
        );

  SelectNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  Override overrideWith(
    FutureOr<Note?> Function(SelectNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectNoteProvider._internal(
        (ref) => create(ref as SelectNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Note?> createElement() {
    return _SelectNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectNoteProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectNoteRef on AutoDisposeFutureProviderRef<Note?> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _SelectNoteProviderElement extends AutoDisposeFutureProviderElement<Note?>
    with SelectNoteRef {
  _SelectNoteProviderElement(super.provider);

  @override
  String? get id => (origin as SelectNoteProvider).id;
}

String _$createNoteHash() => r'd6606a447b2f7791939c9199075e873b92d7b369';

/// See also [createNote].
@ProviderFor(createNote)
const createNoteProvider = CreateNoteFamily();

/// See also [createNote].
class CreateNoteFamily extends Family<AsyncValue<String>> {
  /// See also [createNote].
  const CreateNoteFamily();

  /// See also [createNote].
  CreateNoteProvider call(
    Note note,
  ) {
    return CreateNoteProvider(
      note,
    );
  }

  @override
  CreateNoteProvider getProviderOverride(
    covariant CreateNoteProvider provider,
  ) {
    return call(
      provider.note,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createNoteProvider';
}

/// See also [createNote].
class CreateNoteProvider extends AutoDisposeFutureProvider<String> {
  /// See also [createNote].
  CreateNoteProvider(
    Note note,
  ) : this._internal(
          (ref) => createNote(
            ref as CreateNoteRef,
            note,
          ),
          from: createNoteProvider,
          name: r'createNoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createNoteHash,
          dependencies: CreateNoteFamily._dependencies,
          allTransitiveDependencies:
              CreateNoteFamily._allTransitiveDependencies,
          note: note,
        );

  CreateNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.note,
  }) : super.internal();

  final Note note;

  @override
  Override overrideWith(
    FutureOr<String> Function(CreateNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateNoteProvider._internal(
        (ref) => create(ref as CreateNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        note: note,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _CreateNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateNoteProvider && other.note == note;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, note.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateNoteRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `note` of this provider.
  Note get note;
}

class _CreateNoteProviderElement
    extends AutoDisposeFutureProviderElement<String> with CreateNoteRef {
  _CreateNoteProviderElement(super.provider);

  @override
  Note get note => (origin as CreateNoteProvider).note;
}

String _$updateNoteHash() => r'8c368ef8a98a8775ee2bd9ecb5959377fe0a53b3';

/// See also [updateNote].
@ProviderFor(updateNote)
const updateNoteProvider = UpdateNoteFamily();

/// See also [updateNote].
class UpdateNoteFamily extends Family<AsyncValue<String>> {
  /// See also [updateNote].
  const UpdateNoteFamily();

  /// See also [updateNote].
  UpdateNoteProvider call(
    Note note,
  ) {
    return UpdateNoteProvider(
      note,
    );
  }

  @override
  UpdateNoteProvider getProviderOverride(
    covariant UpdateNoteProvider provider,
  ) {
    return call(
      provider.note,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateNoteProvider';
}

/// See also [updateNote].
class UpdateNoteProvider extends AutoDisposeFutureProvider<String> {
  /// See also [updateNote].
  UpdateNoteProvider(
    Note note,
  ) : this._internal(
          (ref) => updateNote(
            ref as UpdateNoteRef,
            note,
          ),
          from: updateNoteProvider,
          name: r'updateNoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateNoteHash,
          dependencies: UpdateNoteFamily._dependencies,
          allTransitiveDependencies:
              UpdateNoteFamily._allTransitiveDependencies,
          note: note,
        );

  UpdateNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.note,
  }) : super.internal();

  final Note note;

  @override
  Override overrideWith(
    FutureOr<String> Function(UpdateNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateNoteProvider._internal(
        (ref) => create(ref as UpdateNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        note: note,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _UpdateNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateNoteProvider && other.note == note;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, note.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateNoteRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `note` of this provider.
  Note get note;
}

class _UpdateNoteProviderElement
    extends AutoDisposeFutureProviderElement<String> with UpdateNoteRef {
  _UpdateNoteProviderElement(super.provider);

  @override
  Note get note => (origin as UpdateNoteProvider).note;
}

String _$deleteNoteHash() => r'1740427e56bbc9673f51231e94a178f56f4fd1a3';

/// See also [deleteNote].
@ProviderFor(deleteNote)
const deleteNoteProvider = DeleteNoteFamily();

/// See also [deleteNote].
class DeleteNoteFamily extends Family<AsyncValue<String>> {
  /// See also [deleteNote].
  const DeleteNoteFamily();

  /// See also [deleteNote].
  DeleteNoteProvider call(
    String id,
  ) {
    return DeleteNoteProvider(
      id,
    );
  }

  @override
  DeleteNoteProvider getProviderOverride(
    covariant DeleteNoteProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteNoteProvider';
}

/// See also [deleteNote].
class DeleteNoteProvider extends AutoDisposeFutureProvider<String> {
  /// See also [deleteNote].
  DeleteNoteProvider(
    String id,
  ) : this._internal(
          (ref) => deleteNote(
            ref as DeleteNoteRef,
            id,
          ),
          from: deleteNoteProvider,
          name: r'deleteNoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteNoteHash,
          dependencies: DeleteNoteFamily._dependencies,
          allTransitiveDependencies:
              DeleteNoteFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<String> Function(DeleteNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteNoteProvider._internal(
        (ref) => create(ref as DeleteNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _DeleteNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteNoteProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteNoteRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DeleteNoteProviderElement
    extends AutoDisposeFutureProviderElement<String> with DeleteNoteRef {
  _DeleteNoteProviderElement(super.provider);

  @override
  String get id => (origin as DeleteNoteProvider).id;
}

String _$viewNoteHash() => r'7725d64d5e46112b8b64e43f4ea9ae0d8ae47b58';

/// See also [ViewNote].
@ProviderFor(ViewNote)
final viewNoteProvider =
    AutoDisposeNotifierProvider<ViewNote, String?>.internal(
  ViewNote.new,
  name: r'viewNoteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$viewNoteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ViewNote = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
