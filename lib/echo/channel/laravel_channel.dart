import 'package:pipen/echo/channel/channel_event.dart';

abstract class LaravelPrivateChannel {
  LaravelPrivateChannel({required String channelName}) : channelName = 'private-$channelName';

  final String channelName;

  List<ChannelEvent> get events;
}
