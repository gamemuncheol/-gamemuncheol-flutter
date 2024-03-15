// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  static const PATH = "/";
  static const ROUTE_NAME = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.pushReplacement(
      HomeScreen.PATH,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  const DefaultLayout(
      child: SizedBox(),
    );
  }
}
