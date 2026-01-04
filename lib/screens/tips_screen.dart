// Import Flutter's material library which contains widgets we use.
import 'package:flutter/material.dart';

// A stateless widget for the Campus Safety Tips screen.
class TipsScreen extends StatelessWidget {
  // Constructor passes the key to the parent class.
  const TipsScreen({super.key});

  // The build method describes the UI for this screen.
  @override
  Widget build(BuildContext context) {
    // A simple list of safety tips. We keep it local and constant.
    const List<String> tips = [
      'Stay in well-lit areas',
      'Walk with friends when possible',
      'Share your ETA with someone you trust',
      'Trust your instincts — leave if you feel unsafe',
      'Keep emergency contacts easily accessible',
      'Avoid distractions like headphones in unfamiliar places',
    ];

    // Scaffold provides a standard page layout with an AppBar and body.
    return Scaffold(
      // AppBar shows a title at the top of the screen.
      appBar: AppBar(
        title: const Text('Campus Safety Tips'),
      ),
      // Body contains the main content: a vertically scrolling list of tips.
      body: Padding(
        // Padding keeps content away from screen edges.
        padding: const EdgeInsets.all(16.0),
        // ListView builds a scrollable list of widgets from the `tips` list.
        child: ListView.builder(
          // Number of items equals the length of our tips list.
          itemCount: tips.length,
          // itemBuilder is called for each index to create the row widget.
          itemBuilder: (context, index) {
            // Get the tip text for this row.
            final String tip = tips[index];
            // Return a ListTile which is a convenient row with leading icon and text.
            return Card(
              // Card gives a subtle elevation and rounded corners.
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                // A small leading icon to visually mark the tip.
                leading: const Icon(Icons.check_circle_outline, color: Colors.green),
                // The main text of the tile showing the tip.
                title: Text(tip),
                // A brief subtitle to encourage safe behavior (optional).
                subtitle: const Text('Keep this in mind while on campus'),
              ),
            );
          },
        ),
      ),
    );
  }
}
