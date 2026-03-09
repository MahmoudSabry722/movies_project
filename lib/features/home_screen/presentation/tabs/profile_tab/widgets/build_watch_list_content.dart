import 'package:flutter/material.dart';
import 'package:movies/core/assets/app_assets.dart';

class BuildWatchListContent extends StatelessWidget {
  const BuildWatchListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.popcornImage, width: 124, height: 124),
          ],
        ),
      ),
    );
  }
}
