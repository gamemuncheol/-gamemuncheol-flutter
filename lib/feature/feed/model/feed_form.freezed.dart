// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedForm _$FeedFormFromJson(Map<String, dynamic> json) {
  return _FeedForm.fromJson(json);
}

/// @nodoc
mixin _$FeedForm {
  String get videoUrl => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<int> get matchUserIds => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedFormCopyWith<FeedForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedFormCopyWith<$Res> {
  factory $FeedFormCopyWith(FeedForm value, $Res Function(FeedForm) then) =
      _$FeedFormCopyWithImpl<$Res, FeedForm>;
  @useResult
  $Res call(
      {String videoUrl,
      String thumbnailUrl,
      String title,
      String content,
      List<int> matchUserIds,
      List<String> tags});
}

/// @nodoc
class _$FeedFormCopyWithImpl<$Res, $Val extends FeedForm>
    implements $FeedFormCopyWith<$Res> {
  _$FeedFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? thumbnailUrl = null,
    Object? title = null,
    Object? content = null,
    Object? matchUserIds = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      matchUserIds: null == matchUserIds
          ? _value.matchUserIds
          : matchUserIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedFormImplCopyWith<$Res>
    implements $FeedFormCopyWith<$Res> {
  factory _$$FeedFormImplCopyWith(
          _$FeedFormImpl value, $Res Function(_$FeedFormImpl) then) =
      __$$FeedFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String videoUrl,
      String thumbnailUrl,
      String title,
      String content,
      List<int> matchUserIds,
      List<String> tags});
}

/// @nodoc
class __$$FeedFormImplCopyWithImpl<$Res>
    extends _$FeedFormCopyWithImpl<$Res, _$FeedFormImpl>
    implements _$$FeedFormImplCopyWith<$Res> {
  __$$FeedFormImplCopyWithImpl(
      _$FeedFormImpl _value, $Res Function(_$FeedFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? thumbnailUrl = null,
    Object? title = null,
    Object? content = null,
    Object? matchUserIds = null,
    Object? tags = null,
  }) {
    return _then(_$FeedFormImpl(
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      matchUserIds: null == matchUserIds
          ? _value._matchUserIds
          : matchUserIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedFormImpl implements _FeedForm {
  const _$FeedFormImpl(
      {required this.videoUrl,
      required this.thumbnailUrl,
      required this.title,
      required this.content,
      required final List<int> matchUserIds,
      required final List<String> tags})
      : _matchUserIds = matchUserIds,
        _tags = tags;

  factory _$FeedFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedFormImplFromJson(json);

  @override
  final String videoUrl;
  @override
  final String thumbnailUrl;
  @override
  final String title;
  @override
  final String content;
  final List<int> _matchUserIds;
  @override
  List<int> get matchUserIds {
    if (_matchUserIds is EqualUnmodifiableListView) return _matchUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchUserIds);
  }

  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'FeedForm(videoUrl: $videoUrl, thumbnailUrl: $thumbnailUrl, title: $title, content: $content, matchUserIds: $matchUserIds, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedFormImpl &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._matchUserIds, _matchUserIds) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoUrl,
      thumbnailUrl,
      title,
      content,
      const DeepCollectionEquality().hash(_matchUserIds),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedFormImplCopyWith<_$FeedFormImpl> get copyWith =>
      __$$FeedFormImplCopyWithImpl<_$FeedFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedFormImplToJson(
      this,
    );
  }
}

abstract class _FeedForm implements FeedForm {
  const factory _FeedForm(
      {required final String videoUrl,
      required final String thumbnailUrl,
      required final String title,
      required final String content,
      required final List<int> matchUserIds,
      required final List<String> tags}) = _$FeedFormImpl;

  factory _FeedForm.fromJson(Map<String, dynamic> json) =
      _$FeedFormImpl.fromJson;

  @override
  String get videoUrl;
  @override
  String get thumbnailUrl;
  @override
  String get title;
  @override
  String get content;
  @override
  List<int> get matchUserIds;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$FeedFormImplCopyWith<_$FeedFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
