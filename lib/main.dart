import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/isar/isar.dart';
import 'package:gamemuncheol/common/router/go_router.dart';
import 'package:gamemuncheol/common/router/redirect_injection_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "app_config.env");
  final IsarSource isarSource = IsarSource();

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(await isarSource.getIsar()),
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

    return ScreenUtilInit(
      designSize: const Size(deviceWidth, deviceHeight),
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(
          useMaterial3: false,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColor.PRIMARY_BLUE,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: ref.read(
          goRouterProvider(
            redirectInjectionService:
                ref.read(redirectInjectionServiceProvider),
          ),
        ),
      ),
    );
  }
}
