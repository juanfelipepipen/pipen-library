class PusherEchoOptions {
  PusherEchoOptions({this.onConnectionFail, Duration? refreshWait})
    : refreshWait = refreshWait ?? Duration(seconds: 10);

  String Function()? onConnectionFail;
  Duration refreshWait;
}
