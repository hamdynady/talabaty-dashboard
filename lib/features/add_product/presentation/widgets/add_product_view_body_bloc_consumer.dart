import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:talabaty_dashboard/core/helper_functions/build_error_bar.dart';
import 'package:talabaty_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:talabaty_dashboard/features/add_product/presentation/manager/cubit/add_product_state.dart';
import 'package:talabaty_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccessState) {
          buildBar(context, 'Product Added Successfully', color: Colors.green);
          Navigator.pop(context);
        }
        if (state is AddProductFailureState) {
          buildBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoadingState,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
