import 'package:flutter/material.dart';
import 'package:movies/core/widgets/movie_poster.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 120),
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 189 / 279,
        ),
        itemBuilder: (context, index) {
          return const MoviePoster();
        },
      ),
    );
  }
}
