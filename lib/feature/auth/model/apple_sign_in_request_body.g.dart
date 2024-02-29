// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_sign_in_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppleSignInRequestBody _$AppleSignInRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AppleSignInRequestBody(
      name: json['name'] as String,
      identityToken: json['identityToken'] as String,
    );

Map<String, dynamic> _$AppleSignInRequestBodyToJson(
        AppleSignInRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'identityToken': instance.identityToken,
    };
