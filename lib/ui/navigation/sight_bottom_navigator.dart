import 'package:flutter/material.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';

/// Класс нижней панели табов для всего проекта
class SightBottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: const IconList(
            isDark: true,
            isActive: false,
          ),
          activeIcon: const IconList(
            isDark: true,
            isActive: true,
          ),
          label: PlacesTexts.menuList,
        ),
        BottomNavigationBarItem(
          icon: const IconHeart(
            isDark: true,
            isActive: false,
          ),
          activeIcon: const IconHeart(
            isDark: true,
            isActive: true,
          ),
          label: PlacesTexts.menuFavourites,
        ),
      ],
    );
  }
}
