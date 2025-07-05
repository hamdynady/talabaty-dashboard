import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabaty_dashboard/core/repos/image_repos/image_repo.dart';
import 'package:talabaty_dashboard/core/repos/product_repos/product_repo.dart';
import 'package:talabaty_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:talabaty_dashboard/features/add_product/presentation/manager/cubit/add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.addProductRepo, this.imageRepo)
    : super(AddProductInitialState());
  final AddProductRepo addProductRepo;
  final ImageRepo imageRepo;
  Future<void> addProduct(ProductEntity product) async {
    emit(AddProductLoadingState());
    var imageUrl = await imageRepo.uploadImage(product.image);
    imageUrl.fold(
      (f) {
        emit(AddProductFailureState(message: f.message));
      },
      (url) async {
        product.imageUrl = url;
        var result = await addProductRepo.addProduct(product);
        result.fold(
          (f) {
            emit(AddProductFailureState(message: f.message));
          },
          (r) {
            emit(AddProductSuccessState());
          },
        );
      },
    );
  }
}
