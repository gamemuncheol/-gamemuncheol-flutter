// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/common/presentation/widget/loading_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/presentation/view/base_screen.dart';
import 'package:gamemuncheol/common/presentation/view/splash/splash_screen_scaffold.dart';
import 'package:gamemuncheol/common/presentation/view/splash/event/splash_screen_event.dart';

import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';

class SplashScreen extends BaseScreen with SplashScreenEvent {
  SplashScreen({super.key});

  static const PATH = "/";
  static const ROUTE_NAME = "SplashScreen";

  @override
  bool get resizeToAvoidBottomInset => false;

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() async {
        await Future.delayed(const Duration(milliseconds: 500));
        await ref
            .read(authNotifierProvider.notifier)
            .checkToken()
            .whenComplete(pushHome);
      });

      return () {};
    }, []);

    return const SplashScreenScaffold(
      indicator: LoadingIndicator(),
    );
  }

  @override
  AppBar? buildAppBar() => null;
}
