import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/isar/isar.dart';
import 'package:gamemuncheol/common/router/go_router.dart';
import 'package:gamemuncheol/common/router/redirect_injection_service.dart';
import 'package:gamemuncheol/common/theme/theme_enum.dart';
import 'package:gamemuncheol/common/theme/theme_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "app_config.env");
  final IsarSource isarSource = IsarSource();

  final Brightness brightness = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first,
  ).platformBrightness;

  final ThemeEnum initialTheme =
      brightness == Brightness.dark ? ThemeEnum.dark : ThemeEnum.light;

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(await isarSource.getIsar()),
        themeProvider.overrideWith((ref) => ThemeManagerImpl(initialTheme))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double deviceWidth = 390;
    const double deviceHeight = 844;

    final ThemeManger theme = ref.watch(themeProvider);
    final GoRouter router = ref.read(
      goRouterProvider(
        redirectInjectionService: ref.read(redirectInjectionServiceProvider),
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(deviceWidth, deviceHeight),
      builder: (context, child) => MaterialApp.router(
        theme: theme.currentTheme,
        routerConfig: router,
      ),
    );
  }
}
