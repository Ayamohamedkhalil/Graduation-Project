import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
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
        automaticallyImplyLeading: false,
        leading: Container(
          // Use leading for the icon on the left
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
          margin: const EdgeInsets.only(
              left: 22), // Properly position the icon within the AppBar
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xFF537F5C),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserProfile()),
              ); // Adjusted for a typical back operation
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
        centerTitle: true, // Ensure the title is centered
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            const Text(
              'Select the kind of notification you get about your activities and recommendations',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontFamily: 'InriaSans-Light'),
            ),
            //const SizedBox(height: 20),
            Container(
              width: double.infinity, // Ensures the Divider takes full width
              margin: EdgeInsets.symmetric(
                  horizontal: 0), // Ensure full-width divider
              child: Divider(
                color: Colors.white.withOpacity(.18),
                thickness: 1, // Optional: Adjust the thickness
                height: 20, // Optional: Adjust height between elements
              ),
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
            SizedBox(height: 140,),
            const BarButton()
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
          fontSize: 20,
          fontFamily: 'InriaSans-Bold'
        ),
      ),
    );
  }

  // Helper method to create a toggle switch
  Widget buildToggleSwitch(
      String title, bool currentValue, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: Colors.white,fontFamily: 'InriaSans-Bold',fontSize: 18)),
      value: currentValue,
      onChanged: onChanged,
      activeColor: Colors.white, // Thumb color when active
    inactiveThumbColor: Colors.white, // Thumb color when inactive
    activeTrackColor: Colors.white.withOpacity(0.3), // Track color when active (simulates a border)
    inactiveTrackColor: const Color(0xff3B5D44).withOpacity(0.64), 
      
    );
  }

  // Helper method to wrap switches in a rounded container
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
}
