// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => _ImageModel(
      id: json['id'] as String? ?? '',
      url: json['url'] as String,
      folder: json['folder'] as String,
      filename: json['filename'] as String,
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      sizeBytes: (json['sizeBytes'] as num?)?.toInt(),
      mediaCategory: json['mediaCategory'] as String? ?? '',
      fullPath: json['fullPath'] as String?,
      contentType: json['contentType'] as String?,
    );

Map<String, dynamic> _$ImageModelToJson(_ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'folder': instance.folder,
      'filename': instance.filename,
      'createAt': instance.createAt?.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
      'sizeBytes': instance.sizeBytes,
      'mediaCategory': instance.mediaCategory,
      'fullPath': instance.fullPath,
      'contentType': instance.contentType,
    };
