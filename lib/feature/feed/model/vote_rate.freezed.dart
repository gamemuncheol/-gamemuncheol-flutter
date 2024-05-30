// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoteRate _$VoteRateFromJson(Map<String, dynamic> json) {
  return _VoteRate.fromJson(json);
}

/// @nodoc
mixin _$VoteRate {
  int get matchUserId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get championThumbnail => throw _privateConstructorUsedError;
  int get voteOptionsId => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoteRateCopyWith<VoteRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteRateCopyWith<$Res> {
  factory $VoteRateCopyWith(VoteRate value, $Res Function(VoteRate) then) =
      _$VoteRateCopyWithImpl<$Res, VoteRate>;
  @useResult
  $Res call(
      {int matchUserId,
      String nickname,
      String championThumbnail,
      int voteOptionsId,
      int rate});
}

/// @nodoc
class _$VoteRateCopyWithImpl<$Res, $Val extends VoteRate>
    implements $VoteRateCopyWith<$Res> {
  _$VoteRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchUserId = null,
    Object? nickname = null,
    Object? championThumbnail = null,
    Object? voteOptionsId = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      matchUserId: null == matchUserId
          ? _value.matchUserId
          : matchUserId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      championThumbnail: null == championThumbnail
          ? _value.championThumbnail
          : championThumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      voteOptionsId: null == voteOptionsId
          ? _value.voteOptionsId
          : voteOptionsId // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoteRateImplCopyWith<$Res>
    implements $VoteRateCopyWith<$Res> {
  factory _$$VoteRateImplCopyWith(
          _$VoteRateImpl value, $Res Function(_$VoteRateImpl) then) =
      __$$VoteRateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int matchUserId,
      String nickname,
      String championThumbnail,
      int voteOptionsId,
      int rate});
}

/// @nodoc
class __$$VoteRateImplCopyWithImpl<$Res>
    extends _$VoteRateCopyWithImpl<$Res, _$VoteRateImpl>
    implements _$$VoteRateImplCopyWith<$Res> {
  __$$VoteRateImplCopyWithImpl(
      _$VoteRateImpl _value, $Res Function(_$VoteRateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchUserId = null,
    Object? nickname = null,
    Object? championThumbnail = null,
    Object? voteOptionsId = null,
    Object? rate = null,
  }) {
    return _then(_$VoteRateImpl(
      matchUserId: null == matchUserId
          ? _value.matchUserId
          : matchUserId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      championThumbnail: null == championThumbnail
          ? _value.championThumbnail
          : championThumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      voteOptionsId: null == voteOptionsId
          ? _value.voteOptionsId
          : voteOptionsId // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoteRateImpl implements _VoteRate {
  const _$VoteRateImpl(
      {required this.matchUserId,
      required this.nickname,
      required this.championThumbnail,
      required this.voteOptionsId,
      required this.rate});

  factory _$VoteRateImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoteRateImplFromJson(json);

  @override
  final int matchUserId;
  @override
  final String nickname;
  @override
  final String championThumbnail;
  @override
  final int voteOptionsId;
  @override
  final int rate;

  @override
  String toString() {
    return 'VoteRate(matchUserId: $matchUserId, nickname: $nickname, championThumbnail: $championThumbnail, voteOptionsId: $voteOptionsId, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoteRateImpl &&
            (identical(other.matchUserId, matchUserId) ||
                other.matchUserId == matchUserId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.championThumbnail, championThumbnail) ||
                other.championThumbnail == championThumbnail) &&
            (identical(other.voteOptionsId, voteOptionsId) ||
                other.voteOptionsId == voteOptionsId) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, matchUserId, nickname,
      championThumbnail, voteOptionsId, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoteRateImplCopyWith<_$VoteRateImpl> get copyWith =>
      __$$VoteRateImplCopyWithImpl<_$VoteRateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoteRateImplToJson(
      this,
    );
  }
}

abstract class _VoteRate implements VoteRate {
  const factory _VoteRate(
      {required final int matchUserId,
      required final String nickname,
      required final String championThumbnail,
      required final int voteOptionsId,
      required final int rate}) = _$VoteRateImpl;

  factory _VoteRate.fromJson(Map<String, dynamic> json) =
      _$VoteRateImpl.fromJson;

  @override
  int get matchUserId;
  @override
  String get nickname;
  @override
  String get championThumbnail;
  @override
  int get voteOptionsId;
  @override
  int get rate;
  @override
  @JsonKey(ignore: true)
  _$$VoteRateImplCopyWith<_$VoteRateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
