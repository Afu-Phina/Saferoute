// Import Material package for Flutter UI components (Scaffold, AppBar, Text, etc.)
import 'package:flutter/material.dart';

// Define AboutScreen as a StatelessWidget (no mutable state needed)
class AboutScreen extends StatelessWidget {
  // Constructor with super.key for widget management
  const AboutScreen({super.key});

  // Build method creates the UI for the About screen
  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic Material Design structure (AppBar, body, etc.)
    return Scaffold(
      // AppBar displays a header at the top with title and back button
      appBar: AppBar(
        // Title text displayed in the AppBar
        title: const Text('About SafeRoad'),
        // Center align the title text
        centerTitle: true,
        // elevation creates a shadow effect under the AppBar
        elevation: 2,
      ),
      // Body contains the main scrollable content
      body: SingleChildScrollView(
        // SingleChildScrollView allows content to scroll if it exceeds screen height
        // Padding adds space around the entire content (16 pixels on sides, 24 on top/bottom)
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        // Column arranges content vertically (top to bottom)
        child: Column(
          // crossAxisAlignment aligns content to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          // children is the list of widgets to display in the column
          children: [
            // ========== WHAT IS SAFEROAD SECTION ==========
            // Heading text for the first section
            Text(
              // The section heading
              'What is SafeRoad?',
              // TextStyle defines how the text looks (font size, weight, color)
              style: TextStyle(
                // Font size in logical pixels
                fontSize: 22,
                // Make text bold for emphasis
                fontWeight: FontWeight.bold,
                // Dark color for the heading
                color: Colors.black87,
              ),
            ),
            // Add vertical spacing of 8 pixels
            const SizedBox(height: 8),
            // Description paragraph explaining what SafeRoad is
            Text(
              // The description text with detailed explanation
              'SafeRoad is an innovative mobile application designed to make every journey safer and more secure. '
              'Our mission is to empower travelers with real-time safety features, intelligent route optimization, '
              'and instant emergency response capabilities. Whether you\'re commuting to work, traveling to an unfamiliar city, '
              'or embarking on a long road trip, SafeRoad is your trusted safety companion.',
              // TextStyle for the description
              style: TextStyle(
                // Font size slightly smaller than heading
                fontSize: 15,
                // Line height for better readability (1.5 times the font size)
                height: 1.5,
                // Light gray color for secondary text
                color: Colors.grey[700],
              ),
            ),
            // Add vertical spacing before next section
            const SizedBox(height: 24),
            // ========== WHY SAFEROAD EXISTS SECTION ==========
            // Heading for the motivation section
            Text(
              // The section heading
              'Why SafeRoad Exists',
              // TextStyle for the heading
              style: TextStyle(
                // Font size
                fontSize: 22,
                // Bold text
                fontWeight: FontWeight.bold,
                // Dark text color
                color: Colors.black87,
              ),
            ),
            // Add vertical spacing
            const SizedBox(height: 8),
            // Description of why SafeRoad was created
            Text(
              // Detailed explanation of the motivation
              'Road safety is a critical global challenge. Every year, millions of people are affected by road accidents, '
              'and many of these incidents could be prevented with better awareness and faster emergency response. \n\n'
              'SafeRoad was created to address this pressing issue by combining cutting-edge technology with practical safety features. '
              'We believe that everyone deserves to travel with peace of mind, knowing they have reliable support and real-time assistance when needed. '
              'Our goal is to reduce accidents, save lives, and create a safer road environment for all travelers.',
              // TextStyle for description
              style: TextStyle(
                // Font size
                fontSize: 15,
                // Line height for readability
                height: 1.5,
                // Gray color for secondary text
                color: Colors.grey[700],
              ),
            ),
            // Add vertical spacing before next section
            const SizedBox(height: 24),
            // ========== KEY FEATURES SECTION ==========
            // Heading for features
            Text(
              // Section heading
              'Key Features',
              // TextStyle
              style: TextStyle(
                // Font size
                fontSize: 22,
                // Bold
                fontWeight: FontWeight.bold,
                // Dark color
                color: Colors.black87,
              ),
            ),
            // Add vertical spacing
            const SizedBox(height: 12),
            // Feature 1: Emergency Alert
            _buildFeatureItem(
              // Icon for this feature
              icon: Icons.emergency,
              // Title of the feature
              title: 'Emergency Alert System',
              // Description of the feature
              description: 'Instantly notify emergency contacts with your location and situation in critical moments.',
            ),
            // Add spacing between features
            const SizedBox(height: 12),
            // Feature 2: Safety Tips
            _buildFeatureItem(
              // Icon for this feature
              icon: Icons.lightbulb,
              // Title of the feature
              title: 'Real-Time Safety Tips',
              // Description of the feature
              description: 'Receive contextual safety recommendations and best practices for your current location and journey.',
            ),
            // Add spacing between features
            const SizedBox(height: 12),
            // Feature 3: Safe Routes
            _buildFeatureItem(
              // Icon for this feature
              icon: Icons.map,
              // Title of the feature
              title: 'Safe Route Recommendations',
              // Description of the feature
              description: 'Get intelligent route suggestions that balance safety, convenience, and travel time.',
            ),
            // Add spacing between features
            const SizedBox(height: 12),
            // Feature 4: Community Safety
            _buildFeatureItem(
              // Icon for this feature
              icon: Icons.group,
              // Title of the feature
              title: 'Community Safety Network',
              // Description of the feature
              description: 'Connect with other SafeRoad users to share experiences, tips, and safety alerts in your area.',
            ),
            // Add vertical spacing before mission section
            const SizedBox(height: 24),
            // ========== OUR MISSION SECTION ==========
            // Heading for mission statement
            Text(
              // Section heading
              'Our Mission',
              // TextStyle
              style: TextStyle(
                // Font size
                fontSize: 22,
                // Bold
                fontWeight: FontWeight.bold,
                // Dark color
                color: Colors.black87,
              ),
            ),
            // Add vertical spacing
            const SizedBox(height: 8),
            // Mission statement text
            Text(
              // Detailed mission statement
              'At SafeRoad, we are committed to:\n\n'
              '• Reducing road accidents through technology and awareness\n'
              '• Providing instant emergency support when you need it most\n'
              '• Empowering travelers with knowledge and real-time information\n'
              '• Building a global community dedicated to safer journeys\n'
              '• Continuously innovating to meet evolving safety challenges\n\n'
              'We believe that safety is not a luxury—it\'s a fundamental right every traveler deserves.',
              // TextStyle
              style: TextStyle(
                // Font size
                fontSize: 15,
                // Line height for readability
                height: 1.6,
                // Gray color
                color: Colors.grey[700],
              ),
            ),
            // Add vertical spacing before vision section
            const SizedBox(height: 24),
            // ========== OUR VISION SECTION ==========
            // Heading for vision statement
            Text(
              // Section heading
              'Our Vision',
              // TextStyle
              style: TextStyle(
                // Font size
                fontSize: 22,
                // Bold
                fontWeight: FontWeight.bold,
                // Dark color
                color: Colors.black87,
              ),
            ),
            // Add vertical spacing
            const SizedBox(height: 8),
            // Vision statement text
            Text(
              // Detailed vision statement
              'We envision a world where road safety is paramount, where every traveler has access to intelligent safety systems, '
              'and where accidents are minimized through proactive measures and rapid response. '
              'SafeRoad aims to be the global leader in travel safety technology, trusted by millions of users worldwide.',
              // TextStyle
              style: TextStyle(
                // Font size
                fontSize: 15,
                // Line height
                height: 1.5,
                // Gray color
                color: Colors.grey[700],
              ),
            ),
            // Add spacing at the bottom for better UX
            const SizedBox(height: 24),
            // Version and copyright info
            Center(
              // Center the version text
              child: Text(
                // Version info
                'SafeRoad v1.0.0',
                // TextStyle
                style: TextStyle(
                  // Smaller font size
                  fontSize: 12,
                  // Light gray color
                  color: Colors.grey[500],
                ),
              ),
            ),
            // Add spacing at bottom
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// _buildFeatureItem is a helper function to create feature list items
// It takes an icon, title, and description as parameters
Widget _buildFeatureItem({
  // IconData for the feature icon
  required IconData icon,
  // String for the feature title
  required String title,
  // String for the feature description
  required String description,
}) {
  // Container widget that holds the feature item styling
  return Container(
    // padding adds space inside the container
    padding: const EdgeInsets.all(14),
    // decoration provides styling like background color and border
    decoration: BoxDecoration(
      // color: light gray background
      color: Colors.grey[100],
      // borderRadius creates rounded corners (8 pixel radius)
      borderRadius: BorderRadius.circular(8),
      // border adds a border around the container
      border: Border.all(
        // border color: light gray
        color: Colors.grey[300]!,
        // border width: 1 pixel
        width: 1,
      ),
    ),
    // child: the content inside the container
    child: Row(
      // crossAxisAlignment aligns items vertically
      crossAxisAlignment: CrossAxisAlignment.start,
      // children is the list of widgets in the row
      children: [
        // Icon widget displaying the feature icon
        Icon(
          // The icon to display
          icon,
          // Icon size in logical pixels
          size: 32,
          // Icon color: blue (primary color)
          color: Colors.blue,
        ),
        // Add horizontal spacing between icon and text
        const SizedBox(width: 12),
        // Expanded widget makes text area flexible and fills remaining space
        Expanded(
          // child: column to arrange title and description vertically
          child: Column(
            // crossAxisAlignment aligns text to the start (left)
            crossAxisAlignment: CrossAxisAlignment.start,
            // children is the list of text widgets
            children: [
              // Title text
              Text(
                // The title value
                title,
                // TextStyle for the title
                style: const TextStyle(
                  // Font size
                  fontSize: 15,
                  // Bold text
                  fontWeight: FontWeight.bold,
                  // Dark color
                  color: Colors.black87,
                ),
              ),
              // Add spacing between title and description
              const SizedBox(height: 4),
              // Description text
              Text(
                // The description value
                description,
                // TextStyle for description
                style: TextStyle(
                  // Font size slightly smaller
                  fontSize: 13,
                  // Line height for readability
                  height: 1.4,
                  // Gray color for secondary text
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
