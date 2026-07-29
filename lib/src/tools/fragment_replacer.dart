class FragmentReplacer {
  FragmentReplacer({required this.document, required this.variables});

  final String document;
  final Map<String, String> variables;

  @override
  String toString() {
    final regex = RegExp(r'\[\[(.*?)\]\]');
    return document.replaceAllMapped(regex, (match) {
      final key = match.group(1);
      return variables[key] ?? match.group(0)!;
    });
  }
}
