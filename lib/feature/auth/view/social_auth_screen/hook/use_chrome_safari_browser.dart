import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  final Future<void> Function() onClosedCallBack;
  MyChromeSafariBrowser({required this.onClosedCallBack});

  @override
  void onClosed() async => await onClosedCallBack();
}

ChromeSafariBrowser useChromeSafariBrowser({
  required Future<void> Function() onClosedCallBack,
}) {
  return use(_ChromeSafariBrowser(onClosedCallBack: onClosedCallBack));
}

class _ChromeSafariBrowser extends Hook<ChromeSafariBrowser> {
  final Future<void> Function() onClosedCallBack;
  const _ChromeSafariBrowser({required this.onClosedCallBack});

  @override
  ChromeSafariBrowserState createState() =>
      ChromeSafariBrowserState(onClosedCallBack: onClosedCallBack);
}

class ChromeSafariBrowserState
    extends HookState<ChromeSafariBrowser, _ChromeSafariBrowser> {
  final Future<void> Function() onClosedCallBack;
  late ChromeSafariBrowser chromeSafariBrowser;

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
