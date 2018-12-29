class Kneipe {
  final String name;
  final List oeffnungszeiten;
  final List koordinaten;

  Kneipe({
    this.name,
    this.oeffnungszeiten,
    this.koordinaten
  });

  factory Kneipe.fromJson(Map<String, dynamic> json) {
    return Kneipe(
      name: json['name'] as String,
      oeffnungszeiten: json['oeffnungszeiten'] as List,
      koordinaten: json['geometry']['coordinates'] as List
    );
  }
}