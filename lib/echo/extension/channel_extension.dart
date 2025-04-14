import 'package:pipen/echo/channel/channel_connector.dart';
import 'package:pipen/echo/channel/laravel_channel.dart';
import 'package:pipen/echo/pusher/pusher_service.dart';

extension ChannelExtension on LaravelPrivateChannel {
  /// Connect to channel
  Future<ChannelConnector> connect() async {
    final connector = ChannelConnector(client: pusher.client(), channel: this);
    await connector.connect();
    return connector;
  }
}
