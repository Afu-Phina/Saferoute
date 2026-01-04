// Cloud Function example (Node.js) to forward Firestore emergency alerts to FCM.
// This file is a sample. To deploy:
// 1) Create a Firebase project and enable Cloud Functions and FCM.
// 2) Put this file under `functions/send_alert/index.js` in your functions repo.
// 3) Run `npm install firebase-admin firebase-functions` and deploy with `firebase deploy --only functions`.

const functions = require('firebase-functions');
const admin = require('firebase-admin');

// Initialize the admin SDK. In Cloud Functions environment credentials are auto-provided.
admin.initializeApp();

// Triggered when a new document is created in the 'emergency_alerts' collection.
exports.sendEmergencyNotification = functions.firestore
  .document('emergency_alerts/{alertId}')
  .onCreate(async (snap, context) => {
    const data = snap.data();
    if (!data) return null;

    const messageText = data.message || 'Emergency reported';
    const uid = data.uid || 'unknown';

    // Build the notification payload. We send a data message so the app can
    // handle it in a custom way; we also include a visible notification.
    const payload = {
      notification: {
        title: 'Emergency Alert',
        body: messageText,
      },
      data: {
        uid: String(uid),
        alertId: context.params.alertId,
      },
    };

    // Send the notification to all devices subscribed to the 'security' topic.
    // Security devices (staff phones/tablets) should subscribe to this topic.
    try {
      const response = await admin.messaging().sendToTopic('security', payload);
      console.log('Notification sent:', response);
    } catch (err) {
      console.error('Error sending notification:', err);
    }

    return null;
  });
