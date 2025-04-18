typedef ValuableList = List<Valuable>;
typedef ValuableListFetch = Future<ValuableList>;
typedef ValuableListFetchCallback = ValuableListFetch Function();
typedef ValuableFetchCallback = Future<Valuable> Function();

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
    return Valuable.glass(params[titleKey].toString(), params[valueKey].toString());
  }

  static List<Valuable> fromList(
    List<dynamic>? list, {
    String title = 'name',
    String value = 'id',
  }) {
    if (list == null) {
      return [];
    }

    return list.map((e) => Valuable(title: e[title], value: e[value].toString())).toList();
  }
}
