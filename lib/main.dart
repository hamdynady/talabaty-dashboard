// Entry point for the Talabaty Dashboard Flutter application.
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabaty_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:talabaty_dashboard/core/services/custom_bloc_observer.dart';
import 'package:talabaty_dashboard/core/services/get_it_service.dart';
import 'package:talabaty_dashboard/core/services/shared_preferences_singleton.dart';
import 'package:talabaty_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:talabaty_dashboard/firebase_options.dart';

/// The main function is the entry point of the app.
/// It ensures necessary services and plugins are initialized before running the app.
void main() async {
  // Ensures Flutter engine and plugins are initialized.
  WidgetsFlutterBinding.ensureInitialized();
  // Sets up a custom Bloc observer for debugging and logging Bloc events.
  Bloc.observer = CustomBlocObserver();
  // Initializes Firebase with platform-specific options.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Initializes shared preferences singleton for persistent storage.
  await Prefs.init();
  // Sets up dependency injection using get_it.
  setupGetit();
  // Runs the root widget of the app.
  runApp(MyApp());
}

/// The root widget of the Talabaty Dashboard application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner.
      title: 'Talabaty Dashboard', // App title.
      theme: ThemeData.light(useMaterial3: false), // Sets the app theme.
      onGenerateRoute:
          onGenerateRoute, // Handles route generation for navigation.
      initialRoute:
          DashboardView
              .routeName, // Sets the initial screen to the dashboard view.
    );
  }
}
