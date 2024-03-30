// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_sign_in_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppleSignInRequestBodyImpl _$$AppleSignInRequestBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$AppleSignInRequestBodyImpl(
      name: json['name'] as String,
      identityToken: json['identityToken'] as String,
    );

Map<String, dynamic> _$$AppleSignInRequestBodyImplToJson(
        _$AppleSignInRequestBodyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'identityToken': instance.identityToken,
    };
