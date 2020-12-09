/// Тексты, используемые в проекте "Список интересных мест"
class PlacesTexts {
  static String get appTitle {
    return 'Places';
  }

  static String get sightListTitleBreak {
    return 'Список \nинтересных мест';
  }

  static String get sightListTitle {
    return PlacesTexts.sightListTitleBreak.replaceFirst('\n', '');
  }

  static String get SchedulePlace {
    return 'Запланировать';
  }

  static String get MarkAsFavourite {
    return 'В Избранное';
  }
}