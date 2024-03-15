// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchUserImpl _$$MatchUserImplFromJson(Map<String, dynamic> json) =>
    _$MatchUserImpl(
      puuid: json['puuid'] as String,
      nickname: json['nickname'] as String,
      championThumbnail: json['championThumbnail'] as String,
      win: json['win'] as bool,
    );

Map<String, dynamic> _$$MatchUserImplToJson(_$MatchUserImpl instance) =>
    <String, dynamic>{
      'puuid': instance.puuid,
      'nickname': instance.nickname,
      'championThumbnail': instance.championThumbnail,
      'win': instance.win,
    };
