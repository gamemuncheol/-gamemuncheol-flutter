// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/view/home/home_screen.dart';
import 'package:gamemuncheol/common/view/splash_screen_scaffold.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({
    super.key,
  });

  static const PATH = "/";
  static const ROUTE_NAME = "SplashScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() async {
        await Future.delayed(const Duration(milliseconds: 500));
        await ref
            .read(authNotifierProvider.notifier)
            .checkToken()
            .then((value) => context.pushReplacement(HomeScreen.PATH));
      });

      return () {};
    }, []);

    return const SplashScreenScaffold();
  }
}
