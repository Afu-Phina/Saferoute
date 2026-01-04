// Import Flutter's material package which contains common widgets like
// Scaffold, AppBar, Column, Text, ElevatedButton, etc.
import 'package:flutter/material.dart';
// Import google_maps_flutter to display a real interactive Google Map.
import 'package:google_maps_flutter/google_maps_flutter.dart';

// SafeRoutesScreen is a StatefulWidget because the screen needs to update
// its UI when the sharing simulation starts/stops (loading state).
class SafeRoutesScreen extends StatefulWidget {
  // Constructor for the widget. `const` makes the widget immutable and
  // allows Flutter to optimize rebuilds when possible.
  const SafeRoutesScreen({super.key});

  // createState() creates the mutable State object for this widget.
  @override
  State<SafeRoutesScreen> createState() => _SafeRoutesScreenState();
}

// The private State class that holds mutable fields and builds the UI.
class _SafeRoutesScreenState extends State<SafeRoutesScreen> {
  // GoogleMapController allows programmatic control of the map (camera moves).
  // It starts as null until the map is created, so it is nullable (GoogleMapController?).
  GoogleMapController? _mapController;

  // Tracks whether we are currently simulating sharing the user's location.
  // This boolean is used to disable the button and show a spinner while sharing.
  bool _isSharing = false;

  // A fixed sample campus location (latitude, longitude) used for the demo.
  // LatLng is a type from google_maps_flutter representing a geographic point.
  static const LatLng _campusLatLng = LatLng(37.42796133580664, -122.085749655962);

  // The map's initial camera position: where the map starts when first displayed.
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: _campusLatLng, // Center the map on the sample campus coordinates.
    zoom: 15.0, // Zoom level; higher numbers zoom in closer.
  );

  // This function simulates sharing the user's current location with a trusted
  // contact. It does not use real GPS or permissions; it only demonstrates
  // UI behavior: a SnackBar, a short delay, then a success SnackBar.
  Future<void> _simulateShareLocation() async {
    // If a share operation is already running, do nothing to avoid duplicates.
    if (_isSharing) return;

    // Update state to show a loading indicator (button disabled + spinner).
    setState(() {
      _isSharing = true;
    });

    // Immediately show a SnackBar informing the user the share started.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sharing your location with a trusted contact...')),
    );

    // Simulate a short network/processing delay (2 seconds) using Future.delayed.
    await Future.delayed(const Duration(seconds: 2));

    // If the widget was removed from the tree while waiting, stop here.
    if (!mounted) return;

    // Optionally animate the map camera to the campus location so the user
    // sees where the (simulated) location is. This is a visual hint only.
    _mapController?.animateCamera(CameraUpdate.newLatLng(_campusLatLng));

    // Show a success SnackBar after the simulated share completes.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Location shared successfully for safe routing.')),
    );

    // Turn off the loading state so the button becomes active again.
    setState(() {
      _isSharing = false;
    });
  }

  // Build constructs the UI each time the widget needs to be painted.
  @override
  Widget build(BuildContext context) {
    // Scaffold provides the standard visual layout: app bar, body, etc.
    return Scaffold(
      // AppBar at the top with the screen title.
      appBar: AppBar(
        title: const Text('Safe Routes'), // Requirement: title must be "Safe Routes".
      ),
      // SafeArea avoids operating system intrusions (notches, status bar).
      body: SafeArea(
        // Padding adds space around the content so it isn't flush with edges.
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          // Column arranges widgets vertically: map first, then button.
          child: Column(
            // Make children stretch horizontally to fill available width.
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Expanded tells the map to take all remaining vertical space.
              Expanded(
                child: ClipRRect(
                  // ClipRRect rounds the map corners for a neat look.
                  borderRadius: BorderRadius.circular(12),
                  // GoogleMap is the real interactive map widget from the plugin.
                  child: GoogleMap(
                    // initialCameraPosition defines where the map is centered at start.
                    initialCameraPosition: _initialCameraPosition,
                    // onMapCreated provides the controller once the map is ready.
                    onMapCreated: (GoogleMapController controller) {
                      // Save the controller so we can move the camera later.
                      _mapController = controller;
                    },
                    // We do NOT enable real device location in this demo.
                    myLocationEnabled: false,
                    // Allow standard map gestures (pan, zoom) and controls.
                    compassEnabled: true,
                    zoomControlsEnabled: true,
                    // Use the normal map type (roads and labels).
                    mapType: MapType.normal,
                  ),
                ),
              ),
              // Small spacing between the map and the button.
              const SizedBox(height: 12),
              // The action button at the bottom labeled "Find Safe Routes".
              // The button is disabled while a simulated share is in progress.
              ElevatedButton(
                // If _isSharing is true, set onPressed to null to disable the button.
                onPressed: _isSharing ? null : _simulateShareLocation,
                style: ElevatedButton.styleFrom(
                  // Make the button a bit taller for easier tapping.
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                // Show a spinner while sharing, otherwise show the button text.
                child: _isSharing
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text('Find Safe Routes', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
