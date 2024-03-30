// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String?,
      nickname: json['nickname'] as String?,
      email: json['email'] as String?,
      picture: json['picture'] as String?,
      privacyAgreed: json['privacyAgreed'] as bool?,
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nickname': instance.nickname,
      'email': instance.email,
      'picture': instance.picture,
      'privacyAgreed': instance.privacyAgreed,
      'score': instance.score,
    };
