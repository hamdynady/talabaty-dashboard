import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:talabaty_dashboard/core/errors/failures.dart';
import 'package:talabaty_dashboard/core/repos/image_repos/image_repo.dart';
import 'package:talabaty_dashboard/core/services/storage_service.dart';
import 'package:talabaty_dashboard/core/utIls/backend_endpoint.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storagegeService;

  ImageRepoImpl({required this.storagegeService});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String imageUrl = await storagegeService.uploadFile(
        BackendEndpoint.imagesPath,
        image,
      );
      return Right(imageUrl);
    } catch (e) {
      return Left(Failure('failed to upload image'));
    }
  }
}
