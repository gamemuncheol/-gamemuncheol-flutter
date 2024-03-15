// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchUser _$MatchUserFromJson(Map<String, dynamic> json) {
  return _MatchUser.fromJson(json);
}

/// @nodoc
mixin _$MatchUser {
  String get puuid => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get championThumbnail => throw _privateConstructorUsedError;
  bool get win => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchUserCopyWith<MatchUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchUserCopyWith<$Res> {
  factory $MatchUserCopyWith(MatchUser value, $Res Function(MatchUser) then) =
      _$MatchUserCopyWithImpl<$Res, MatchUser>;
  @useResult
  $Res call(
      {String puuid, String nickname, String championThumbnail, bool win});
}

/// @nodoc
class _$MatchUserCopyWithImpl<$Res, $Val extends MatchUser>
    implements $MatchUserCopyWith<$Res> {
  _$MatchUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puuid = null,
    Object? nickname = null,
    Object? championThumbnail = null,
    Object? win = null,
  }) {
    return _then(_value.copyWith(
      puuid: null == puuid
          ? _value.puuid
          : puuid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      championThumbnail: null == championThumbnail
          ? _value.championThumbnail
          : championThumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      win: null == win
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchUserImplCopyWith<$Res>
    implements $MatchUserCopyWith<$Res> {
  factory _$$MatchUserImplCopyWith(
          _$MatchUserImpl value, $Res Function(_$MatchUserImpl) then) =
      __$$MatchUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String puuid, String nickname, String championThumbnail, bool win});
}

/// @nodoc
class __$$MatchUserImplCopyWithImpl<$Res>
    extends _$MatchUserCopyWithImpl<$Res, _$MatchUserImpl>
    implements _$$MatchUserImplCopyWith<$Res> {
  __$$MatchUserImplCopyWithImpl(
      _$MatchUserImpl _value, $Res Function(_$MatchUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puuid = null,
    Object? nickname = null,
    Object? championThumbnail = null,
    Object? win = null,
  }) {
    return _then(_$MatchUserImpl(
      puuid: null == puuid
          ? _value.puuid
          : puuid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      championThumbnail: null == championThumbnail
          ? _value.championThumbnail
          : championThumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      win: null == win
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchUserImpl implements _MatchUser {
  const _$MatchUserImpl(
      {required this.puuid,
      required this.nickname,
      required this.championThumbnail,
      required this.win});

  factory _$MatchUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchUserImplFromJson(json);

  @override
  final String puuid;
  @override
  final String nickname;
  @override
  final String championThumbnail;
  @override
  final bool win;

  @override
  String toString() {
    return 'MatchUser(puuid: $puuid, nickname: $nickname, championThumbnail: $championThumbnail, win: $win)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchUserImpl &&
            (identical(other.puuid, puuid) || other.puuid == puuid) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.championThumbnail, championThumbnail) ||
                other.championThumbnail == championThumbnail) &&
            (identical(other.win, win) || other.win == win));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, puuid, nickname, championThumbnail, win);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchUserImplCopyWith<_$MatchUserImpl> get copyWith =>
      __$$MatchUserImplCopyWithImpl<_$MatchUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchUserImplToJson(
      this,
    );
  }
}

abstract class _MatchUser implements MatchUser {
  const factory _MatchUser(
      {required final String puuid,
      required final String nickname,
      required final String championThumbnail,
      required final bool win}) = _$MatchUserImpl;

  factory _MatchUser.fromJson(Map<String, dynamic> json) =
      _$MatchUserImpl.fromJson;

  @override
  String get puuid;
  @override
  String get nickname;
  @override
  String get championThumbnail;
  @override
  bool get win;
  @override
  @JsonKey(ignore: true)
  _$$MatchUserImplCopyWith<_$MatchUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
