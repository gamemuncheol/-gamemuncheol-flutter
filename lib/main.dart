import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/const/colors.dart';

import 'package:gamemuncheol/common/router/go_router.dart';
import 'package:gamemuncheol/common/router/redirect_injection_param.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double deviceWidth = 390;
    const double deviceHeight = 844;

    return ScreenUtilInit(
      designSize: const Size(
        deviceWidth,
        deviceHeight,
      ),
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(
          useMaterial3: false,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ColorGuidance.PRIMARY_BLUE,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: ref.read(
          goRouterProvider(
            redirectInjectionParam: ref.read(
              redirectInjectionParamProvider,
            ),
          ),
        ),
      ),
    );
  }
}
