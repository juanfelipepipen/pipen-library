class PipenTranslationFileGenerator {
  PipenTranslationFileGenerator(this.translations);

  Map<String, dynamic> translations;

  String outputFile(String varName) => '\nstatic Translation $varName = Translation($mapStr);\n';

  String get mapStr => '{${mapToStr()}\n}';

  String mapToStr() {
    String output = '';
    translations.forEach((key, value) {
      output += '\n"$key":"$value",';
    });
    return output;
  }
}
