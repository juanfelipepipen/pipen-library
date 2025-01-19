import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart';
import 'package:mime/mime.dart';

extension PlatformFileExtension on PlatformFile {
  /// [Getter] Multipart file
  Future<MultipartFile> multipartFile(String field) async {
    String mediaType = lookupMimeType(path!)!;
    return await MultipartFile.fromPath(field, path!, contentType: MediaType.parse(mediaType));
  }
}
