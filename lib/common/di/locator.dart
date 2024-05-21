import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/service/snack_bar_service.dart';
import 'package:get_it/get_it.dart';

import 'package:gamemuncheol/common/service/naviation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ScaffoldService());
}

extension LocatorShortCut on GetIt {
  NavigationService get navKey => this<NavigationService>();
  GlobalKey<ScaffoldMessengerState> get scaffoldKey =>
      this<ScaffoldService>().scaffoldMessengerKey;
}
