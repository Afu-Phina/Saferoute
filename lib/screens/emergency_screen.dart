// Import the Flutter Material Design package for UI widgets.
import 'package:flutter/material.dart';

// EmergencyScreen is a StatefulWidget - a widget that can change its appearance over time.
// StatefulWidget is used here because we need to track the loading state of the button.
class EmergencyScreen extends StatefulWidget {
  // Constructor with a required 'key' parameter for widget identification.
  const EmergencyScreen({super.key});

  // This method creates the mutable state for this widget.
  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

// _EmergencyScreenState is the mutable state class that manages the widget's data.
// The underscore (_) means this class is private to this file.
class _EmergencyScreenState extends State<EmergencyScreen> {
  // Boolean variable to track whether the alert is being sent (loading state).
  // 'bool' stands for boolean - a data type that is either true or false.
  bool _isLoading = false;

  // This function is called when the user presses the "Send Emergency Alert" button.
  // 'Future<void>' means this function runs asynchronously (takes time) and returns nothing.
  // 'async' allows us to use 'await' to pause execution until a task completes.
  Future<void> _sendAlert() async {
    // Update the UI state - set _isLoading to true to show the loading spinner.
    // setState() tells Flutter to rebuild the widget with new data.
    setState(() {
      _isLoading = true;
    });

    // 'await' pauses execution for 2 seconds (2000 milliseconds).
    // This simulates the time it takes to send an alert.
    // Duration(seconds: 2) creates a time span of 2 seconds.
    await Future.delayed(const Duration(seconds: 2));

    // After 2 seconds, check if the widget is still mounted (exists in the widget tree).
    // This prevents errors if the user left the screen before the delay finished.
    if (!mounted) return;

    // Show a confirmation message using an AlertDialog (popup window).
    // AlertDialog requires a BuildContext, which we get from the widget's context.
    showDialog(
      // 'context' is the location in the widget tree where this dialog will appear.
      context: context,
      // 'builder' is a function that creates the dialog's content.
      builder: (BuildContext context) {
        // AlertDialog is a material design popup window.
        return AlertDialog(
          // 'title' is the heading text of the dialog.
          title: const Text('Alert Sent'),
          // 'content' is the main message displayed in the dialog.
          content: const Text('Emergency alert sent. Campus security has been notified.'),
          // 'actions' is a list of buttons at the bottom of the dialog.
          actions: [
            // ElevatedButton is a clickable button with a raised appearance.
            ElevatedButton(
              // 'onPressed' is a callback function that runs when the button is tapped.
              // Navigator.pop(context) closes the dialog and returns to the previous screen.
              onPressed: () {
                Navigator.pop(context);
              },
              // 'child' is the button's label text.
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    // After the dialog is closed, update the UI state.
    // Check 'mounted' again to ensure the widget still exists.
    if (mounted) {
      setState(() {
        // Set _isLoading back to false to hide the loading spinner.
        _isLoading = false;
      });
    }
  }

  // The build method creates the UI for this widget.
  // It returns a Widget that describes what the screen looks like.
  @override
  Widget build(BuildContext context) {
    // Scaffold is a material design layout structure with AppBar, body, etc.
    return Scaffold(
      // 'appBar' is the top bar of the screen that typically contains a title.
      appBar: AppBar(
        // Set the title text displayed in the app bar.
        title: const Text('Emergency Alert'),
        // 'backgroundColor' sets the color of the app bar.
        backgroundColor: Colors.blue,
      ),
      // 'body' is the main content area of the screen.
      // Container allows us to add a background image to the entire body.
      body: Container(
        // 'decoration' customizes the appearance of the container (background, border, etc).
        decoration: const BoxDecoration(
          // 'image' adds a background image to the container.
          image: DecorationImage(
            // 'image' specifies the image source - AssetImage loads from the assets folder.
            // This uses 'road_bg.jpg.jpg' from the assets/images folder.
            image: AssetImage('assets/images/road_bg.jpg.jpg'),
            // 'fit' controls how the image is displayed.
            // BoxFit.cover makes the image fill the entire screen while maintaining aspect ratio.
            fit: BoxFit.cover,
          ),
        ),
        // 'child' is the widget displayed on top of the background image.
        child: Padding(
          // Padding adds empty space around its child widget (16 pixels on all sides).
          padding: const EdgeInsets.all(16.0),
          // Center centers its child widget both horizontally and vertically.
          child: Center(
            // Column arranges widgets vertically (top to bottom).
            child: Column(
              // 'mainAxisAlignment' aligns children along the main axis (vertical for Column).
              // MainAxisAlignment.center centers widgets vertically.
              mainAxisAlignment: MainAxisAlignment.center,
              // 'children' is a list of widgets to display in the column.
              children: [
                // Container with semi-transparent background to make text readable over the image.
                Container(
                  // 'padding' adds internal spacing around the text inside this container.
                  padding: const EdgeInsets.all(16.0),
                  // 'decoration' customizes the appearance of this container.
                  decoration: BoxDecoration(
                    // 'color' sets the background color with opacity (transparency).
                    // Use Color.fromRGBO instead of withOpacity to avoid deprecation.
                    // Color.fromRGBO(255,255,255,0.9) creates white with 90% opacity.
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                    // 'borderRadius' rounds the corners of the container.
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // 'child' is the text widget inside this container.
                  child: const Text(
                    // The explanation message explaining what this feature does.
                    'This feature allows you to alert campus security in emergencies.\n'
                    'Press the button below to send an alert.',
                    // 'textAlign' centers the text horizontally.
                    textAlign: TextAlign.center,
                    // 'style' customizes the appearance of the text.
                    style: TextStyle(
                      // 'fontSize' sets the size of the text in logical pixels.
                      fontSize: 16,
                      // 'color' sets the text color.
                      color: Colors.black87,
                    ),
                  ),
                ),
                // SizedBox adds vertical spacing (24 pixels) between widgets.
                const SizedBox(height: 24),
                // ElevatedButton is a clickable button with elevation (3D effect).
                ElevatedButton(
                  // 'onPressed' is the callback function when the button is tapped.
                  // If _isLoading is true, set onPressed to null to disable the button.
                  // This prevents multiple rapid taps while loading.
                  onPressed: _isLoading ? null : _sendAlert,
                  // 'style' customizes the button's appearance.
                  style: ElevatedButton.styleFrom(
                    // 'backgroundColor' sets the button's fill color to red.
                    backgroundColor: Colors.red,
                    // 'padding' adds internal spacing around the button's label.
                    // EdgeInsets.symmetric creates equal padding on opposite sides.
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32, // left and right padding
                      vertical: 16,   // top and bottom padding
                    ),
                    // 'minimumSize' sets the button to fill the width.
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  // 'child' is the button's content.
                  // Ternary operator: if _isLoading is true, show spinner; otherwise show text.
                  child: _isLoading
                      // CircularProgressIndicator shows a spinning loading animation.
                      ? const CircularProgressIndicator(
                          // 'valueColor' sets the color of the spinner to white.
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      // If not loading, display the button text.
                      : const Text(
                          'Send Emergency Alert',
                          // 'style' customizes the button text appearance.
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                // SizedBox adds vertical spacing (16 pixels) below the button.
                const SizedBox(height: 16),
                // Container with semi-transparent background for the disclaimer text.
                Container(
                  // 'padding' adds internal spacing around the text inside this container.
                  padding: const EdgeInsets.all(12.0),
                  // 'decoration' customizes the appearance of this container.
                  decoration: BoxDecoration(
                    // 'color' sets the background color with opacity (transparency).
                    // Use Color.fromRGBO instead of withOpacity to avoid deprecation.
                    // Color.fromRGBO(255,255,255,0.85) creates white with 85% opacity.
                    color: Color.fromRGBO(255, 255, 255, 0.85),
                    // 'borderRadius' rounds the corners of the container.
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // 'child' is the text widget inside this container.
                  child: const Text(
                    'Do not misuse this feature. False alerts may result in consequences.',
                    textAlign: TextAlign.center,
                    // TextStyle customizes the appearance of this disclaimer text.
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}