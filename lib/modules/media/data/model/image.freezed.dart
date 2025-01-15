// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return _ImageModel.fromJson(json);
}

/// @nodoc
mixin _$ImageModel {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get folder => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  DateTime? get createAt => throw _privateConstructorUsedError;
  DateTime? get updateAt => throw _privateConstructorUsedError;
  int? get sizeBytes => throw _privateConstructorUsedError;
  String get mediaCategory => throw _privateConstructorUsedError;
  String? get fullPath => throw _privateConstructorUsedError;
  String? get contentType => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  File? get file => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  Uint8List? get localImageToDisplay => throw _privateConstructorUsedError;

  /// Serializes this ImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageModelCopyWith<ImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageModelCopyWith<$Res> {
  factory $ImageModelCopyWith(
          ImageModel value, $Res Function(ImageModel) then) =
      _$ImageModelCopyWithImpl<$Res, ImageModel>;
  @useResult
  $Res call(
      {String id,
      String url,
      String folder,
      String filename,
      DateTime? createAt,
      DateTime? updateAt,
      int? sizeBytes,
      String mediaCategory,
      String? fullPath,
      String? contentType,
      @JsonKey(includeToJson: false, includeFromJson: false) File? file,
      @JsonKey(includeToJson: false, includeFromJson: false)
      Uint8List? localImageToDisplay});
}

/// @nodoc
class _$ImageModelCopyWithImpl<$Res, $Val extends ImageModel>
    implements $ImageModelCopyWith<$Res> {
  _$ImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? folder = null,
    Object? filename = null,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? sizeBytes = freezed,
    Object? mediaCategory = null,
    Object? fullPath = freezed,
    Object? contentType = freezed,
    Object? file = freezed,
    Object? localImageToDisplay = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      folder: null == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sizeBytes: freezed == sizeBytes
          ? _value.sizeBytes
          : sizeBytes // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaCategory: null == mediaCategory
          ? _value.mediaCategory
          : mediaCategory // ignore: cast_nullable_to_non_nullable
              as String,
      fullPath: freezed == fullPath
          ? _value.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      localImageToDisplay: freezed == localImageToDisplay
          ? _value.localImageToDisplay
          : localImageToDisplay // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageModelImplCopyWith<$Res>
    implements $ImageModelCopyWith<$Res> {
  factory _$$ImageModelImplCopyWith(
          _$ImageModelImpl value, $Res Function(_$ImageModelImpl) then) =
      __$$ImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String url,
      String folder,
      String filename,
      DateTime? createAt,
      DateTime? updateAt,
      int? sizeBytes,
      String mediaCategory,
      String? fullPath,
      String? contentType,
      @JsonKey(includeToJson: false, includeFromJson: false) File? file,
      @JsonKey(includeToJson: false, includeFromJson: false)
      Uint8List? localImageToDisplay});
}

/// @nodoc
class __$$ImageModelImplCopyWithImpl<$Res>
    extends _$ImageModelCopyWithImpl<$Res, _$ImageModelImpl>
    implements _$$ImageModelImplCopyWith<$Res> {
  __$$ImageModelImplCopyWithImpl(
      _$ImageModelImpl _value, $Res Function(_$ImageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? folder = null,
    Object? filename = null,
    Object? createAt = freezed,
    Object? updateAt = freezed,
    Object? sizeBytes = freezed,
    Object? mediaCategory = null,
    Object? fullPath = freezed,
    Object? contentType = freezed,
    Object? file = freezed,
    Object? localImageToDisplay = freezed,
  }) {
    return _then(_$ImageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      folder: null == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sizeBytes: freezed == sizeBytes
          ? _value.sizeBytes
          : sizeBytes // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaCategory: null == mediaCategory
          ? _value.mediaCategory
          : mediaCategory // ignore: cast_nullable_to_non_nullable
              as String,
      fullPath: freezed == fullPath
          ? _value.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      localImageToDisplay: freezed == localImageToDisplay
          ? _value.localImageToDisplay
          : localImageToDisplay // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageModelImpl extends _ImageModel {
  const _$ImageModelImpl(
      {this.id = '',
      required this.url,
      required this.folder,
      required this.filename,
      this.createAt,
      this.updateAt,
      this.sizeBytes,
      this.mediaCategory = '',
      this.fullPath,
      this.contentType,
      @JsonKey(includeToJson: false, includeFromJson: false) this.file,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.localImageToDisplay})
      : super._();

  factory _$ImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String url;
  @override
  final String folder;
  @override
  final String filename;
  @override
  final DateTime? createAt;
  @override
  final DateTime? updateAt;
  @override
  final int? sizeBytes;
  @override
  @JsonKey()
  final String mediaCategory;
  @override
  final String? fullPath;
  @override
  final String? contentType;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final File? file;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final Uint8List? localImageToDisplay;

  @override
  String toString() {
    return 'ImageModel(id: $id, url: $url, folder: $folder, filename: $filename, createAt: $createAt, updateAt: $updateAt, sizeBytes: $sizeBytes, mediaCategory: $mediaCategory, fullPath: $fullPath, contentType: $contentType, file: $file, localImageToDisplay: $localImageToDisplay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.folder, folder) || other.folder == folder) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes) &&
            (identical(other.mediaCategory, mediaCategory) ||
                other.mediaCategory == mediaCategory) &&
            (identical(other.fullPath, fullPath) ||
                other.fullPath == fullPath) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.file, file) || other.file == file) &&
            const DeepCollectionEquality()
                .equals(other.localImageToDisplay, localImageToDisplay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      url,
      folder,
      filename,
      createAt,
      updateAt,
      sizeBytes,
      mediaCategory,
      fullPath,
      contentType,
      file,
      const DeepCollectionEquality().hash(localImageToDisplay));

  /// Create a copy of ImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageModelImplCopyWith<_$ImageModelImpl> get copyWith =>
      __$$ImageModelImplCopyWithImpl<_$ImageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageModelImplToJson(
      this,
    );
  }
}

abstract class _ImageModel extends ImageModel {
  const factory _ImageModel(
      {final String id,
      required final String url,
      required final String folder,
      required final String filename,
      final DateTime? createAt,
      final DateTime? updateAt,
      final int? sizeBytes,
      final String mediaCategory,
      final String? fullPath,
      final String? contentType,
      @JsonKey(includeToJson: false, includeFromJson: false) final File? file,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final Uint8List? localImageToDisplay}) = _$ImageModelImpl;
  const _ImageModel._() : super._();

  factory _ImageModel.fromJson(Map<String, dynamic> json) =
      _$ImageModelImpl.fromJson;

  @override
  String get id;
  @override
  String get url;
  @override
  String get folder;
  @override
  String get filename;
  @override
  DateTime? get createAt;
  @override
  DateTime? get updateAt;
  @override
  int? get sizeBytes;
  @override
  String get mediaCategory;
  @override
  String? get fullPath;
  @override
  String? get contentType;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  File? get file;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  Uint8List? get localImageToDisplay;

  /// Create a copy of ImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageModelImplCopyWith<_$ImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
