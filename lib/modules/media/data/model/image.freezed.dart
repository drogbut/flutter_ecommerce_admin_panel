// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageModel {
  String get id;
  String get url;
  String get folder;
  String get filename;
  DateTime? get createAt;
  DateTime? get updateAt;
  int? get sizeBytes;
  String get mediaCategory;
  String? get fullPath;
  String? get contentType;
  @JsonKey(includeToJson: false, includeFromJson: false)
  dynamic get file;
  @JsonKey(includeToJson: false, includeFromJson: false)
  Uint8List? get localImageToDisplay;

  /// Create a copy of ImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageModelCopyWith<ImageModel> get copyWith =>
      _$ImageModelCopyWithImpl<ImageModel>(this as ImageModel, _$identity);

  /// Serializes this ImageModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageModel &&
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
            const DeepCollectionEquality().equals(other.file, file) &&
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
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(localImageToDisplay));

  @override
  String toString() {
    return 'ImageModel(id: $id, url: $url, folder: $folder, filename: $filename, createAt: $createAt, updateAt: $updateAt, sizeBytes: $sizeBytes, mediaCategory: $mediaCategory, fullPath: $fullPath, contentType: $contentType, file: $file, localImageToDisplay: $localImageToDisplay)';
  }
}

/// @nodoc
abstract mixin class $ImageModelCopyWith<$Res> {
  factory $ImageModelCopyWith(
          ImageModel value, $Res Function(ImageModel) _then) =
      _$ImageModelCopyWithImpl;
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
      @JsonKey(includeToJson: false, includeFromJson: false) dynamic file,
      @JsonKey(includeToJson: false, includeFromJson: false)
      Uint8List? localImageToDisplay});
}

/// @nodoc
class _$ImageModelCopyWithImpl<$Res> implements $ImageModelCopyWith<$Res> {
  _$ImageModelCopyWithImpl(this._self, this._then);

  final ImageModel _self;
  final $Res Function(ImageModel) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      folder: null == folder
          ? _self.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: freezed == createAt
          ? _self.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateAt: freezed == updateAt
          ? _self.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sizeBytes: freezed == sizeBytes
          ? _self.sizeBytes
          : sizeBytes // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaCategory: null == mediaCategory
          ? _self.mediaCategory
          : mediaCategory // ignore: cast_nullable_to_non_nullable
              as String,
      fullPath: freezed == fullPath
          ? _self.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _self.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as dynamic,
      localImageToDisplay: freezed == localImageToDisplay
          ? _self.localImageToDisplay
          : localImageToDisplay // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ImageModel extends ImageModel {
  const _ImageModel(
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
  factory _ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

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
  final dynamic file;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final Uint8List? localImageToDisplay;

  /// Create a copy of ImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImageModelCopyWith<_ImageModel> get copyWith =>
      __$ImageModelCopyWithImpl<_ImageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageModel &&
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
            const DeepCollectionEquality().equals(other.file, file) &&
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
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(localImageToDisplay));

  @override
  String toString() {
    return 'ImageModel(id: $id, url: $url, folder: $folder, filename: $filename, createAt: $createAt, updateAt: $updateAt, sizeBytes: $sizeBytes, mediaCategory: $mediaCategory, fullPath: $fullPath, contentType: $contentType, file: $file, localImageToDisplay: $localImageToDisplay)';
  }
}

/// @nodoc
abstract mixin class _$ImageModelCopyWith<$Res>
    implements $ImageModelCopyWith<$Res> {
  factory _$ImageModelCopyWith(
          _ImageModel value, $Res Function(_ImageModel) _then) =
      __$ImageModelCopyWithImpl;
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
      @JsonKey(includeToJson: false, includeFromJson: false) dynamic file,
      @JsonKey(includeToJson: false, includeFromJson: false)
      Uint8List? localImageToDisplay});
}

/// @nodoc
class __$ImageModelCopyWithImpl<$Res> implements _$ImageModelCopyWith<$Res> {
  __$ImageModelCopyWithImpl(this._self, this._then);

  final _ImageModel _self;
  final $Res Function(_ImageModel) _then;

  /// Create a copy of ImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_ImageModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      folder: null == folder
          ? _self.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: freezed == createAt
          ? _self.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateAt: freezed == updateAt
          ? _self.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sizeBytes: freezed == sizeBytes
          ? _self.sizeBytes
          : sizeBytes // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaCategory: null == mediaCategory
          ? _self.mediaCategory
          : mediaCategory // ignore: cast_nullable_to_non_nullable
              as String,
      fullPath: freezed == fullPath
          ? _self.fullPath
          : fullPath // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _self.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as dynamic,
      localImageToDisplay: freezed == localImageToDisplay
          ? _self.localImageToDisplay
          : localImageToDisplay // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

// dart format on
