import 'package:flutter/widgets.dart';

abstract class DeepLinkOperation {
  /// Handle strategy when is validated
  void handle(BuildContext context, Uri uri);

  /// Validate if depp link strategy is correct
  bool validate(Uri uri);
}
