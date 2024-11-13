typedef ValuableList = List<Valuable>;
typedef ValuableFetch = Future<ValuableList>;

/// Base instance at valuable
class Valuable {
  String title, value;

  Valuable({required this.title, required this.value});

  Valuable.glass(this.title, this.value);

  Valuable copyWith() => Valuable(title: title, value: value);

  static Valuable fromJson(
    Map<dynamic, dynamic> params, {
    String titleKey = 'name',
    String valueKey = 'id',
  }) {
    return Valuable.glass(params[titleKey], params[valueKey]);
  }

  static List<Valuable> fromList(
    List<dynamic>? list, {
    String title = 'name',
    String value = 'id',
  }) {
    if (list == null) {
      return [];
    }

    return list.map((e) => Valuable(title: e[title], value: e[value])).toList();
  }
}
