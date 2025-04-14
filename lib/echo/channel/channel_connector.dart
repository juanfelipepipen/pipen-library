
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:pipen/echo/channel/laravel_channel.dart';
import 'package:pipen/echo/channel/pusher_service.dart';

class ChannelConnector {
  final LaravelPrivateChannel _channel;
  PusherChannelsClient client;
  PrivateChannel? channel;

  ChannelConnector({required this.client, required LaravelPrivateChannel channel})
    : _channel = channel;

  /// Connect to channel
  Future<void> connect() async {
    client.onConnectionEstablished.listen((_) {
      _connectChannel();
    });
    client.pusherErrorEventStream.listen((_) {});
    await client.connect();
  }

  void _connectChannel() {
    print('CONNECTING CHANNEL');
    channel = client.privateChannel(
      _channel.channelName,
      authorizationDelegate: pusher.authorizationDelegate,
    );

    channel!.whenSubscriptionSucceeded().listen((data) {
      print('CHANNEL CONNECTED');
    });
    channel!.onSubscriptionError().listen((data) {});
    channel!.onAuthenticationSubscriptionFailed().listen((data) {});
    channel!.subscribe();
    _bindEvents();
  }

  /// Bind channel events
  void _bindEvents() {
    if (channel case PrivateChannel channel) {
      for (final event in _channel.events) {
        channel.bind(event.eventName).listen((data) {
          event.onData(data.data.toString());
        });
      }
    }
  }

  /// Close channel
  void close() {
    client.disconnect();
    client.dispose();
  }
}
