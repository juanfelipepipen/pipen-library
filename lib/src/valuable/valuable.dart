import 'package:pipen/config/typedef.dart';
import 'package:uuid/uuid.dart';

typedef ValuableList = List<Valuable>;
typedef ValuableListFetch = Future<ValuableList>;
typedef ValuableFetchCallback = Future<Valuable> Function();
typedef ValuableListFetchCallback = ValuableListFetch Function();

/// Base instance at valuable
class Valuable {
  Valuable({required this.title, required this.value});

  Valuable.glass(this.title, this.value);

  Valuable.pending(this.title) : value = 'pending-${Uuid().v4()}';

  Valuable copyWith() => Valuable(title: title, value: value);

  final String title, value;

  bool get isPending => value.startsWith('pending-');

  /// Create valuable from json map
  factory Valuable.fromJson(JsonMap params, {String titleKey = 'name', String valueKey = 'id'}) {
    return Valuable.glass(params[titleKey].toString(), params[valueKey].toString());
  }

  /// Create a valuable with a same title & value
  factory Valuable.equality(String value) {
    return Valuable.glass(value, value);
  }

  /// Get list of valuables from a dynamic list
  static ValuableList fromList(List<dynamic>? list, {String title = 'name', String value = 'id'}) {
    if (list == null) return [];
    return list.map((e) => Valuable(title: e[title], value: e[value].toString())).toList();
  }
}
