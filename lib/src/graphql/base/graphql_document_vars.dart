import 'package:pipen/config/typedef.dart';

/// Replace elements on document if include [[value]] on var map
abstract class GraphqlDocumentVars {
  JsonMap get documentVars;
}
