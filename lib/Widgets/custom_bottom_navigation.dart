import 'package:flutter/material.dart';
import 'package:pokemon_api/Widgets/custom_bottom_navigation_bar_item.dart';
import 'package:pokemon_api/constans/app_colors.dart';

import '../constans/app_text_styles.dart';

class CustomBottomNavigation extends StatefulWidget {
  final void Function(int index) onIndexSelected;
  final List<CustomBottomNavigationBarItem> item;
  const CustomBottomNavigation({
    Key? key,
    required this.item,
    required this.onIndexSelected,
  }) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.WHITE,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.DARK_BLUE,
      unselectedItemColor: AppColors.LIGHT_GREY,
      unselectedLabelStyle: AppTextStyles.NUNITO_400_LOW,
      selectedLabelStyle: AppTextStyles.NUNITO_400_LOW,
      unselectedFontSize: 14,
      selectedFontSize: 14,
      iconSize: 28,
      showUnselectedLabels: true,
      currentIndex: selected,
      onTap: (index) {
        widget.onIndexSelected(index);
        setState(() {
          selected = index;
        });
      },
      items: List.from(
        widget.item.map((item) =>
            BottomNavigationBarItem(icon: Icon(item.icon), label: item.label)),
      ),
    );
  }
}
