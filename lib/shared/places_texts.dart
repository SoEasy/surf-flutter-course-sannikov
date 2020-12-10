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
}