class PlacesTexts {
  static String get AppTitle {
    return 'Places';
  }

  static String get SightListTitleBreak {
    return 'Список \nинтересных мест';
  }

  static String get SightListTitle {
    return PlacesTexts.SightListTitleBreak.replaceFirst('\n', '');
  }
}