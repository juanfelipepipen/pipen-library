import 'package:http/http.dart';
import 'package:mime/mime.dart';
import 'dart:io';

extension PipenFileExtension on File {
  /// Multipart file
  Future<MultipartFile> multipartFile(String field) async {
    String mediaType = lookupMimeType(path)!;
    return await MultipartFile.fromPath(field, path, contentType: MediaType.parse(mediaType));
  }
}
