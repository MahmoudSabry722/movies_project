import 'package:flutter/material.dart';
import 'package:movies/core/assets/app_assets.dart';

class AvatarPageView extends StatefulWidget {
  const AvatarPageView({super.key});

  @override
  State<AvatarPageView> createState() => _AvatarPageViewState();
}

class _AvatarPageViewState extends State<AvatarPageView> {
  final PageController _controller = PageController(viewportFraction: 0.35);

  final List<String> images = [
    AppImage.avatar1,
    AppImage.avatar2,
    AppImage.avatar3,
    AppImage.avatar4,
    AppImage.avatar5,
    AppImage.avatar6,
    AppImage.avatar7,
    AppImage.avatar8,
    AppImage.avatar9
  ];

  double currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: PageView.builder(
        controller: _controller,
        itemCount: images.length,
        itemBuilder: (context, index) {
          double difference = (currentPage - index).abs();
          double scale = (1 - (difference * 0.3)).clamp(0.7, 1.0);

          return Center(
            child: Transform.scale(
              scale: scale,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(images[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}