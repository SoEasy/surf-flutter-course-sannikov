/// Тексты, используемые в проекте "Список интересных мест"
class PlacesTexts {
  static String get appTitle {
    return 'Places';
  }

  static String get sightListTitleBreak {
    return 'Список\nинтересных мест';
  }

  static String get sightListTitle {
    return PlacesTexts.sightListTitleBreak.replaceFirst('\n', ' ');
  }

  static String get favouritesTitle {
    return 'Избранное';
  }

  static String get schedulePlace {
    return 'Запланировать';
  }

  static String get markAsFavourite {
    return 'В Избранное';
  }

  static String get menuList {
    return PlacesTexts.sightListTitle;
  }

  static String get menuFavourites {
    return PlacesTexts.favouritesTitle;
  }

  static String get visitingPlanned {
    return 'Хочу посетить';
  }

  static String get visitingVisited {
    return 'Посетил';
  }

  static String get plannedTo {
    return 'Запланировано на';
  }

  static String get achievedAt {
    return 'Цель достигнута';
  }

  static String get emptyScreenTitle {
    return 'Пусто';
  }

  static String get emptyPlannedText {
    return 'Отмечайте понравившиеся\nместа и они появиятся здесь.';
  }

  static String get emptyVisitedText {
    return 'Завершите маршрут,\nчтобы место попало сюда.';
  }

  static String get filterDistanceTitle {
    return 'Расстояние';
  }

  static String get sightTypeHotel {
    return 'Отель';
  }

  static String get sightTypeRestaurant {
    return 'Ресторан';
  }

  static String get sightTypeSpecial {
    return 'Особое место';
  }

  static String get sightTypePark {
    return 'Парк';
  }

  static String get sightTypeMuseum {
    return 'Музей';
  }

  static String get sightTypeCafe {
    return 'Кафе';
  }
}
