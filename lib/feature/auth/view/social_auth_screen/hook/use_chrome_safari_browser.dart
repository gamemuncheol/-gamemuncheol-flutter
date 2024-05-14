import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  final void Function() onClosedCallBack;
  MyChromeSafariBrowser({required this.onClosedCallBack});

  @override
  void onClosed() async => onClosedCallBack();
}

ChromeSafariBrowser useChromeSafariBrowser({
  required void Function() onClosed,
}) {
  return use(_ChromeSafariBrowser(onClosed: onClosed));
}

class _ChromeSafariBrowser extends Hook<ChromeSafariBrowser> {
  final void Function() onClosed;
  const _ChromeSafariBrowser({required this.onClosed});

  @override
  ChromeSafariBrowserState createState() =>
      ChromeSafariBrowserState(onClosedCallBack: onClosed);
}

class ChromeSafariBrowserState
    extends HookState<ChromeSafariBrowser, _ChromeSafariBrowser> {
  final void Function() onClosedCallBack;
  late final ChromeSafariBrowser chromeSafariBrowser;

  ChromeSafariBrowserState({required this.onClosedCallBack});

  @override
  void initHook() {
    super.initHook();
    chromeSafariBrowser =
        MyChromeSafariBrowser(onClosedCallBack: onClosedCallBack);
  }

  @override
  ChromeSafariBrowser build(BuildContext context) {
    return chromeSafariBrowser;
  }
}
