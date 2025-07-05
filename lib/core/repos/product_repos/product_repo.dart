import 'package:dartz/dartz.dart';
import 'package:talabaty_dashboard/core/errors/failures.dart';
import 'package:talabaty_dashboard/features/add_product/domain/entities/product_entity.dart';

abstract class AddProductRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity product);
}
