import 'package:pipen/translations/pipen_translation_file_generator.dart';
import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  String jsonContent = File('assets/locale/l10n/app_mx_es.json').readAsStringSync();
  Map<String, dynamic> translations = jsonDecode(jsonContent);

  String generatedFile = r'''
import 'package:pipen/translations/translation.dart';
class Translations {''';

  stdout.writeln('Generating translations... 🪄 ');

  translations.forEach((key, value) {
    if (value is Map<String, dynamic>) {
      generatedFile += PipenTranslationFileGenerator(value).outputFile(key);
    }
  });

  final file = File('lib/generated/translations.dart');
  generatedFile += '}';
  file.writeAsStringSync(generatedFile);

  stdout.writeln('Translations generated ✅ ');
}
