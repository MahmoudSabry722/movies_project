import 'package:flutter/material.dart';
import '../../../../../core/styles/app_style.dart';

class StateItem extends StatelessWidget {
  final String count;
  final String label;

  const StateItem({required this.count, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(count, style: AppStyle.font24WhiteBold),
        const SizedBox(height: 4),
        Text(label, style: AppStyle.font16WhiteW400),
      ],
    );
  }
}
