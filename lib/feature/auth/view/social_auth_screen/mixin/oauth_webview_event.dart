import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/oauth_webview_screen.dart';
import 'package:uni_links/uni_links.dart';

mixin OauthWebviewEvent on State<OauthWebviewScreen> {
  void startOauth() {
    widget.chromeSafariBrowser.open(
      url: WebUri(
        Data.OAUTH_WAS_URL,
      ),
    );
  }

  String? getToken({
    required String link,
  }) {
    final Uri uri = Uri.parse(
      link,
    );
    const String queryParameters = "data";
    final String? token = uri.queryParameters[queryParameters];

    return token;
  }

  void initUniLinks(WidgetRef ref) {
    linkStream.listen((link) async {
      if (link != null) {
        String? token = getToken(
          link: link,
        );

        await widget.chromeSafariBrowser.close();

        if (token != null) {
          if (widget.signInMethod == SignInMethod.GOOGLE) {
            await signInWithGoogle(
              ref,
              token: token,
            );
          }
        }
      }
    });
  }

  Future<void> signInWithGoogle(
    WidgetRef ref, {
    required String token,
  }) async {
    await ref
        .read(
          authNotifierProvider.notifier,
        )
        .signInWithGoogle(
          token: token,
        );
  }
}
