import 'dart:io';

abstract class StorageService {
  Future<String> uploadFile(String path, File file);
}
