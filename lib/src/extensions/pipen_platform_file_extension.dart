import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';
import 'package:mime/mime.dart';

extension PipenPlatformFileExtension on PlatformFile {
  /// [Getter] Multipart file
  Future<MultipartFile> multipartFile(String field, {bool fromBytes = false}) async {
    if (fromBytes) {
      return multipartFromBytes(field);
    }

    String mediaType = lookupMimeType(path!)!;
    return await MultipartFile.fromPath(field, path!, contentType: MediaType.parse(mediaType));
  }

  /// Create a Multipart from file bytes
  MultipartFile multipartFromBytes(String field) {
    String? mediaType;

    if (extension case String extension) {
      mediaType = lookupMimeType('file.$extension');
    }

    mediaType ??= lookupMimeType(field, headerBytes: bytes);

    if (mediaType == null) {
      throw Exception('MIME type not found');
    }

    if (bytes == null) {
      throw Exception('File bytes empty');
    }

    return MultipartFile.fromBytes(
      field,
      bytes!,
      filename: name,
      contentType: MediaType.parse(mediaType),
    );
  }
}
