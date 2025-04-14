import 'package:dart_pusher_channels/dart_pusher_channels.dart';

late PusherService pusher;

class PusherService {
  String apiUrl, accessToken, reverbKey, reverbHost;
  int reverbPort;

  PusherService({
    required this.apiUrl,
    required this.reverbHost,
    required this.reverbKey,
    required this.reverbPort,
    required this.accessToken,
  });

  /// Auth URL for authenticate pusher connections
  String get authUrl => '$apiUrl/api/broadcasting/auth';

  /// Authorization delegation for private channels
  EndpointAuthorizableChannelTokenAuthorizationDelegate<PrivateChannelAuthorizationData>
  get authorizationDelegate =>
      EndpointAuthorizableChannelTokenAuthorizationDelegate.forPrivateChannel(
        authorizationEndpoint: Uri.parse(pusher.authUrl),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $accessToken'},
      );

  /// Authorization delegation for private channels
  EndpointAuthorizableChannelTokenAuthorizationDelegate<PresenceChannelAuthorizationData>
  get authorizationPresence =>
      EndpointAuthorizableChannelTokenAuthorizationDelegate.forPresenceChannel(
        authorizationEndpoint: Uri.parse(pusher.authUrl),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $accessToken'},
      );

  /// Pusher client options
  PusherChannelsOptions options() => PusherChannelsOptions.fromHost(
    scheme: 'ws',
    key: reverbKey,
    host: reverbHost,
    port: reverbPort,
    shouldSupplyMetadataQueries: true,
    metadata: PusherChannelsOptionsMetadata.byDefault(),
  );

  /// Pusher client
  PusherChannelsClient client() => PusherChannelsClient.websocket(
    options: options(),
    connectionErrorHandler: (exception, trace, refresh) {
      Future.delayed(Duration(seconds: 10), () => refresh());
    },
  );
}
