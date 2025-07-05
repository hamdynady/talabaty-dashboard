abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });
  Future<dynamic> getData({required String path});

  Future<bool> checkIfDataExists({required String path});
}
