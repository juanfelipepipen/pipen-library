import 'package:pipen/config/typedef.dart';
import 'package:graphql/client.dart';

abstract class GraphqlOnErrorWithVariablesEvent {
  /// Callback for handler exception after request execution
  Function(OperationException? exception, JsonMap variables) get onError;
}
