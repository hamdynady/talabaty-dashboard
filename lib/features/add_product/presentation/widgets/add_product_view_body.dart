import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabaty_dashboard/core/helper_functions/build_error_bar.dart';
import 'package:talabaty_dashboard/core/utIls/app_colors.dart';
import 'package:talabaty_dashboard/core/widgets/custom_button.dart';
import 'package:talabaty_dashboard/core/widgets/custom_check_box.dart';
import 'package:talabaty_dashboard/core/widgets/custom_text_field.dart';
import 'package:talabaty_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:talabaty_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:talabaty_dashboard/features/add_product/presentation/widgets/image_flield.dart';

/// A widget that provides the UI and logic for adding a new product.
///
/// Includes a form for entering product details, selecting an image, and marking as featured.
class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  /// Key to manage the form state and validation.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Controls when to show validation errors.
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  /// Whether the product is featured.
  late bool isFeatured = false;

  /// Product name.
  late String name, discription, code;

  /// Product price.
  late num price;

  /// Product amount in stock.
  late num amount;

  /// Selected image file for the product.
  File? image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 16,
            children: [
              // Product name input field
              CustomTextFormField(
                hintText: 'Product name',
                onSaved: (value) {
                  name = value!;
                },
                textInputType: TextInputType.text,
              ),
              // Product price input field
              CustomTextFormField(
                hintText: 'Product Price',
                onSaved: (value) {
                  price = num.parse(value!);
                },
                textInputType: TextInputType.number,
              ),
              // Product code input field
              CustomTextFormField(
                hintText: 'Product code',
                onSaved: (value) {
                  code = value!;
                },
                textInputType: TextInputType.number,
              ),
              // Product amount input field
              CustomTextFormField(
                hintText: 'Product Amount',
                onSaved: (value) {
                  amount = num.parse(value!);
                },
                textInputType: TextInputType.number,
              ),
              // Product description input field
              CustomTextFormField(
                hintText: 'Product Discription',
                onSaved: (value) {
                  discription = value!;
                },
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              // Checkbox to mark product as featured
              CustomCheckBox(
                onChecked: (value) {
                  setState(() {
                    isFeatured = value;
                  });
                },
                isChecked: isFeatured,
              ),
              // Image picker field
              ImageField(
                onImageChanged: (valueKey) {
                  setState(() {
                    image = valueKey;
                  });
                },
              ),
              // Button to submit the form and add the product
              CustomButton(
                onPressed: () {
                  // Ensure an image is selected before submitting
                  if (image != null) {
                    // Validate the form fields
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      // Create a ProductEntity from the form data
                      ProductEntity inputProduct = ProductEntity(
                        name: name,
                        discription: discription,
                        code: code,
                        price: price,
                        isFeatured: isFeatured,
                        image: image!,
                        amount: amount.toInt(),
                        reviews: [],
                      );
                      // Trigger the cubit to add the product
                      context.read<AddProductCubit>().addProduct(inputProduct);
                    } else {
                      // Show validation errors if form is invalid
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    // Show error if no image is selected
                    buildBar(context, ' Please select an image');
                  }
                },
                text: 'Add Product',
                width: .5,
                backgroundcolor: AppColors.primaryColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
