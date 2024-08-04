import 'package:pipen/components/builders/builder/pipen_builder_when.dart';

class When<T> extends PipenBuilderWhen<T> {
  const When({
    super.deny,
    super.key,
    super.width,
    super.height,
    super.margin,
    super.loading,
    super.skeleton,
    super.alignment,
    required super.value,
    required super.child,
  });
}
