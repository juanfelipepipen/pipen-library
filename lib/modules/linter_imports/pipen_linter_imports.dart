import 'dart:io';

part 'code_optimizer.dart';

class PipenLinterImports {
  Directory directory;

  PipenLinterImports({required this.directory});

  /// Optimize imports
  void optimize() {
    directory.list(recursive: true, followLinks: false).listen((
      FileSystemEntity entity,
    ) {
      if (entity is File && entity.path.endsWith('.dart')) {
        _CodeOptimizer(file: entity).process();
      }
    });
  }
}
