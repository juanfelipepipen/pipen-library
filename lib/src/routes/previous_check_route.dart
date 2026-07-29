import 'package:flutter/cupertino.dart';

abstract class PreviousCheckRoute<T> {
  Future<bool> checks(BuildContext context, Object? extra);
}
