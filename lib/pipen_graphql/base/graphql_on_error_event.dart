import 'package:graphql/client.dart';

abstract class GraphqlOnErrorEvent {
  /// Callback for handler exception after request execution
  Function(OperationException? exception) get onError;
}
