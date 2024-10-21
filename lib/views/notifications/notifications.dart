import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/views/ConatctUspage/contactUsPage.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';
import 'package:splash_onboarding_test/views/firebase_notifications/firebase_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // Import Firebase Messaging

import 'package:http/http.dart' as http; // For making HTTP requests

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  final FirebaseNotifications _firebaseNotifications = FirebaseNotifications();
  bool testReminder = false;
  bool progressUpdate = true;
  bool newsAndUpdates = false;
  bool reminderNotification = false;
  bool vibrationEnabled = true;
  double notificationVolume = 5.0;

  @override
  void initState() {
    super.initState();
    _loadInitialSettings();
  }

  // Load initial state of reminderNotification
  Future<void> _loadInitialSettings() async {
    reminderNotification =
        await _firebaseNotifications.getTokenFromPreferences() != null;
    setState(() {});
  }

  Future<void> _handleNotificationToggle(bool value) async {
    setState(() {
      reminderNotification = value;
    });
    print(
        'reminderNotification====================================================$reminderNotification');
    if (reminderNotification) {
      // Re-initiate FCM token when enabled
      await _firebaseNotifications.initNotifications();
      String? fcmToken =
          await FirebaseMessaging.instance.getToken(); // Get the new FCM token
      if (fcmToken != null) {
        // Make the PUT request to update the FCM token in the backend
        await _updateFCMToken(fcmToken);
      }
    } else {
      // Delete FCM token from shared preferences and Firebase when disabled
      await _firebaseNotifications
          .logout(); // Remove token from shared preferences
           await FirebaseMessaging.instance.deleteToken();
      print("FCM token deleted.");
    }
  }

  // Function to update FCM token in the backend
  Future<void> _updateFCMToken(String fcmToken) async {
    final String? token = await getToken();
    const url =
        'https://backend-production-19d7.up.railway.app/api/update_fcm_token';

    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token ?? '',
      },
      body: {
        'fcm_token': fcmToken,
      },
    );

    if (response.statusCode == 200) {
      print('FCM token updated successfully');
    } else {
      print('Failed to update FCM token: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF537F5C), // Background color
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.80),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          margin: const EdgeInsets.only(left: 22),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xFF537F5C),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserProfile()),
              );
            },
            iconSize: 25.0,
            splashRadius: 25.0,
            tooltip: "Back",
          ),
        ),
        title: const Text(
          'Notifications & Emails',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'InriaSans-Bold'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: ListView(
          children: [
            const SizedBox(height: 5),
            const Text(
              'Select the kind of notification you get about your activities and recommendations',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontFamily: 'InriaSans-Light'),
            ),
            Divider(
              color: Colors.white.withOpacity(.18),
              thickness: 1,
              height: 20,
            ),
            // Email section
            buildSectionHeader('Email'),
            buildRoundedContainer([
              buildToggleSwitch('Test reminder', testReminder, (value) {
                setState(() {
                  testReminder = value;
                });
              }),
              buildToggleSwitch('Progress update', progressUpdate, (value) {
                setState(() {
                  progressUpdate = value;
                });
              }),
              buildToggleSwitch('News and updates', newsAndUpdates, (value) {
                setState(() {
                  newsAndUpdates = value;
                });
              }),
            ]),
            const SizedBox(height: 30),
            buildSectionHeader('Push Notification'),
            buildRoundedContainer([
              buildToggleSwitch(
                'Reminder',
                reminderNotification,
                _handleNotificationToggle,
              ),
            ]),
            const SizedBox(height: 20),
            buildSoundVibrationSection(),
            const SizedBox(height: 140),
            const BarButton(),
          ],
        ),
      ),
    );
  }

  // Helper methods (same as before)
  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontFamily: 'InriaSans-Bold'),
      ),
    );
  }

  Widget buildToggleSwitch(
      String title, bool currentValue, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(title,
          style: const TextStyle(
              color: Colors.white, fontFamily: 'InriaSans-Bold', fontSize: 18)),
      value: currentValue,
      onChanged: onChanged,
      activeColor: Colors.white,
      inactiveThumbColor: Colors.white,
      activeTrackColor: Colors.white.withOpacity(0.3),
      inactiveTrackColor: const Color(0xff3B5D44).withOpacity(0.64),
    );
  }

  Widget buildRoundedContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffD9D9D9)),
        color: const Color(0xFFD9D9D9).withOpacity(0.58),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget buildSoundVibrationSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
          width: 1.0,
        ),
      ),
      child: ExpansionTile(
        initiallyExpanded: false,
        backgroundColor: const Color(0xff3B5D44).withOpacity(.28),
        collapsedBackgroundColor: Colors.transparent,
        title: const Text(
          'Sound & Vibration',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        children: [
          SwitchListTile(
            title: const Text(
              'Vibration',
              style: TextStyle(color: Colors.white),
            ),
            value: vibrationEnabled,
            onChanged: (bool value) {
              setState(() {
                vibrationEnabled = value;
              });
            },
            activeColor: Colors.white,
            inactiveThumbColor: Colors.white.withOpacity(0.5),
            inactiveTrackColor: const Color(0xff3B5D44).withOpacity(.64),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Text(
                  'Notification Volume',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: notificationVolume,
                  onChanged: (double newValue) {
                    setState(() {
                      notificationVolume = newValue;
                    });
                  },
                  min: 0.0,
                  max: 10.0,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
