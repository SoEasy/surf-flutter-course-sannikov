import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/shared/places_sizes.dart';

/// Базовый класс иконки
class SightIconBase extends StatelessWidget {
  final String asset;
  final bool isDark;
  final bool isActive;
  final double width;
  final double height;

  const SightIconBase({
    this.asset,
    this.isDark = false,
    this.isActive = false,
    this.width = 24,
    this.height = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      '$asset${isDark ? '_dark' : ''}${isActive ? '_filled' : ''}.svg',
      width: width,
      height: height,
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

/// Класс иконки для пустого списка планируемых мест
class SightIconCard extends SightIconBase {
  const SightIconCard()
      : super(
          asset: 'res/icons/icon_card',
          width: 64,
          height: 64,
        );
}

/// Класс иконки для пустого списка посещенных мест
class SightIconGo extends SightIconBase {
  const SightIconGo()
      : super(
    asset: 'res/icons/icon_go',
    width: 64,
    height: 64,
  );
}
