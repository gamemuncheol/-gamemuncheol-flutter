import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/common/repository/isar/isar.dart';
import 'package:gamemuncheol/common/service/redirect_injection_service.dart';
import 'package:gamemuncheol/common/service/snack_bar_service.dart';
import 'package:gamemuncheol/common/util/naviation_util.dart';
import 'package:gamemuncheol/common/util/system_util.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';
import 'package:gamemuncheol/config/router/go_router.dart';
import 'package:gamemuncheol/config/theme/theme_enum.dart';
import 'package:gamemuncheol/config/theme/theme_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "app_config.env");
  setupLocator();

  final Brightness brightness = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first,
  ).platformBrightness;

  final ThemeEnum initialTheme =
      brightness == Brightness.dark ? ThemeEnum.dark : ThemeEnum.light;

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(await IsarSource.getIsar()),
        themeProvider.overrideWith((ref) => ThemeManagerImpl(initialTheme)),
      ],
      child: MyApp(
        brightness: brightness,
      ),
    ),
  );
}

class MyApp extends ConsumerWidget with SystemUtil {
  final Brightness brightness;
  const MyApp({super.key, required this.brightness});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 기기 기본 인터페이스 설정
    setDefaultSystemUiMode();
    portraitUp();

    // 인터페이스 테마 설정
    if (brightness == Brightness.light) {
      setWhiteThemeSystemUiMode();
    }

    const double deviceWidth = 390;
    const double deviceHeight = 844;

    final ThemeManger theme = ref.watch(themeProvider);
    final GoRouter router = ref.read(
      goRouterProvider(
        naveKey: locator.get<NavigationUtil>().navigatorKey,
        redirectInjectionService: ref.read(redirectInjectionServiceProvider),
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(deviceWidth, deviceHeight),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          theme: theme.currentTheme,
          scaffoldMessengerKey:
              locator.get<ScaffoldService>().scaffoldMessengerKey,
          builder: (context, child) {
            ThemeUtil.init(context);
            return child!;
          },
        );
      },
    );
  }
}
