class AddFormData {
  final String name;
  final double lat;
  final double lon;
  final String details;

  AddFormData({
    required this.name,
    required this.lat,
    required this.lon,
    required this.details,
  });

  AddFormData update({name, lat, lon, details}) {
    return AddFormData(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      details: details ?? this.details,
    );
  }
}
