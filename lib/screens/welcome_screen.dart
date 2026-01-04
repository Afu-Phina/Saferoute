// Import Material package for Flutter UI components (buttons, text, containers, etc.)
import 'package:flutter/material.dart';
// Import the LoginScreen from another file to enable navigation
import 'login_screen.dart';

// Define WelcomeScreen as a StatelessWidget (no internal state changes)
class WelcomeScreen extends StatelessWidget {
  // Constructor with super.key for proper widget management
  const WelcomeScreen({super.key});

  // Override the build method to create the UI
  @override
  // BuildContext provides context about the widget tree
  Widget build(BuildContext context) {
    // Scaffold is the main layout structure that provides AppBar, body, etc.
    return Scaffold(
      // body is the main content area of the scaffold
      body: Stack(
        // Stack allows widgets to overlap on top of each other
        children: [
          // Positioned.fill makes the image fill the entire stack area
          Positioned.fill(
            // child is the widget to position (the background image)
            child: Image.asset(
              // Load image asset from the assets folder
              'assets/images/road_bg.jpg.jpg',
              // BoxFit.cover makes the image cover the entire area while maintaining aspect ratio
              fit: BoxFit.cover,
            ),
          ),
          // Another Positioned.fill widget for the overlay gradient
          Positioned.fill(
            // Container holds the gradient decoration
            child: Container(
              // decoration provides styling like background gradients, colors, etc.
              decoration: BoxDecoration(
                // LinearGradient creates a smooth gradient effect
                gradient: LinearGradient(
                  // colors array defines the gradient colors
                  colors: [
                    // First color with 45% opacity (darker at bottom)
                    Color.fromRGBO(0, 0, 0, 0.45),
                    // Second color with 15% opacity (lighter at top)
                    Color.fromRGBO(0, 0, 0, 0.15)
                  ],
                  // begin: where gradient starts (bottom of screen)
                  begin: Alignment.bottomCenter,
                  // end: where gradient ends (top of screen)
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          // Center widget positions content in the middle of the screen
          Center(
            // Padding adds space around the child widget (28 pixels on left and right)
            child: Padding(
              // EdgeInsets.symmetric adds padding on left and right sides equally
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              // Column arranges child widgets vertically (top to bottom)
              child: Column(
                // mainAxisSize.min makes column only take up the space it needs (not full height)
                mainAxisSize: MainAxisSize.min,
                // children is a list of widgets to display in the column
                children: [
                  // Container is a basic widget that can hold other widgets and apply styling
                  Container(
                    // padding adds space inside the container (18 pixels on all sides)
                    padding: const EdgeInsets.all(18.0),
                    // decoration provides styling for the container (colors, borders, shadows, etc.)
                    decoration: BoxDecoration(
                      // color: white background with 95% opacity (slightly transparent)
                      color: Color.fromRGBO(255, 255, 255, 0.95),
                      // shape: makes the container circular (perfect circle)
                      shape: BoxShape.circle,
                      // boxShadow creates a shadow effect for depth
                      boxShadow: [
                        // BoxShadow defines shadow properties
                        BoxShadow(
                          // Shadow color (dark color)
                          color: Colors.black26,
                          // blurRadius: how soft/fuzzy the shadow is
                          blurRadius: 10,
                          // offset: position of shadow relative to the container
                          offset: Offset(0, 4)
                        ),
                      ],
                    ),
                    // child: the content inside the container (the icon)
                    child: Icon(
                      // Icon widget displays a material design icon
                      Icons.traffic,
                      // size of the icon in logical pixels
                      size: 64,
                      // color: use the app's primary color from theme
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                  // SizedBox creates vertical spacing (18 pixels of empty space)
                  const SizedBox(height: 18),
                  // Text widget displays the app name
                  const Text(
                    // The text content to display
                    'SafeRoad',
                    // style defines how text looks (font, weight, color, spacing)
                    style: TextStyle(
                      // font size in logical pixels
                      fontSize: 36,
                      // make text bold using FontWeight.bold
                      fontWeight: FontWeight.bold,
                      // text color is white
                      color: Colors.white,
                      // spacing between individual letters
                      letterSpacing: 0.8,
                    ),
                  ),
                  // Add vertical spacing of 8 pixels between title and slogan
                  const SizedBox(height: 8),
                  // Text widget displays the app slogan
                  const Text(
                    // The slogan text
                    'Safer journeys, smarter roads',
                    // style defines text appearance
                    style: TextStyle(
                      // font size
                      fontSize: 16,
                      // Colors.white70 is white with 70% opacity (lighter gray)
                      color: Colors.white70
                    ),
                    // textAlign: center aligns the text in the middle
                    textAlign: TextAlign.center,
                  ),
                  // Add vertical spacing of 28 pixels before the button
                  const SizedBox(height: 28),
                  // SizedBox constrains the button to a specific width
                  SizedBox(
                    // Set button width to 220 pixels
                    width: 220,
                    // child: the button widget
                    child: ElevatedButton(
                      // onPressed: callback function when button is tapped
                      onPressed: () {
                        // Navigator manages screen navigation in the app
                        // push() adds a new screen to the navigation stack
                        Navigator.of(context).push(
                          // MaterialPageRoute creates smooth animation during navigation
                          MaterialPageRoute(
                            // builder creates the new screen widget
                            builder: (_) => const LoginScreen()
                          )
                        );
                      },
                      // style customizes button appearance and behavior
                      style: ElevatedButton.styleFrom(
                        // padding: space inside the button (14 pixels top and bottom)
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        // shape: button border and corner style
                        shape: RoundedRectangleBorder(
                          // borderRadius: rounded corners with 30 pixel radius (very round)
                          borderRadius: BorderRadius.circular(30)
                        ),
                        // backgroundColor: button fill color (white)
                        backgroundColor: Colors.white,
                      ),
                      // child: the button text/label
                      child: Text(
                        // Button label text
                        'Get Started',
                        // style: text appearance
                        style: TextStyle(
                          // text color: app's primary color from theme
                          color: Theme.of(context).primaryColor,
                          // font size in pixels
                          fontSize: 16,
                          // make text bold using FontWeight.bold
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

