/// Тексты, используемые в проекте "Список интересных мест"
class PlacesTexts {
  static const String appTitle = 'Places';

  static const String sightListTitleBreak = 'Список\nинтересных мест';

  static final String sightListTitle = PlacesTexts.sightListTitleBreak.replaceFirst('\n', ' ');

  static const String favouritesTitle = 'Избранное';

  static const String settingsTitle = 'Настройки';

  static const String schedulePlace = 'Запланировать';

  static const String markAsFavourite = 'В Избранное';

  static final String menuList = PlacesTexts.sightListTitle;

  static const String menuFavourites = PlacesTexts.favouritesTitle;

  static const String menuSettings = PlacesTexts.settingsTitle;

  static const String visitingPlanned = 'Хочу посетить';

  static const String visitingVisited = 'Посетил';

  static const String plannedTo = 'Запланировано на';

  static const String achievedAt = 'Цель достигнута';

  static const String emptyScreenTitle = 'Пусто';
  static const String emptyPlannedText = 'Отмечайте понравившиеся\nместа и они появиятся здесь.';
  static const String emptyVisitedText = 'Завершите маршрут,\nчтобы место попало сюда.';

  static const String filterDistanceTitle = 'Расстояние';

  static const String sightTypeHotel = 'Отель';
  static const String sightTypeRestaurant = 'Ресторан';
  static const String sightTypeSpecial = 'Особое место';
  static const String sightTypePark = 'Парк';
  static const String sightTypeMuseum = 'Музей';
  static const String sightTypeCafe = 'Кафе';

  static const String settingsDarkTheme = 'Тёмная тема';
  static const String settingsShowTutorial = 'Смотреть туториал';

  static const String addPlaceTitle = 'Новое место';

  static const String actionCancel = 'Отмена';
  static const String actionCreate = 'Создать';
  static const String actionSelectOnMap = 'Указать на карте';
}
