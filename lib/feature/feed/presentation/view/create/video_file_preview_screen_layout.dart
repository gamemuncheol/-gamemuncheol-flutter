import 'package:flutter/material.dart';

class VideoFilePreviewScreenLayout extends StatelessWidget {
  final Widget backgrondArea;
  final Widget popButton;
  final Widget player;
  const VideoFilePreviewScreenLayout({
    super.key,
    required this.backgrondArea,
    required this.popButton,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          backgrondArea,
          SafeArea(child: popButton),
          Center(child: player),
        ],
    );
  }
}
