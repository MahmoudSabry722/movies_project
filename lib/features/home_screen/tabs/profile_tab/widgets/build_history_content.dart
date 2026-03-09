import 'package:flutter/material.dart';
import '../../../../../core/widgets/movie_poster.dart';

class BuildHistoryContent extends StatelessWidget {
  const BuildHistoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return const MoviePoster();
      },
    );
  }
}
