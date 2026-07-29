import 'package:flutter/cupertino.dart';
import 'package:pipen/extensions.dart';

class ValueProviderBuilder<T> extends StatelessWidget {
  const ValueProviderBuilder({super.key, required this.builder});

  final Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) => builder(context, context.value<T>());
}
