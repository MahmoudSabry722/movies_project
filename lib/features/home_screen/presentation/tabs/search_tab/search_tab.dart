import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/strings/app_string.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/features/home_screen/presentation/tabs/search_tab/widgets/empty_search_state.dart';
import 'package:movies/features/home_screen/presentation/tabs/search_tab/widgets/search_result.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late TextEditingController searchController;
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.all(12),
              child: CustomTextFormField(
                controller: searchController,
                hintText: AppString.search,
                prefixIcon: SvgPicture.asset(AppIcon.search),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    isSearching = value.trim().isNotEmpty;
                  });
                },
              ),
            ),

            Expanded(
              child: isSearching
                  ? const SearchResult()
                  : const EmptySearchState(),
            ),
          ],
        ),
      ),
    );
  }
}