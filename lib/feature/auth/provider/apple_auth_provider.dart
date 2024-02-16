import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'apple_auth_provider.g.dart';

@riverpod
class AppleAuthNotifier extends _$AppleAuthNotifier {
  @override
  dynamic build() => null;

  Future<String> signIn() async {
    try {
      final AuthorizationCredentialAppleID credential =
          await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);
      debugPrint(credential.email ?? "Email is null");
      debugPrint(credential.identityToken ?? "Identity token is null");
      Dio dio = Dio();
      String url = 'http://192.168.0.4:8080/open-api/apple/sign-up';

      // Name이 null일 경우 회원가입이 안되도록 처리해야 함
      String fullName = credential.givenName! + credential.familyName!;

      var data = {
        'name': fullName,
        'identityToken': credential.identityToken
        };
      var response = await dio.post(url, data: data);

      debugPrint(response.toString());
      dio.close();
      return response.toString();
    } catch (ex) {
      debugPrint(ex.toString());
      return "Error occurred while signing in with Apple. Please try again. $ex";
    }
  }
}
