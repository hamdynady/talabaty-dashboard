import 'package:flutter/material.dart';
import 'package:talabaty_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:talabaty_dashboard/features/dashboard/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => AddProductView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
