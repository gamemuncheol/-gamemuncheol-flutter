// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoteRateImpl _$$VoteRateImplFromJson(Map<String, dynamic> json) =>
    _$VoteRateImpl(
      matchUserId: json['matchUserId'] as int,
      nickname: json['nickname'] as String,
      championThumbnail: json['championThumbnail'] as String,
      voteOptionsId: json['voteOptionsId'] as int,
      rate: json['rate'] as int,
    );

Map<String, dynamic> _$$VoteRateImplToJson(_$VoteRateImpl instance) =>
    <String, dynamic>{
      'matchUserId': instance.matchUserId,
      'nickname': instance.nickname,
      'championThumbnail': instance.championThumbnail,
      'voteOptionsId': instance.voteOptionsId,
      'rate': instance.rate,
    };
