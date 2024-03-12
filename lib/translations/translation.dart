class Translation {
  Map<String, dynamic> translations = {};

  Translation(this.translations);

  String translate(String value) => translations[value] ?? value;

  List<String> get values => translations.entries.map<String>((e) => e.value.toString()).toList();
}
