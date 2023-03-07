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
  final Color? color;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final _isLight = Theme.of(context).brightness == Brightness.light;
    Color? iconColor;

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

  const SightIconBase({
    required this.asset,
    this.withTheme = false,
    this.isActive = false,
    this.disabled = false,
    this.width = 24,
    this.height = 24,
    this.color,
  });
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
  const SightIconList({withTheme = false, isActive = false})
      : super(
          asset: 'res/icons/icon_list',
          withTheme: withTheme,
          isActive: isActive,
        );
}

/// Класс иконки настроек
class SightIconSettings extends SightIconBase {
  const SightIconSettings({isActive = false})
      : super(
          asset: 'res/icons/icon_settings',
          withTheme: true,
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
    withTheme = false,
  }) : super(
          asset: 'res/icons/icon_arrow_left',
          color: color,
          withTheme: withTheme,
        );
}

class SightIconArrowRight extends SightIconBase {
  const SightIconArrowRight({
    color,
    withTheme,
  }) : super(
          asset: 'res/icons/icon_arrow_right',
          color: color,
          withTheme: withTheme,
        );
}

class SightIconPlus extends SightIconBase {
  const SightIconPlus({
    withTheme = false,
  }) : super(
          asset: 'res/icons/icon_plus',
          withTheme: withTheme,
        );
}

class SightIconChoiceLight extends SightIconBase {
  const SightIconChoiceLight()
      : super(
          asset: 'res/icons/icon_choice_light',
        );
}

class SightIconChoiceDark extends SightIconBase {
  const SightIconChoiceDark()
      : super(
          asset: 'res/icons/icon_choice_dark',
        );
}

class SightIconChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _isLight = Theme.of(context).brightness == Brightness.light;
    return _isLight ? SightIconChoiceLight() : SightIconChoiceDark();
  }
}

class SightIconCatalogCafe extends SightIconBase {
  const SightIconCatalogCafe()
      : super(
          asset: 'res/icons/icon_catalog_cafe',
          width: 32,
          height: 32,
        );
}

class SightIconCatalogHotel extends SightIconBase {
  const SightIconCatalogHotel()
      : super(
          asset: 'res/icons/icon_catalog_hotel',
          width: 32,
          height: 32,
        );
}

class SightIconCatalogMuseum extends SightIconBase {
  const SightIconCatalogMuseum()
      : super(
          asset: 'res/icons/icon_catalog_museum',
          width: 32,
          height: 32,
        );
}

class SightIconCatalogPark extends SightIconBase {
  const SightIconCatalogPark()
      : super(
          asset: 'res/icons/icon_catalog_park',
          width: 32,
          height: 32,
        );
}

class SightIconCatalogRestaurant extends SightIconBase {
  const SightIconCatalogRestaurant()
      : super(
          asset: 'res/icons/icon_catalog_restaurant',
          width: 32,
          height: 32,
        );
}

class SightIconCatalogSpecial extends SightIconBase {
  const SightIconCatalogSpecial()
      : super(
          asset: 'res/icons/icon_catalog_special',
          width: 32,
          height: 32,
        );
}

class SightIconInfo extends SightIconBase {
  const SightIconInfo({Color? color})
      : super(
          asset: 'res/icons/icon_info',
          color: color,
        );
}

class SightIconSearch extends SightIconBase {
  const SightIconSearch({
    width = 24.0,
    height = 24.0,
    withTheme = false,
  }) : super(
          asset: 'res/icons/icon_search',
          width: width,
          height: height,
          withTheme: withTheme,
        );
}

class SightIconFilter extends SightIconBase {
  const SightIconFilter()
      : super(
          asset: 'res/icons/icon_filter',
          width: 24,
          height: 24,
        );
}

class SightIconDelete extends SightIconBase {
  const SightIconDelete()
      : super(
          asset: 'res/icons/icon_delete',
          width: 24,
          height: 24,
        );
}

class SightIconTrash extends SightIconBase {
  const SightIconTrash()
      : super(
    asset: 'res/icons/icon_trash',
    width: 24,
    height: 24,
  );
}

class SightIconClear extends SightIconBase {
  const SightIconClear({
    withTheme = false,
    color = null,
    width = 24.0,
    height = 24.0,
  }) : super(
          asset: 'res/icons/icon_clear',
          width: width,
          height: height,
          withTheme: withTheme,
          color: color,
        );
}

class SightIconOnboardingFirst extends SightIconBase {
  const SightIconOnboardingFirst(): super(
    asset: 'res/icons/icon_onboarding_first',
    width: 104,
    height: 104
  );
}

class SightIconOnboardingSecond extends SightIconBase {
  const SightIconOnboardingSecond(): super(
      asset: 'res/icons/icon_onboarding_second',
      width: 104,
      height: 104
  );
}

class SightIconOnboardingThird extends SightIconBase {
  const SightIconOnboardingThird(): super(
      asset: 'res/icons/icon_onboarding_third',
      width: 104,
      height: 104
  );
}
