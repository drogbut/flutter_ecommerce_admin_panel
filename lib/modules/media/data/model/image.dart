import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';

import '../../../../../utils/formatters/formatter.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const ImageModel._();

  const factory ImageModel({
    @Default('') String id,
    required String url,
    required String folder,
    required String filename,
    DateTime? createAt,
    DateTime? updateAt,
    int? sizeBytes,
    @Default('') String mediaCategory,
    String? fullPath,
    String? contentType,
    @JsonKey(includeToJson: false, includeFromJson: false) File? file,
    @JsonKey(includeToJson: false, includeFromJson: false) Uint8List? localImageToDisplay,
  }) = _ImageModel;

  /// Not mapped data
  @JsonKey(includeToJson: false, includeFromJson: false)
  RxBool get isSelected => false.obs;

  DateTime get defaultCreateAt => createAt ?? DateTime.now();
  DateTime get defaultUpdateAt => updateAt ?? DateTime.now();

  /// Helper function to format the created date
  String get formatCreatedAt => TFormatter.formatDate(createAt);

  /// Helper function to format the created date
  String get formatUpdatedAt => TFormatter.formatDate(updateAt);

  /// Static function to create an empty user
  factory ImageModel.empty() => ImageModel(
        id: '',
        url: '',
        folder: '',
        filename: '',
        createAt: DateTime.now(),
        updateAt: DateTime.now(),
        sizeBytes: 0,
        mediaCategory: '',
        fullPath: null,
        contentType: null,
        file: null,
        localImageToDisplay: null,
      );

  factory ImageModel.fromJson(Map<String, Object?> json) => _$ImageModelFromJson(json);

  /// factory method to create a user model base on Firebase document snapshot.
  factory ImageModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data != null) {
      try {
        return ImageModel(
          id: document.id,
          url: data['url'] ?? '',
          folder: data['folder'] ?? '',
          sizeBytes: data['sizeBytes'] ?? 0,
          filename: data['filename'] ?? '',
          mediaCategory: data['mediaCategory'] ?? '',
          fullPath: data['fullPath'] ?? '',
          contentType: data['contentType'] ?? '',
          createAt: _parseTimestamp(data['createAt']),
          updateAt: _parseTimestamp(data['updateAt']),
          file: null,
          localImageToDisplay: null,
        );
      } catch (e) {
        return ImageModel.empty();
      }
    } else {
      return ImageModel.empty();
    }
  }

  /// Map firebase storage data.
  factory ImageModel.fromFirebaseMetadata(FullMetadata metadata, String folder, String filename, String downloadUrl) {
    return ImageModel(
      id: '',
      url: downloadUrl,
      folder: folder,
      sizeBytes: metadata.size,
      filename: filename,
      mediaCategory: '',
      fullPath: metadata.fullPath,
      contentType: metadata.contentType,
      createAt: metadata.timeCreated,
      updateAt: metadata.updated,
      file: null,
      localImageToDisplay: null,
    );
  }

  /// Function for parsing a Timestamp field
  static DateTime _parseTimestamp(dynamic timestamp) {
    if (timestamp is Timestamp) {
      return timestamp.toDate();
    } else if (timestamp is String) {
      // If it's a string, try parsing it like ISO 8601
      return DateTime.tryParse(timestamp) ?? DateTime.fromMillisecondsSinceEpoch(0);
    } else {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
  }
}
