import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/service/snack_bar_service.dart';
import 'package:get_it/get_it.dart';

import 'package:gamemuncheol/common/util/naviation_util.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationUtil());
  locator.registerLazySingleton(() => ScaffoldService());
}

extension LocatorShortCut on GetIt {
  NavigationUtil get navKey => this<NavigationUtil>();
  GlobalKey<ScaffoldMessengerState> get scaffoldKey =>
      this<ScaffoldService>().scaffoldMessengerKey;
}
