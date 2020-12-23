import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';

/// Класс нижней панели табов для всего проекта
class SightBottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _isLightTheme = Theme.of(context).brightness == Brightness.light;

    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: SightIconList(
            isDark: _isLightTheme,
            isActive: false,
          ),
          activeIcon: SightIconList(
            isDark: _isLightTheme,
            isActive: true,
          ),
          label: PlacesTexts.menuList,
        ),
        BottomNavigationBarItem(
          icon: SightIconHeart(
            isDark: _isLightTheme,
            isActive: false,
          ),
          activeIcon: SightIconHeart(
            isDark: _isLightTheme,
            isActive: true,
          ),
          label: PlacesTexts.menuFavourites,
        ),
      ],
    );
  }
}
