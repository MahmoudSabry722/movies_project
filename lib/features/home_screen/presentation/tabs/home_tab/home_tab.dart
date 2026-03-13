import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/features/home_screen/presentation/tabs/home_tab/widgets/movie_section.dart';
import 'package:movies/features/home_screen/presentation/tabs/home_tab/widgets/movie_header_section.dart';
import 'package:movies/features/home_screen/presentation/tabs/home_tab/widgets/dynamic_background.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late PageController _movieController;
  double _pageOffset = 0.0;

  final List<String> categories = [
    "Action",
    "Adventure",
    "Comedy",
    "Drama",
    "Horror",
    "Sci-Fi",
    "Animation",
  ];

  Map<String, List<String>> categoryMovies = {};

  final List<String> moviePosters = [
    AppImage.poster2,
    AppImage.onBoarding2,
    AppImage.onBoarding3,
    AppImage.onBoarding4,
    AppImage.onBoarding5,
    AppImage.onBoarding6,
  ];

  @override
  void initState() {
    super.initState();
    categories.shuffle();
    for (var category in categories) {
      categoryMovies[category] = List.from(moviePosters)..shuffle();
    }

    _movieController = PageController(viewportFraction: 0.7, initialPage: 0);
    _movieController.addListener(() {
      if (_movieController.hasClients) {
        setState(() {
          _pageOffset = _movieController.page ?? 0.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _movieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentBackground =
        moviePosters[_pageOffset.round() % moviePosters.length];

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        children: [
          DynamicBackground(imagePath: currentBackground),

          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MovieHeaderSection(
                  controller: _movieController,
                  pageOffset: _pageOffset,
                  moviePosters: moviePosters,
                ),

                SizedBox(height: 20.h),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return MovieSection(
                      title: category,
                      images: categoryMovies[category] ?? moviePosters,
                    );
                  },
                ),

                SizedBox(height: 25.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
