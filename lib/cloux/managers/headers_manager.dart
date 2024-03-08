import 'package:pipen/cloux/exceptions/not_bearer_token_available_exception.dart';
import 'package:pipen/cloux/configs/cloux_config.dart';
import 'package:pipen/cloux/withs/authenticate.dart';

class HeadersManager {
  /// Add request headers
  static Map<String, String> headersFromInstance(Object instance) {
    Map<String, String> headers = {'Accept': 'application/json'};

    /// Add bearer token
    if (instance is Authenticate && ClouxConfig.bearerToken != null) {
      headers['Authorization'] = 'Bearer ${ClouxConfig.bearerToken!}';
    } else if (instance is Authenticate && ClouxConfig.bearerToken == null) {
      throw NotBearerTokenAvailableException();
    }

    return headers;
  }
}
