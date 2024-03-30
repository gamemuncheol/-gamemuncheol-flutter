import 'package:freezed_annotation/freezed_annotation.dart';

part 'apple_sign_in_request_body.g.dart';
part 'apple_sign_in_request_body.freezed.dart';

@Freezed(toJson: true)
class AppleSignInRequestBody with _$AppleSignInRequestBody {
  factory AppleSignInRequestBody({
    required String name,
    required String identityToken,
  }) = _AppleSignInRequestBody;

  factory AppleSignInRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AppleSignInRequestBodyFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      {"name": name, "identityToken": identityToken};
}
