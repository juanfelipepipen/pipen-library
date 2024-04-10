import 'package:pipen/models/fail_result.dart';

abstract class UnloadableState {
  /// Event emitted, example: exception throw
  FailResult get fail;
}
