import 'package:dartz/dartz.dart';
import 'package:talabaty_dashboard/core/errors/failures.dart';
import 'package:talabaty_dashboard/core/repos/product_repos/product_repo.dart';
import 'package:talabaty_dashboard/core/services/data_service.dart';
import 'package:talabaty_dashboard/core/utIls/backend_endpoint.dart';
import 'package:talabaty_dashboard/features/add_product/data/models/product_model.dart';
import 'package:talabaty_dashboard/features/add_product/domain/entities/product_entity.dart';

class AddProductRepoImpl implements AddProductRepo {
  final DatabaseService databaseService;

  AddProductRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, void>> addProduct(ProductEntity product) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.productsPath,
        data: ProductModel.fromEntity(product).toMap(),
      );
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure('Failed to add product: $e'));
    }
  }
}
