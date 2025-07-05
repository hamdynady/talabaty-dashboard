import 'package:cloud_firestore/cloud_firestore.dart';
import 'data_service.dart';
// import 'data_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Helper to split path into collection and optional documentId
  (CollectionReference, String?) _parsePath(String path) {
    final parts = path.split('/');
    if (parts.length == 1) {
      return (firestore.collection(parts[0]), null);
    } else if (parts.length == 2) {
      return (firestore.collection(parts[0]), parts[1]);
    } else {
      throw ArgumentError(
        'Path must be in the form "collection" or "collection/documentId"',
      );
    }
  }

  @override
  /// Adds data to a Firestore collection at the specified path.
  /// If a documentId is provided, the data is set to that document.
  /// Otherwise, a new document is created with the provided data.
  ///
  /// Parameters:
  /// - `path`: The path to the Firestore collection.
  /// - `data`: The data to be added as a map of key-value pairs.
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final (collection, documentId) = _parsePath(path);
    if (documentId != null) {
      await collection.doc(documentId).set(data);
    } else {
      await collection.add(data);
    }
  }

  @override
  Future<dynamic> getData({required String path}) async {
    final (collection, documentId) = _parsePath(path);
    if (documentId != null) {
      var data = await collection.doc(documentId).get();
      return data.data();
    }
    // If only collection is provided, return all documents
    var snapshot = await collection.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<bool> checkIfDataExists({required String path}) async {
    final (collection, documentId) = _parsePath(path);
    if (documentId != null) {
      var data = await collection.doc(documentId).get();
      return data.exists;
    }
    // If only collection is provided, check if any documents exist
    var snapshot = await collection.limit(1).get();
    return snapshot.docs.isNotEmpty;
  }
}

// NOTE: Make sure to add cloud_firestore to your pubspec.yaml dependencies if not already present.
