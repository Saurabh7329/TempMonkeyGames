class LocalDetails {
  final String timezone;
  final dynamic abbreviation;
  final int offset;

  LocalDetails({
    required this.timezone,
    required this.abbreviation,
    required this.offset,
  });

  factory LocalDetails.fromJson(Map<String, dynamic> json) {
    final timezone = json['timezone'];
    final abbreviation = json['abbreviation'];
    final offset = json['offset'];
    return LocalDetails(
        timezone: timezone,
        abbreviation: abbreviation,
        offset: offset is double ? offset.toInt() : offset);
  }
}
