class Kneipe {
  final String name;
  final List oeffnungszeiten;
  final List koordinaten;
  final List tags;

  Kneipe({
    this.name,
    this.oeffnungszeiten,
    this.koordinaten,
    this.tags
  });

  factory Kneipe.fromJson(Map<String, dynamic> json) {
    return Kneipe(
      name: json['name'] as String,
      oeffnungszeiten: json['oeffnungszeiten'] as List,
      koordinaten: json['geometry']['coordinates'] as List,
      tags: json["tags"] as List
    );
  }
}