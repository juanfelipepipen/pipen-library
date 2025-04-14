import 'package:pipen/config/typedef.dart';
import 'dart:convert';

class ChannelEvent {
  ChannelEvent({required this.eventName, required OnJson onEvent}) : _onEvent = onEvent;

  ChannelEvent copy({required OnJson onEvent}) =>
      ChannelEvent(eventName: eventName, onEvent: onEvent);

  final OnJson _onEvent;
  final String eventName;

  void onData(String data) {
    try {
      JsonMap json = jsonDecode(data);
      _onEvent.call(json);
    } catch (_) {}
  }
}
