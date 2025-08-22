part of 'type_safe_route.dart';

abstract class TypeSafeExtraRoute<T> extends TypeSafeRoute {
  TypeSafeExtraRoute({
    required super.name,
    required super.path,
    super.queryParameters,
    required T params,
  }) {
    extra = params;
  }
}
