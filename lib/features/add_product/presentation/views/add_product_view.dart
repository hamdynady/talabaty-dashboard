import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabaty_dashboard/core/repos/image_repos/image_repo.dart';
import 'package:talabaty_dashboard/core/repos/product_repos/product_repo.dart';
import 'package:talabaty_dashboard/core/services/get_it_service.dart';
import 'package:talabaty_dashboard/core/utils/app_text_styles.dart';
import 'package:talabaty_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:talabaty_dashboard/features/add_product/presentation/widgets/add_product_view_body_bloc_consumer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = '/add-product';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Add Product',
            style: TextStyles.semiBold16.copyWith(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),

        body: BlocProvider(
          create:
              (context) => AddProductCubit(
                getIt.get<AddProductRepo>(),
                getIt.get<ImageRepo>(),
              ),
          child: AddProductViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
