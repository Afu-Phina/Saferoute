// Import Flutter's material library which contains commonly used widgets.
import 'package:flutter/material.dart';
// Import the Google Maps Flutter package to display an interactive map.
// ignore: depend_on_referenced_packages
import 'package:google_maps_flutter/google_maps_flutter.dart';

// RoutesScreen is a StatefulWidget because the screen holds data that can
// change over time: the map controller and the loading/sharing state.
class RoutesScreen extends StatefulWidget {
  // Constructor: `super.key` forwards the optional key to the parent class.
  const RoutesScreen({super.key});

  // Create and return the mutable state object for this widget.
  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

// Private state class for RoutesScreen. The underscore (_) indicates privacy.
class _RoutesScreenState extends State<RoutesScreen> {
  // Controller used to control the GoogleMap after it has been created.
  GoogleMapController? _mapController;

  // Boolean that tracks if we are currently simulating sharing the location.
  bool _isSharing = false;

  // A fixed sample campus location (latitude, longitude) used for the demo.
  static const LatLng _sampleCampusLatLng = LatLng(37.42796133580664, -122.085749655962);

  // The map's starting camera position centered on the sample campus.
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: _sampleCampusLatLng,
    zoom: 15.0,
  );

  // Simulates obtaining the user's location and sharing it with a trusted
  // contact. Uses a fixed location and a 2-second delay to avoid real
  // permissions or backend complexity.
  Future<void> _findAndShareLocation() async {
    // Prevent starting the process again if it's already running.
    if (_isSharing) return;

    // Update UI to show a loading indicator.
    setState(() {
      _isSharing = true;
    });

    // Simulate a delay for getting/sharing the location.
    await Future.delayed(const Duration(seconds: 2));

    // If the widget was removed while waiting, do nothing further.
    if (!mounted) return;

    // Move the map camera to the sample campus location so the user sees it.
    _mapController?.animateCamera(CameraUpdate.newLatLng(_sampleCampusLatLng));

    // Show a confirmation message that the (simulated) share completed.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Your location has been shared with a trusted contact for safe routing.'),
      ),
    );

    // Turn off the loading indicator.
    setState(() {
      _isSharing = false;
    });
  }

  // Build the user interface for the Routes screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Screen title displayed in the app bar.
        title: const Text('Safe Routes'),
      ),
      body: Padding(
        // Provide padding around the whole body so content isn't flush to the edges.
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Make children stretch horizontally to take full width.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Short explanation text above the map.
            const Text(
              'This screen shows safe routes around campus.\nPress the button below to simulate sharing your location with a trusted contact.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            // Expanded makes the map fill the remaining available vertical space.
            Expanded(
              child: ClipRRect(
                // Round the map corners slightly for a nicer look.
                borderRadius: BorderRadius.circular(12),
                child: GoogleMap(
                  // Start the map centered on the sample campus.
                  initialCameraPosition: _initialCameraPosition,
                  // Save the map controller so we can move the camera later.
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  // We are not using the device's real location in this demo.
                  myLocationEnabled: false,
                  // Enable some built-in UI controls for convenience.
                  compassEnabled: true,
                  zoomControlsEnabled: true,
                  mapType: MapType.normal,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Button to simulate finding and sharing safe routes.
            ElevatedButton(
              // Disable while the simulated share operation is running.
              onPressed: _isSharing ? null : _findAndShareLocation,
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
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
    );
  }
}
