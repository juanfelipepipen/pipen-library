class Translation {
  Map<String, dynamic> translations = {};

  Translation(this.translations);

  String translate(String value) => translations[value] ?? value;

  String? translateNullable(String? value) {
    if (value != null) {
      return translations[value] ?? value;
    }
    return null;
  }

  List<String> get values => translations.entries.map<String>((e) => e.value.toString()).toList();
}
