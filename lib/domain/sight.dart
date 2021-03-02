import 'package:places/shared/places_texts.dart';

/// Типы интересных мест
enum SightType {
  hotel,
  restaurant,
  special,
  park,
  museum,
  cafe
}

final Map sightTypeVerbose = {
  SightType.hotel: PlacesTexts.sightTypeHotel,
  SightType.restaurant: PlacesTexts.sightTypeRestaurant,
  SightType.special: PlacesTexts.sightTypeSpecial,
  SightType.park: PlacesTexts.sightTypePark,
  SightType.museum: PlacesTexts.sightTypeMuseum,
  SightType.cafe: PlacesTexts.sightTypeCafe,
};

/// Модель для хранения "интересного места"
class Sight {
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final SightType type;
  final String workTime;
  final String plannedTo;
  final String achievedAt;

  Sight({
    this.name,
    this.lat,
    this.lon,
    this.url,
    this.details,
    this.type,
    this.workTime,
    this.plannedTo,
    this.achievedAt,
  });

  /// Временный идентификатор для ключей. При работе с сервером наверно
  /// появится внятный primary key id с сервера
  String get id {
    return '$name$url$details';
  }

  bool operator ==(dynamic anotherSight) {
    if (anotherSight.runtimeType != Sight) {
      throw ArgumentError('Нельзя сравнивать место и что-то другое');
    }
    return id == anotherSight.id;
  }

  String get typeVerbose {
    return sightTypeVerbose[type];
  }
}
