import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/shared/places_colors.dart';

/// Базовый класс иконки
class SightIconBase extends StatelessWidget {
  /// Обязательный параметр из классов-наследников
  final String asset;

  /// Необязательный параметр, по умолчанию false.
  /// Наследник, если ему надо, может его передавать, и тогда иконка будет
  /// вместе с темой менять свой цвет, совпадает с цветом текста для темы.
  /// ВАЖНО! Не стоит использовать с разноцветными иконками - херня получится
  final bool withTheme;

  /// Активные иконки имеют другую форму, для них лежат отдельные svg
  final bool isActive;

  /// Необязательный параметр, по умолчанию false.
  /// Если будет true - иконка окрасится в полупрозрачный цвет secondary2
  /// Сильный параметр, если true - будет проигнорирована тема
  final bool disabled;

  /// Необязательный параметр, позволяет хардкорно задать цвет и игнорировать
  /// тему и disabled
  final Color color;

  final double width;
  final double height;

  const SightIconBase({
    this.asset,
    this.withTheme = false,
    this.isActive = false,
    this.disabled = false,
    this.width = 24,
    this.height = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final _isLight = Theme.of(context).brightness == Brightness.light;
    Color iconColor;

    if (disabled) {
      iconColor = PlacesColors.textSecondary2Opacity;
    } else if (color != null) {
      iconColor = color;
    } else {
      iconColor = withTheme
          ? _isLight
              ? PlacesColors.textMainLight
              : PlacesColors.textMainDark
          : null;
    }

    return SvgPicture.asset(
      '$asset${isActive ? '_filled' : ''}.svg',
      width: width,
      height: height,
      color: iconColor,
    );
  }
}

/// Класс иконки избранного
class SightIconHeart extends SightIconBase {
  final bool isActive;

  const SightIconHeart({withTheme = false, this.isActive = false})
      : super(
          asset: 'res/icons/icon_heart',
          withTheme: withTheme,
          isActive: isActive,
        );
}

/// Класс иконки листа
class SightIconList extends SightIconBase {
  final bool isActive;

  const SightIconList({withTheme = false, this.isActive = false})
      : super(
          asset: 'res/icons/icon_list',
          withTheme: withTheme,
          isActive: isActive,
        );
}

/// Класс иконки календаря
class SightIconCalendar extends SightIconBase {
  const SightIconCalendar({withTheme = false, disabled = false})
      : super(
          asset: 'res/icons/icon_calendar',
          withTheme: withTheme,
          disabled: disabled,
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
  const SightIconGo({
    width = 64.0,
    height = 64.0,
    color,
  }) : super(
            asset: 'res/icons/icon_go',
            width: width,
            height: height,
            color: color);
}

/// Иконка стрелки влево
class SightIconArrowLeft extends SightIconBase {
  const SightIconArrowLeft({
    color,
  }): super(
    asset: 'res/icons/icon_arrow_left',
    color: color
  );
}
