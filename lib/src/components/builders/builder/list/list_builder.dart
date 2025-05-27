part of 'pipen_list_builder.dart';

class ListBuilder<T> {
  ListBuilder({required this.items, required this.builder, this.skeletons = 3});

  final Widget Function(T? value) builder;
  Iterable<T>? items;
  final int skeletons;

  /// Get items list or list with null values for skeleton items
  Iterable<T?> get generated {
    if (items case Iterable<T> items) {
      return items;
    }
    return Iterable.generate(skeletons, (index) => null).toList();
  }

  /// Build widgets list
  Iterable<Widget> build() {
    return generated.map((e) => builder(e));
  }
}
