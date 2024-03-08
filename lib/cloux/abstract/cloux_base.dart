abstract class ClouxBase<R> {
  /// Query path
  String get path;

  /// Query params
  Map<String, dynamic> get params;

  /// On request response
  R Function(Map<dynamic, dynamic>) get response;

  /// Execute request
  Future<R> request();
}
