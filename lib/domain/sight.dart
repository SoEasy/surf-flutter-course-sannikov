class Sight {
  final String nameSights;
  final double lat;
  final double lon;
  final String url;
  final String details;
  // TODO replace to enum? How to serialize/deserialize enum?
  final String type;

  Sight({
    this.nameSights,
    this.lat,
    this.lon,
    this.url,
    this.details,
    this.type
  });
}