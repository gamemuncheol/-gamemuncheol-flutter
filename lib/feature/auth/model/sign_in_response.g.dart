// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      success: json['success'] as bool,
      status:
          SignInResponseStatus.fromJson(json['status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : SignInResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };

SignInResponseStatus _$SignInResponseStatusFromJson(
        Map<String, dynamic> json) =>
    SignInResponseStatus(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$SignInResponseStatusToJson(
        SignInResponseStatus instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

SignInResponseData _$SignInResponseDataFromJson(Map<String, dynamic> json) =>
    SignInResponseData(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$SignInResponseDataToJson(SignInResponseData instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
