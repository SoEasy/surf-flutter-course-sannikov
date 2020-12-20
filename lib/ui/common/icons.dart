import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Базовый класс иконки
class SightIconBase extends StatelessWidget {
  final String asset;
  final bool isDark;
  final bool isActive;

  const SightIconBase({
    this.asset,
    this.isDark = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      '$asset${isDark ? '_dark' : ''}${isActive ? '_filled' : ''}.svg',
      width: 24,
      height: 24,
    );
  }
}

/// Класс иконки избранного
class SightIconHeart extends SightIconBase {
  final bool isDark;
  final bool isActive;

  const SightIconHeart({this.isDark = false, this.isActive = false})
      : super(
          asset: 'res/icons/icon_heart',
          isDark: isDark,
          isActive: isActive,
        );
}

/// Класс иконки листа
class SightIconList extends SightIconBase {
  final bool isDark;
  final bool isActive;

  const SightIconList({this.isDark = false, this.isActive = false})
      : super(
          asset: 'res/icons/icon_list',
          isDark: isDark,
          isActive: isActive,
        );
}

/// Класс иконки календаря
class SightIconCalendar extends SightIconBase {
  const SightIconCalendar()
      : super(
          asset: 'res/icons/icon_calendar',
        );
}

/// Класс иконки крестика
class SightIconClose extends SightIconBase {
  const SightIconClose()
      : super(
          asset: 'res/icons/icon_close',
        );
}

/// Класс иконки поделиться
class SightIconShare extends SightIconBase {
  const SightIconShare()
      : super(
          asset: 'res/icons/icon_share',
        );
}
