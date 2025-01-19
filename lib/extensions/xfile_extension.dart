import 'package:http_parser/http_parser.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:mime/mime.dart';

extension XFileExtension on XFile {
  /// [Getter] Multipart file
  Future<MultipartFile> multipartFile(String field) async {
    String mediaType = lookupMimeType(path)!;
    return await MultipartFile.fromPath(field, path, contentType: MediaType.parse(mediaType));
  }
}
