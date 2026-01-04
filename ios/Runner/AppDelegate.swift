import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Provide the Google Maps API key for iOS so map tiles can load.
    // Replace "YOUR_IOS_API_KEY" with your actual iOS Maps API key.
    // To obtain a key, enable the Maps SDK for iOS in Google Cloud Console.
    // If you prefer not to hardcode the key here, you can add it to Info.plist instead.
    // Uncomment the line below and add your key.
    // GMSServices.provideAPIKey("YOUR_IOS_API_KEY")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
