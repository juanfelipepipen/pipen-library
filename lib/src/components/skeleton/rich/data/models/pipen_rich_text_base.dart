part of '../../pipen_text_rich_skeleton.dart';

sealed class PipenTextRichBase {}

class PipenTextSpaceRich extends PipenTextRichBase {}

class PipenTextRich extends PipenTextRichBase {
  PipenTextRich({required this.text, this.hint, this.style});

  final String? text, hint;
  final TextStyle? style;

  static PipenTextSpaceRich space() => PipenTextSpaceRich();
}