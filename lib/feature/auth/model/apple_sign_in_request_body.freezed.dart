// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apple_sign_in_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppleSignInRequestBody _$AppleSignInRequestBodyFromJson(
    Map<String, dynamic> json) {
  return _AppleSignInRequestBody.fromJson(json);
}

/// @nodoc
mixin _$AppleSignInRequestBody {
  String get name => throw _privateConstructorUsedError;
  String get identityToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppleSignInRequestBodyCopyWith<AppleSignInRequestBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleSignInRequestBodyCopyWith<$Res> {
  factory $AppleSignInRequestBodyCopyWith(AppleSignInRequestBody value,
          $Res Function(AppleSignInRequestBody) then) =
      _$AppleSignInRequestBodyCopyWithImpl<$Res, AppleSignInRequestBody>;
  @useResult
  $Res call({String name, String identityToken});
}

/// @nodoc
class _$AppleSignInRequestBodyCopyWithImpl<$Res,
        $Val extends AppleSignInRequestBody>
    implements $AppleSignInRequestBodyCopyWith<$Res> {
  _$AppleSignInRequestBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? identityToken = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      identityToken: null == identityToken
          ? _value.identityToken
          : identityToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppleSignInRequestBodyImplCopyWith<$Res>
    implements $AppleSignInRequestBodyCopyWith<$Res> {
  factory _$$AppleSignInRequestBodyImplCopyWith(
          _$AppleSignInRequestBodyImpl value,
          $Res Function(_$AppleSignInRequestBodyImpl) then) =
      __$$AppleSignInRequestBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String identityToken});
}

/// @nodoc
class __$$AppleSignInRequestBodyImplCopyWithImpl<$Res>
    extends _$AppleSignInRequestBodyCopyWithImpl<$Res,
        _$AppleSignInRequestBodyImpl>
    implements _$$AppleSignInRequestBodyImplCopyWith<$Res> {
  __$$AppleSignInRequestBodyImplCopyWithImpl(
      _$AppleSignInRequestBodyImpl _value,
      $Res Function(_$AppleSignInRequestBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? identityToken = null,
  }) {
    return _then(_$AppleSignInRequestBodyImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      identityToken: null == identityToken
          ? _value.identityToken
          : identityToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppleSignInRequestBodyImpl implements _AppleSignInRequestBody {
  _$AppleSignInRequestBodyImpl(
      {required this.name, required this.identityToken});

  factory _$AppleSignInRequestBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppleSignInRequestBodyImplFromJson(json);

  @override
  final String name;
  @override
  final String identityToken;

  @override
  String toString() {
    return 'AppleSignInRequestBody(name: $name, identityToken: $identityToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleSignInRequestBodyImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.identityToken, identityToken) ||
                other.identityToken == identityToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, identityToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleSignInRequestBodyImplCopyWith<_$AppleSignInRequestBodyImpl>
      get copyWith => __$$AppleSignInRequestBodyImplCopyWithImpl<
          _$AppleSignInRequestBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppleSignInRequestBodyImplToJson(
      this,
    );
  }
}

abstract class _AppleSignInRequestBody implements AppleSignInRequestBody {
  factory _AppleSignInRequestBody(
      {required final String name,
      required final String identityToken}) = _$AppleSignInRequestBodyImpl;

  factory _AppleSignInRequestBody.fromJson(Map<String, dynamic> json) =
      _$AppleSignInRequestBodyImpl.fromJson;

  @override
  String get name;
  @override
  String get identityToken;
  @override
  @JsonKey(ignore: true)
  _$$AppleSignInRequestBodyImplCopyWith<_$AppleSignInRequestBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
