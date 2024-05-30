// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return _Feed.fromJson(json);
}

/// @nodoc
mixin _$Feed {
  int get id => throw _privateConstructorUsedError;
  Member get member => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  List<VoteRate> get voteRates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedCopyWith<Feed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCopyWith<$Res> {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) then) =
      _$FeedCopyWithImpl<$Res, Feed>;
  @useResult
  $Res call(
      {int id,
      Member member,
      String videoUrl,
      String thumbnailUrl,
      String title,
      String createdAt,
      String updatedAt,
      int viewCount,
      List<VoteRate> voteRates});

  $MemberCopyWith<$Res> get member;
}

/// @nodoc
class _$FeedCopyWithImpl<$Res, $Val extends Feed>
    implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? member = null,
    Object? videoUrl = null,
    Object? thumbnailUrl = null,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? viewCount = null,
    Object? voteRates = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      voteRates: null == voteRates
          ? _value.voteRates
          : voteRates // ignore: cast_nullable_to_non_nullable
              as List<VoteRate>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberCopyWith<$Res> get member {
    return $MemberCopyWith<$Res>(_value.member, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedImplCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$$FeedImplCopyWith(
          _$FeedImpl value, $Res Function(_$FeedImpl) then) =
      __$$FeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Member member,
      String videoUrl,
      String thumbnailUrl,
      String title,
      String createdAt,
      String updatedAt,
      int viewCount,
      List<VoteRate> voteRates});

  @override
  $MemberCopyWith<$Res> get member;
}

/// @nodoc
class __$$FeedImplCopyWithImpl<$Res>
    extends _$FeedCopyWithImpl<$Res, _$FeedImpl>
    implements _$$FeedImplCopyWith<$Res> {
  __$$FeedImplCopyWithImpl(_$FeedImpl _value, $Res Function(_$FeedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? member = null,
    Object? videoUrl = null,
    Object? thumbnailUrl = null,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? viewCount = null,
    Object? voteRates = null,
  }) {
    return _then(_$FeedImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      voteRates: null == voteRates
          ? _value._voteRates
          : voteRates // ignore: cast_nullable_to_non_nullable
              as List<VoteRate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedImpl implements _Feed {
  const _$FeedImpl(
      {required this.id,
      required this.member,
      required this.videoUrl,
      required this.thumbnailUrl,
      required this.title,
      required this.createdAt,
      required this.updatedAt,
      required this.viewCount,
      required final List<VoteRate> voteRates})
      : _voteRates = voteRates;

  factory _$FeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedImplFromJson(json);

  @override
  final int id;
  @override
  final Member member;
  @override
  final String videoUrl;
  @override
  final String thumbnailUrl;
  @override
  final String title;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int viewCount;
  final List<VoteRate> _voteRates;
  @override
  List<VoteRate> get voteRates {
    if (_voteRates is EqualUnmodifiableListView) return _voteRates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voteRates);
  }

  @override
  String toString() {
    return 'Feed(id: $id, member: $member, videoUrl: $videoUrl, thumbnailUrl: $thumbnailUrl, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, viewCount: $viewCount, voteRates: $voteRates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            const DeepCollectionEquality()
                .equals(other._voteRates, _voteRates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      member,
      videoUrl,
      thumbnailUrl,
      title,
      createdAt,
      updatedAt,
      viewCount,
      const DeepCollectionEquality().hash(_voteRates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      __$$FeedImplCopyWithImpl<_$FeedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedImplToJson(
      this,
    );
  }
}

abstract class _Feed implements Feed {
  const factory _Feed(
      {required final int id,
      required final Member member,
      required final String videoUrl,
      required final String thumbnailUrl,
      required final String title,
      required final String createdAt,
      required final String updatedAt,
      required final int viewCount,
      required final List<VoteRate> voteRates}) = _$FeedImpl;

  factory _Feed.fromJson(Map<String, dynamic> json) = _$FeedImpl.fromJson;

  @override
  int get id;
  @override
  Member get member;
  @override
  String get videoUrl;
  @override
  String get thumbnailUrl;
  @override
  String get title;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  int get viewCount;
  @override
  List<VoteRate> get voteRates;
  @override
  @JsonKey(ignore: true)
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
