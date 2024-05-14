import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/presentation/layout/default_layout.dart';

class VideoFilePreviewScreenScaffold extends StatelessWidget {
  final Widget backgrondArea;
  final Widget popButton;
  final Widget player;
  const VideoFilePreviewScreenScaffold({
    super.key,
    required this.backgrondArea,
    required this.popButton,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Stack(
        children: [
          backgrondArea,
          SafeArea(child: popButton),
          Center(child: player),
        ],
      ),
    );
  }
}
