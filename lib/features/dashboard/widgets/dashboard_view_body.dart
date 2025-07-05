import 'package:flutter/material.dart';
import 'package:talabaty_dashboard/core/utIls/app_colors.dart';
import 'package:talabaty_dashboard/core/utIls/app_text_styles.dart';
import 'package:talabaty_dashboard/core/widgets/custom_button.dart';
import 'package:talabaty_dashboard/features/add_product/presentation/views/add_product_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, AddProductView.routeName);
              },
              text: 'Add Data',
              width: 1,
              textStyle: TextStyles.semiBold16.copyWith(color: Colors.white),
              backgroundcolor: AppColors.primaryColor,
              textColor: Colors.white,
            ),
        ),
      ),
    );
  }
}
