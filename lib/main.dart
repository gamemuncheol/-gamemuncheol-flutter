import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/router/go_router.dart';
import 'package:gamemuncheol/common/router/redirect_injection_param.dart';
import 'package:gamemuncheol/common/router/redirect_state.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/state/auth_state.dart';

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
    // 리다이렉트 상태 생성
    final ValueNotifier<RedirectState> redirectState =
        ValueNotifier<RedirectState>(
      RedirectState.SPLASH,
    );

    // authNotifierProvider 상태에 따라 리다이렉트 상태를 변경
    ref.listen(authNotifierProvider, (previous, next) async {
      if (next is AuthStateAuthenticatedWithNickName) {
        redirectState.value = RedirectState.AUTHENTICATED_WITH_NICKNAME;
      }
      if (next is AuthStateAuthenticated) {
        redirectState.value = RedirectState.AUTHENTICATED;
      } else if (next is AuthStateUnAuthenticated) {
        redirectState.value = RedirectState.UNAUTHENTICATED;
      }
    });

    return ScreenUtilInit(
      designSize: const Size(
        390,
        844,
      ),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: ref.read(
          goRouterProvider(
            redirectInjectionParam: RedirectInjectionParam(
              redirectState,
            ),
          ),
        ),
      ),
    );
  }
}
