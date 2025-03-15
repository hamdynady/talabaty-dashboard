import 'package:flutter/material.dart';
import 'package:talabaty_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:talabaty_dashboard/features/dashboard/views/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talabaty Dashboard',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
    );
  }
}
