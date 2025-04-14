import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:pipen/echo/channel/laravel_channel.dart';
import 'package:pipen/echo/pusher/pusher_service.dart';

class ChannelConnector {
  final LaravelPrivateChannel _channel;
  PusherChannelsClient client;
  PrivateChannel? channel;

  ChannelConnector({required this.client, required LaravelPrivateChannel channel})
    : _channel = channel;

  /// Connect to channel
  Future<void> connect() async {
    print('CONECTING');
    client.onConnectionEstablished.listen((_) {
      print('EA');
      _connectChannel();
    });
    client.pusherErrorEventStream.listen((_) {
      print('FAIL');
    });
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
    channel!.onSubscriptionError().listen((data) {
      print(data);
    });
    channel!.onAuthenticationSubscriptionFailed().listen((data) {
      print(data);
    });
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
