import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;
import 'package:talabaty_dashboard/core/services/storage_service.dart';

class FirestorgeService implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(String path, File file) async {
    var fileName = b.basename(file.path);
    var fileExtention = b.extension(file.path);
    final fileRef = storageRef.child('$path/$fileName.$fileExtention');
    await fileRef.putFile(file);
    var fileURl = await fileRef.getDownloadURL();
    return fileURl;
  }
}
