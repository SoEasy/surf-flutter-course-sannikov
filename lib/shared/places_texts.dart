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
}
