// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedFormImpl _$$FeedFormImplFromJson(Map<String, dynamic> json) =>
    _$FeedFormImpl(
      videoUrl: json['videoUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      matchUserIds:
          (json['matchUserIds'] as List<dynamic>).map((e) => e as int).toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$FeedFormImplToJson(_$FeedFormImpl instance) =>
    <String, dynamic>{
      'videoUrl': instance.videoUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'title': instance.title,
      'content': instance.content,
      'matchUserIds': instance.matchUserIds,
      'tags': instance.tags,
    };
