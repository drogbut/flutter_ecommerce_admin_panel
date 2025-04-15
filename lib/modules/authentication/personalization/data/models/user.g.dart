// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      createAt: DateTime.parse(json['createAt'] as String),
      userName: json['userName'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      profilePicture: json['profilePicture'] as String? ?? '',
      role:
          $enumDecodeNullable(_$AppRoleEnumMap, json['role']) ?? AppRole.admin,
      updateAt: DateTime.parse(json['updateAt'] as String),
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'createAt': instance.createAt.toIso8601String(),
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'profilePicture': instance.profilePicture,
      'role': _$AppRoleEnumMap[instance.role]!,
      'updateAt': instance.updateAt.toIso8601String(),
    };

const _$AppRoleEnumMap = {
  AppRole.admin: 'admin',
  AppRole.user: 'user',
};
