// Import the Material package which provides Flutter UI components like Scaffold, AppBar, etc.
import 'package:flutter/material.dart';
// Import AboutScreen to enable navigation to the About page
import 'about_screen.dart';
// Import destination screens so we can navigate to them when feature cards are tapped
import 'emergency_screen.dart';
import 'tips_screen.dart';
import 'routes_screen.dart';

// Define the HomeScreen class as a StatelessWidget (no state changes)
class HomeScreen extends StatelessWidget {
  // Constructor with super.key parameter
  const HomeScreen({super.key});

  @override
  // Build method that returns the UI structure
  Widget build(BuildContext context) {
    // Scaffold provides the basic Material Design structure (AppBar, body, etc.)
    return Scaffold(
      // AppBar displays a header at the top of the screen
      appBar: AppBar(
        // Title text displayed in the AppBar
        title: const Text('SafeRoad Dashboard'),
        // Center the title text
        centerTitle: true,
        // Set elevation to create a shadow effect
        elevation: 0,
        // actions is a list of buttons displayed on the right side of AppBar
        actions: [
          // IconButton for navigating to About page
          IconButton(
            // icon: the icon to display
            icon: const Icon(Icons.info),
            // tooltip: text shown when long-pressed
            tooltip: 'About SafeRoad',
            // onPressed: callback when button is tapped
            onPressed: () {
              // Navigator.push adds About screen to navigation stack
              Navigator.of(context).push(
                // MaterialPageRoute animates the navigation
                MaterialPageRoute(
                  // builder creates the About screen
                  builder: (_) => const AboutScreen(),
                ),
              );
            },
          ),
        ],
      ),
      // Body is the main content area of the screen
      // Use a Stack so we can render a decorative background behind the content
      body: Stack(
        children: [
          // Gradient background fills the screen
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade50,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          // Decorative soft circle (top-right)
          Positioned(
            top: -80,
            right: -60,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                // Use Color.fromRGBO to avoid deprecated withOpacity on Colors.blue
                color: Color.fromRGBO(33, 150, 243, 0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Decorative soft circle (bottom-left)
          Positioned(
            bottom: -100,
            left: -80,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                // Use Color.fromRGBO to avoid deprecated withOpacity on Colors.orange
                color: Color.fromRGBO(255, 152, 0, 0.06),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Main scrollable content above the background
          SingleChildScrollView(
            // Padding adds space around the entire body content
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            // Column arranges widgets vertically
            child: Column(
          // Align content to the start (top) of the column
          crossAxisAlignment: CrossAxisAlignment.start,
          // List of widgets to display in the column
          children: [
            // Welcome message section
            // Text widget that displays a greeting message
            Text(
              // The welcome text
              'Welcome Back, User!',
              // TextStyle defines how the text looks
              style: TextStyle(
                // Set the font size
                fontSize: 24,
                // Make the text bold
                fontWeight: FontWeight.bold,
                // Set text color to a darker shade
                color: Colors.black87,
              ),
            ),
            // Add vertical spacing between widgets
            const SizedBox(height: 8),
            // Subtitle text explaining the app
            Text(
              // Description text
              'Your safety companion for smarter, safer journeys',
              // TextStyle for the subtitle
              style: TextStyle(
                // Smaller font size than heading
                fontSize: 14,
                // Light gray color for secondary text
                color: Colors.grey[600],
              ),
            ),
            // Add vertical spacing before feature cards
            const SizedBox(height: 24),
            // Feature Cards Section
            // Text widget for section heading
            Text(
              // Heading for the features section
              'Quick Features',
              // TextStyle for the section heading
              style: TextStyle(
                // Font size for heading
                fontSize: 18,
                // Make heading bold
                fontWeight: FontWeight.bold,
                // Dark color for the heading
                color: Colors.black87,
              ),
            ),
            // Add spacing between heading and cards
            const SizedBox(height: 12),
            // Feature Card 1: Emergency Alert
            // Provide an onTap callback directly to the card so it handles taps reliably
            _FeatureCard(
              // The function to run when the card is tapped: navigate to EmergencyScreen
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const EmergencyScreen())),
              // Icon displayed in the card (emergency icon)
              icon: Icons.emergency,
              // Title of the feature
              title: 'Emergency Alert',
              // Description of the feature
              description: 'Send instant alerts to your emergency contacts',
              // Color scheme for the card
              color: Colors.red,
            ),
            // Add spacing between cards
            const SizedBox(height: 12),
            // Feature Card 2: Safety Tips
            // Provide onTap to open TipsScreen when tapped
            _FeatureCard(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TipsScreen())),
              // Icon displayed in the card (lightbulb icon)
              icon: Icons.lightbulb,
              // Title of the feature
              title: 'Safety Tips',
              // Description of the feature
              description: 'Get real-time tips for safer driving',
              // Color scheme for the card
              color: Colors.orange,
            ),
            // Add spacing between cards
            const SizedBox(height: 12),
            // Feature Card 3: Safe Routes
            // Provide onTap to open RoutesScreen when tapped
            _FeatureCard(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RoutesScreen())),
              // Icon displayed in the card (map icon)
              icon: Icons.map,
              // Title of the feature
              title: 'Safe Routes',
              // Description of the feature
              description: 'Find the safest routes to your destination',
              // Color scheme for the card
              color: Colors.blue,
            ),
            // Add spacing between cards
            const SizedBox(height: 12),
            // Feature Card 4: About (placed on the dashboard as a card)
            _FeatureCard(
              // When tapped, navigate to the About screen
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AboutScreen())),
              // Icon displayed in the card (info icon)
              icon: Icons.info,
              // Title of the feature
              title: 'About',
              // Description of the feature
              description: 'Learn more about SafeRoad and its mission',
              // Color scheme for the card
              color: Colors.green,
            ),
          ],
        ),
      ),
    ],
  ),
);
  }
}

// Custom widget for feature cards - a reusable card component
class _FeatureCard extends StatelessWidget {
  // Icon for the card (IconData type)
  final IconData icon;
  // Title text for the card
  final String title;
  // Description text for the card
  final String description;
  // Color theme for the card
  final Color color;
  // Optional callback when the card is tapped. If provided, the card becomes interactive.
  final VoidCallback? onTap;

  // Constructor that takes all required parameters
  const _FeatureCard({
    // icon parameter is required
    required this.icon,
    // title parameter is required
    required this.title,
    // description parameter is required
    required this.description,
    // color parameter is required
    required this.color,
    // onTap is optional
    this.onTap,
  });

  @override
  // Build method to create the card UI
  Widget build(BuildContext context) {
    // Card widget provides a Material Design card style
    return Card(
      // elevation creates a shadow effect for depth
      elevation: 3,
      // shape defines the border radius and appearance
      shape: RoundedRectangleBorder(
        // borderRadius creates rounded corners
        borderRadius: BorderRadius.circular(12),
      ),
      // InkWell provides the ripple effect when the card is tapped.
      child: InkWell(
        // onTap is the callback provided by the caller; if null, card is not interactive.
        onTap: onTap ?? () {
          // Default behavior: show a snackbar that the feature is coming soon.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title - Feature coming soon'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        // Container holds the card content
        child: Container(
          // padding adds internal spacing
          padding: const EdgeInsets.all(16),
          // decoration adds background and styling
              decoration: BoxDecoration(
            // borderRadius matches the card shape
            borderRadius: BorderRadius.circular(12),
            // gradient creates a colored background
            gradient: LinearGradient(
              // colors defines the gradient colors
              colors: [
                // Start color (lighter shade of main color)
                // Use withAlpha to set opacity on a dynamic Color variable.
                color.withAlpha((0.8 * 255).round()),
                // End color (more transparent)
                color.withAlpha((0.4 * 255).round()),
              ],
              // begin sets where gradient starts
              begin: Alignment.topLeft,
              // end sets where gradient ends
              end: Alignment.bottomRight,
            ),
          ),
          // Row arranges icon and text horizontally
          child: Row(
            // crossAxisAlignment aligns items vertically in the row
            crossAxisAlignment: CrossAxisAlignment.start,
            // children list of widgets in the row
            children: [
              // Icon widget displaying the card icon
              Icon(
                // The icon to display
                icon,
                // Icon size
                size: 40,
                // Icon color (white for contrast)
                color: Colors.white,
              ),
              // Add horizontal spacing between icon and text
              const SizedBox(width: 16),
              // Expanded widget makes the text area flexible
              Expanded(
                // Column arranges title and description vertically
                child: Column(
                  // crossAxisAlignment aligns text to start
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // children list of text widgets
                  children: [
                    // Title text
                    Text(
                      // The title value
                      title,
                      // TextStyle for the title
                      style: const TextStyle(
                        // Font size for title
                        fontSize: 16,
                        // Make title bold
                        fontWeight: FontWeight.bold,
                        // White color for visibility
                        color: Colors.white,
                      ),
                    ),
                    // Add spacing between title and description
                    const SizedBox(height: 4),
                    // Description text
                    Text(
                      // The description value
                      description,
                      // TextStyle for the description
                      style: const TextStyle(
                        // Font size for description
                        fontSize: 12,
                        // Light color for secondary text
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
