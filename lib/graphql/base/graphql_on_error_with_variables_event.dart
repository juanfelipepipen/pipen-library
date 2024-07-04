import 'package:graphql/client.dart';

abstract class GraphqlOnErrorWithVariablesEvent {
  /// Callback for handler exception after request execution
  Function(OperationException? exception, Map<String, dynamic> variables) get onError;
}
