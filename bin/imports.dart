import 'package:pipen/modules/linter_imports/pipen_linter_imports.dart';
import 'dart:io';

void main(List<String> args) {
  stdout.writeln('Optimizing imports, wait a moment... 🗃️ ');
  Directory directory = Directory('lib');
  PipenLinterImports linterImports = PipenLinterImports(directory: directory);
  linterImports.optimize();
  stdout.writeln('Imports optimized successful ✅ ');
}
