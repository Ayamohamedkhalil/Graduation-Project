import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/home.dart';

import 'package:splash_onboarding_test/views/edituserprofile.dart';
import 'package:splash_onboarding_test/views/reasonfordeleteaccount.dart';

class Accountsetting extends StatefulWidget {
  const Accountsetting({super.key});

  @override
  State<Accountsetting> createState() => _AccountsettingState();
}

class _AccountsettingState extends State<Accountsetting> {
  final String UserImage = "";

  void _Deleteaccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Color(0xff537F5C).withOpacity(.88),
          elevation: 20, // Add elevation for the shadow
          shadowColor: Colors.black.withOpacity(0.25), // Customize shadow color
          content: Container(
            height: 420,
            width: 320,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                // SizedBox(height: 60),
                Image.asset('assets/deleteimage.png'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Are you sure you want to delete your account?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'InriaSans-Regular',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  width: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeleteAccountScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffA71C1C)
                          .withOpacity(.88),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'InriaSans-Bold',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 240,
                  decoration: BoxDecoration(
                      /* boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.25), // Shadow color with opacity
                        spreadRadius: 2, // How much the shadow spreads
                        blurRadius: 4, // How blurry the shadow is
                        offset: Offset(2, 4), // Offset the shadow
                      ),
                    ],*/
                      ),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      //elevation: 1,
                      side: BorderSide(color: Colors.white, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'InriaSans-Regular',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Color(0xff537F5C).withOpacity(.88),
          elevation: 20, // Add elevation for the shadow
          shadowColor: Colors.black.withOpacity(0.25), // Customize shadow color
          content: Container(
            height: 320,
            width: 320,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 60),
                Text(
                  "Are you sure you want to logout?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'InriaSans-Regular',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  width: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const homescreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffA71C1C)
                          .withOpacity(.88),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      "LOG OUT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'InriaSans-Bold',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 240,
                  decoration: BoxDecoration(
                      /* boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.25), // Shadow color with opacity
                        spreadRadius: 2, // How much the shadow spreads
                        blurRadius: 4, // How blurry the shadow is
                        offset: Offset(2, 4), // Offset the shadow
                      ),
                    ],*/
                      ),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      //elevation: 1,
                      side: BorderSide(color: Colors.white, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'InriaSans-Regular',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF537F5C),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Settings',
            style: TextStyle(
                color: Color(0xffC4D3C7),
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
                child: Center(
                    child: Center(
                        child: Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/image 11.png', // Background image
                    fit: BoxFit.cover,
                  ),
                ),
                Image.asset(
                  'assets/AccountSettingimage.png', // Foreground image
                  fit: BoxFit.contain,
                ),
                Positioned(
                  bottom:
                      5, // Adjust this value to position the icon higher or lower
                  right:
                      8, // Adjust this value to position the icon more to the right or left
                  child: Container(
                    width: 35, // Adjust the size of the circle
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.6), // Background color for the circle
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.edit,
                          color: Color(0xffCCCCCC), size: 20), // Edit icon
                      onPressed: () {
                        // Define the action for the edit button here
                      },
                    ),
                  ),
                ),
              ],
            )))),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'User’s Name',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontFamily: 'InriaSerif'),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.25),
                borderRadius: BorderRadius.circular(20)),
            height: 270,
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: Icon(Icons.edit, color: Colors.white),
                  title: Text('Edit profile',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'InriaSans-Bold')),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Edituserprofile()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  title: Text('Change Password',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'InriaSans-Bold')),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  onTap: () {
                    // Add your onTap code here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text('Logout',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'InriaSans-Bold')),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  onTap: () {
                    _logout();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete, color: Color(0xffA71C1C).withOpacity(.88)),
                  title: Text('Delete Account',
                      style: TextStyle(
                          color: Color(
                            0xffA71C1C,
                          ).withOpacity(.88),
                          // fontSize: 20,
                          fontFamily: 'InriaSans-Bold')),
                  trailing: Icon(Icons.arrow_forward, color: Color(0xffA71C1C).withOpacity(.80)),
                  onTap: () {
                    _Deleteaccount();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
          const BarButton()
        ],
      ),
    );
  }
}
