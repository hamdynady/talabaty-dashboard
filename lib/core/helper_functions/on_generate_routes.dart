import 'package:flutter/material.dart';
import 'package:talabaty_dashboard/features/dashboard/views/dashboard.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => DashboardView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
