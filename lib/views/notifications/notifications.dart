import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool testReminder = false;
  bool progressUpdate = true;
  bool newsAndUpdates = false;
  bool reminderNotification = false;
  bool vibrationEnabled = true;
  double notificationVolume = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF537F5C), // Background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF537F5C),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserProfile()),
            );
          },
        ),
        title: const Text('Notifications & Emails',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Select the kind of notification you get about your activities and recommendations',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),

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

            const SizedBox(height: 20),

            // Push Notification section
            buildSectionHeader('Push Notification'),
            buildRoundedContainer([
              buildToggleSwitch('Reminder', reminderNotification, (value) {
                setState(() {
                  reminderNotification = value;
                });
              }),
            ]),

            const SizedBox(height: 20),

            // Sound & Vibration section
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9).withOpacity(.58),
                // Background color
                borderRadius: BorderRadius.circular(17.0),
              ),
              child: ExpansionTile(
                initiallyExpanded: true,
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                title: const Text(
                  'Sound & Vibration',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  SwitchListTile(
                    title: const Text('Vibration',
                        style: TextStyle(color: Colors.white)),
                    value: vibrationEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        vibrationEnabled = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Volume of notification',
                            style: TextStyle(color: Colors.white)),
                        Slider(
                          value: notificationVolume,
                          min: 0,
                          max: 10,
                          divisions: 10,
                          label: notificationVolume.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              notificationVolume = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create a section header
  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper method to create a toggle switch
  Widget buildToggleSwitch(
      String title, bool currentValue, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      value: currentValue,
      onChanged: onChanged,
      activeColor: Colors.white,
      inactiveTrackColor: Colors.white38,
      inactiveThumbColor: Colors.white,
    );
  }

  // Helper method to wrap switches in a rounded container
  Widget buildRoundedContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9).withOpacity(0.58),
        borderRadius: BorderRadius.circular(17.0),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
