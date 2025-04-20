// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
  message: json['message'] as String?,
  accessToken: json['access_token'] as String?,
  tokenType: json['token_type'] as String?,
  statusCode: (json['status_code'] as num?)?.toInt(),
);

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
  'message': instance.message,
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
  'status_code': instance.statusCode,
};
