import 'package:get_it/get_it.dart';
import 'package:talabaty_dashboard/core/repos/image_repos/image_repo.dart';
import 'package:talabaty_dashboard/core/repos/image_repos/image_repo_impl.dart';
import 'package:talabaty_dashboard/core/repos/product_repos/product_repo.dart';
import 'package:talabaty_dashboard/core/repos/product_repos/product_repo_impl.dart';
import 'package:talabaty_dashboard/core/services/data_service.dart';
import 'package:talabaty_dashboard/core/services/storage_service.dart';
import 'package:talabaty_dashboard/core/services/firestorge_service.dart';
import 'package:talabaty_dashboard/core/services/firestore_service.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageService>(FirestorgeService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<ImageRepo>(
    ImageRepoImpl(storagegeService: getIt<StorageService>()),
  );
  getIt.registerSingleton<AddProductRepo>(
    AddProductRepoImpl(databaseService: getIt<DatabaseService>()),
  );
}
