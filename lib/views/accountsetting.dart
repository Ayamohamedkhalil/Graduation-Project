import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/Registeration/registeration.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/views/reasonfordeleteaccount.dart';
import 'package:http/http.dart' as http;
import 'package:splash_onboarding_test/Registeration/auth_service.dart'; 

class Accountsetting extends StatefulWidget {
  const Accountsetting({super.key});

  @override
  State<Accountsetting> createState() => _AccountsettingState();
}

class _AccountsettingState extends State<Accountsetting> {
   Future<String?> getToken() async {
    final String? token = await AuthService.getToken();
    if (token == null) {
      print('No token found');
    } else {
      print('Retrieved Token: $token');
    }
    return token;
  }

  final String UserImage = "";

  void _Deleteaccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xff537F5C).withOpacity(.88),
          elevation: 20, // Add elevation for the shadow
          shadowColor: Colors.black.withOpacity(0.25), // Customize shadow color
          content: SizedBox(
            height: 420,
            width: 320,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                // SizedBox(height: 60),
                Image.asset('assets/deleteimage.png'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Are you sure you want to delete your account?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'InriaSans-Regular',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
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
                            builder: (context) => const DeleteAccountScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffA71C1C)
                          .withOpacity(.88),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'InriaSans-Bold',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 240,
                  decoration: const BoxDecoration(
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
                      side: const BorderSide(color: Colors.white, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
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
        backgroundColor: const Color(0xff537F5C).withOpacity(.88),
        elevation: 20, // Add elevation for the shadow
        shadowColor: Colors.black.withOpacity(0.25), // Customize shadow color
        content: SizedBox(
          height: 320,
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 60),
              const Text(
                "Are you sure you want to logout?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'InriaSans-Regular',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
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
                  onPressed: () async {
                    // Send logout API request
                    final response = await _sendLogoutRequest();

                    if (response.statusCode == 200) {
                      // Successfully logged out
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Registeration()),
                      );
                    } else {
                      // Failed to logout, show error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Failed to logout: ${response.body}")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffA71C1C).withOpacity(.88),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'InriaSans-Bold',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 240,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
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

Future<http.Response> _sendLogoutRequest() async {
  final token = await getToken();
  final url = Uri.parse('https://backend-production-19d7.up.railway.app/api/logout');
  final headers = {
    'Authorization': '$token' 
  };
  
  final response = await http.post(url, headers: headers);
  return response;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF537F5C),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
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
                      icon: const Icon(Icons.edit,
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
          const SizedBox(
            height: 30,
          ),
          const Text(
            'User’s Name',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontFamily: 'InriaSerif'),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.15),
                borderRadius: BorderRadius.circular(20)),
            height: 270,
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: const Icon(Icons.edit, color: Colors.white),
                  title: const Text('Edit profile',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'InriaSans')),
                  trailing: const Icon(Icons.arrow_forward, color: Colors.white),
                  onTap: () {
                   /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Edituserprofile()),
                    );*/
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  title: const Text('Change Password',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'InriaSans')),
                  trailing: const Icon(Icons.arrow_forward, color: Colors.white),
                  onTap: () {
                    // Add your onTap code here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text('Logout',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'InriaSans')),
                  trailing: const Icon(Icons.arrow_forward, color: Colors.white),
                  onTap: () {
                    _logout();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete, color: const Color(0xffA71C1C).withOpacity(.80)),
                  title: Text('Delete Account',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 162, 16, 16).withOpacity(.88),
                          // fontSize: 20,
                          fontFamily: 'InriaSans-Bold')),
                  trailing: Icon(Icons.arrow_forward, color: const Color(0xffA71C1C).withOpacity(.80)),
                  onTap: () {
                    _Deleteaccount();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const BarButton()
        ],
      ),
    );
  }
}
