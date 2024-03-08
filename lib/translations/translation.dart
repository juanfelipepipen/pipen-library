class Translation {
  Translation(this.translations);

  Map<String, dynamic> translations = {};

  String translate(String value) => translations[value] ?? value;
}
