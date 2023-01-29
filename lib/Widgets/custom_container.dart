import 'package:flutter/material.dart';

import '../constans/app_colors.dart';
import '../constans/app_text_styles.dart';

class CustomContainer extends StatelessWidget {
  final Color color;
  final String text;

  const CustomContainer({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.32, top: 10),
      child: Container(
        height: 24,
        width: 66.95,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          color: color,
        ),
        child: Center(
          child: Text(text,
              style: AppTextStyles.NUNITO_400_LOW
                  .copyWith(color: AppColors.BACKGROUND_COLLOR)),
        ),
      ),
    );
  }
}
