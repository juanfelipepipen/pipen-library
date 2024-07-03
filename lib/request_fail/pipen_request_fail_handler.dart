import 'package:flutter/foundation.dart';

class PipenRequestFailHandler {
  PipenRequestFailHandler({this.onSessionExpired, this.onException});

  VoidCallback? onSessionExpired, onException;
}
