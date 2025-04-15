import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/formatters/formatter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required DateTime createAt,
    @Default('') String userName,
    @Default('') String phoneNumber,
    @Default('') String profilePicture,
    @Default(AppRole.admin) AppRole role,
    required DateTime updateAt,
  }) = _UserModel;

  /// Helper function to get the user full name
  String get fullName => '$firstName $lastName';

  /// Static function to split the full name under first and last name
  static List<String> namePart(String fullName) => fullName.split(' ');

  /// Helper function to format the phone number
  String get formatPhone => TFormatter.formatPhoneNumber(phoneNumber);

  /// Helper function to format the created date
  String get formatCreatedDate => TFormatter.formatDate(createAt);

  /// Helper function to format the created date
  String get formatUpdatedDate => TFormatter.formatDate(updateAt);

  /// Static function to create an empty user
  factory UserModel.empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        role: AppRole.user,
        createAt: DateTime.fromMillisecondsSinceEpoch(0),
        updateAt: DateTime.fromMillisecondsSinceEpoch(0),
      );

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);

  /// factory method to create a user model base on Firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data != null) {
      try {
        return UserModel(
          id: document.id,
          firstName: data['firstName'] ?? '',
          lastName: data['lastName'] ?? '',
          userName: data['userName'] ?? '',
          email: data['email'] ?? '',
          phoneNumber: data['phoneNumber'] ?? '',
          profilePicture: data['profilePicture'] ?? '',
          role: data.containsKey('role')
              ? AppRole.values.firstWhere(
                  (e) => e.toString() == 'AppRole.${data['role']}',
                  orElse: () => AppRole.user,
                )
              : AppRole.user,
          createAt: _parseTimestamp(data['createAt']),
          updateAt: _parseTimestamp(data['updateAt']),
        );
      } catch (e) {
        return UserModel.empty();
      }
    } else {
      return UserModel.empty();
    }
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
