part of 'pipen_linter_imports.dart';

class _CodeOptimizer {
  File file;

  _CodeOptimizer({required this.file});

  Future<void> process() async {
    List<String> lines = await file.readAsLines();
    List<String> imports = [];

    for (String line in lines) {
      if (line.startsWith('import')) {
        imports.add(line);
      }
    }

    List<String> importOrders = List.from(imports)
      ..sort((a, b) => b.length.compareTo(a.length));

    if (importOrders != imports) {
      for (String import in importOrders) {
        lines[importOrders.indexOf(import)] = import;
      }

      IOSink writer = file.openWrite();
      writer.write('${lines.join('\n')}\n');
      await writer.close();
    }
  }
}
