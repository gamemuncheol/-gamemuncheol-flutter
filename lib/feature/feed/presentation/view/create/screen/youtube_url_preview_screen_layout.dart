import 'package:flutter/material.dart';

class YoutubeUrlPreviewScreenLayout extends StatelessWidget {
  final Widget backgrondArea;
  final Widget player;

  const YoutubeUrlPreviewScreenLayout({
    super.key,
    required this.backgrondArea,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgrondArea,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: player,
            ),
            const SizedBox(
              height: kToolbarHeight,
            )
          ],
        ),
      ],
    );
  }
}
