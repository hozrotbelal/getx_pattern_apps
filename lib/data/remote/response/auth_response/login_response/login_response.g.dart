// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse()
      ..result = json['result'] as bool?
      ..message = json['message'] as String?
      ..access_token = json['access_token'] as String?
      ..token_type = json['token_type'] as String?
      ..expires_at = json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String);

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'expires_at': instance.expires_at?.toIso8601String(),
    };
