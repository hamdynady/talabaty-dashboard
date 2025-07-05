import 'package:flutter/material.dart';
import 'package:talabaty_dashboard/features/dashboard/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    return const DashboardViewBody();
  }
}
