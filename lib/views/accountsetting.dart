import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';

class Accountsetting extends StatefulWidget {
  const Accountsetting({super.key});

  @override
  State<Accountsetting> createState() => _AccountsettingState();
}

class _AccountsettingState extends State<Accountsetting> {
  final String UserImage = "";
  @override
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
                          color: Colors.white,
                          fontFamily: 'InriaSans-Regular')),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  onTap: () {
                    // Add your onTap code here
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  title: Text('Change Password',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'InriaSans-Regular')),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  onTap: () {
                    // Add your onTap code here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text('Logout',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'InriaSans-Regular')),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  onTap: () {
                    // Add your onTap code here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete, color: Color(0xffA71C1C)),
                  title: Text('Delete Account',
                      style: TextStyle(
                          color: Color(
                            0xffA71C1C,
                          ),
                          fontFamily: 'InriaSans-Regular')),
                  trailing: Icon(Icons.arrow_forward, color: Color(0xffA71C1C)),
                  onTap: () {
                    // Add your onTap code here
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 80,),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 50),
            height: 58,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: Color(0xff3B5D44).withOpacity(.90)),
              color: Color.fromARGB(255, 196, 211, 199),
              borderRadius: BorderRadius.circular(20),
              /*boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ]*/
            ),
            child: SizedBox(
              height: 58,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    color: const Color(0xff3B5D44),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 37,
                    ),
                  ),
                  const SizedBox(
                    width: 20, // Closer spacing to the home icon
                  ),
                  // FaIcon(FontAwesomeIcons.pen),
                  IconButton(
                    color: const Color(0xff3B5D44),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => homescreen()),
                      );
                    },
                    icon: const Icon(
                      Icons.home,
                      size: 37,
                    ),
                  ),
                  const SizedBox(
                    width: 20, // Closer spacing to the person icon
                  ),
                  IconButton(
                    color: const Color(0xff3B5D44),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfile()),
                      );
                    },
                    icon: const Icon(
                      Icons.person,
                      size: 37,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
