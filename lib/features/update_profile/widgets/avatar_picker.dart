import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/colors/app_color.dart';
import 'avatar_item.dart';

class AvatarPicker {
  static void show(
    BuildContext context, {
    required List<String> avatars,
    required String selectedAvatar,
    required Function(String) onAvatarSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.tertiaryColor,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) {
        return Container(
          padding: REdgeInsets.all(20),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h,
            ),
            itemCount: avatars.length,
            itemBuilder: (context, index) {
              return AvatarItem(
                imagePath: avatars[index],
                isSelected: selectedAvatar == avatars[index],
                onTap: () {
                  onAvatarSelected(avatars[index]);
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }
}
