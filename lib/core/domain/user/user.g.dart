// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      type: json['type'] as String?,
      info: json['info'] as String?,
      emailVerifiedAt: json['emailVerifiedAt'] as String?,
      emailVerificationSentAt: json['emailVerificationSentAt'] as String?,
      currentTeamId: json['currentTeamId'] as String?,
      profilePhotoPath: json['profilePhotoPath'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      wallet: json['wallet'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'mobile': instance.mobile,
      'email': instance.email,
      'type': instance.type,
      'info': instance.info,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'emailVerificationSentAt': instance.emailVerificationSentAt,
      'currentTeamId': instance.currentTeamId,
      'profilePhotoPath': instance.profilePhotoPath,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'wallet': instance.wallet,
    };
