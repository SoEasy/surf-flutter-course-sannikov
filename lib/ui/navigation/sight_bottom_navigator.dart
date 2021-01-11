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
          icon: SightIconList(
            withTheme: true,
            isActive: false,
          ),
          activeIcon: SightIconList(
            withTheme: true,
            isActive: true,
          ),
          label: PlacesTexts.menuList,
        ),
        BottomNavigationBarItem(
          icon: SightIconHeart(
            withTheme: true,
            isActive: false,
          ),
          activeIcon: SightIconHeart(
            withTheme: true,
            isActive: true,
          ),
          label: PlacesTexts.menuFavourites,
        ),
        BottomNavigationBarItem(
          icon: SightIconSettings(
            isActive: false,
          ),
          activeIcon: SightIconSettings(
            isActive: true,
          ),
          label: PlacesTexts.menuSettings,
        ),
      ],
    );
  }
}
