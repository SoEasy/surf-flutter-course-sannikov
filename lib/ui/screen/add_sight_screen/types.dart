class AddFormData {
  final String name;
  final double lat;
  final double lon;
  final String details;

  AddFormData({
    this.name,
    this.lat,
    this.lon,
    this.details,
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
