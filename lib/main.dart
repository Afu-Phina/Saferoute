// ------------------------------------------------------------
// IMPORTS
// ------------------------------------------------------------

// Import Material package which provides Flutter UI components and Material Design system
import 'package:flutter/material.dart';
// Import the WelcomeScreen widget from the screens folder to use it as the home screen
import 'screens/welcome_screen.dart';

// main() is the entry point of every Dart/Flutter application
void main() {
  // runApp() initializes the Flutter framework and builds the widget tree
  // It takes a widget (SafeRoadApp) and makes it the root of the app
  runApp(const SafeRoadApp());
}

// SafeRoadApp is the root widget of the entire application
// It extends StatelessWidget because it doesn't manage any mutable state
class SafeRoadApp extends StatelessWidget {
  // Constructor with super.key for proper widget management in the widget tree
  const SafeRoadApp({super.key});

  // Build method is called to create the UI of this widget
  @override
  Widget build(BuildContext context) {
    // MaterialApp is the top-level widget that wraps the entire app
    // It provides Material Design styling and navigation
    return MaterialApp(
      // debugShowCheckedModeBanner: false removes the red DEBUG banner from top-right corner
      debugShowCheckedModeBanner: false,
      // title: the name of the app shown in recent apps and device UI
      title: 'SafeRoad',
      // theme: defines the visual design (colors, fonts, button styles, etc.) for the app
      theme: ThemeData(
        // primarySwatch: the primary color palette used throughout the app (blue)
        primarySwatch: Colors.blue
      ),
      // home: the first screen displayed when the app starts (WelcomeScreen)
      home: const WelcomeScreen(),
    );
  }
}