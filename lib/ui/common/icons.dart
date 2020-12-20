import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Базовый класс иконки
class IconBase extends StatelessWidget {
  final String asset;
  final bool isDark;
  final bool isActive;

  const IconBase({
    this.asset,
    this.isDark = false,
    this.isActive = false
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      '${asset}${isDark ? '_dark' : ''}${isActive ? '_filled' : ''}.svg',
      width: 24,
      height: 24,
    );
  }
}

/// Класс иконки избранного
class IconHeart extends IconBase {
  final bool isDark;
  final bool isActive;

  const IconHeart({
    this.isDark = false,
    this.isActive = false
  }): super(
    asset: 'res/icons/icon_heart',
    isDark: isDark,
    isActive: isActive
  );
}

/// Класс иконки листа
class IconList extends IconBase {
  final bool isDark;
  final bool isActive;

  const IconList({
    this.isDark = false,
    this.isActive = false
  }): super(
      asset: 'res/icons/icon_list',
      isDark: isDark,
      isActive: isActive
  );
}
