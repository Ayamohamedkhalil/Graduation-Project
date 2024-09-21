import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/PrivacySettingPage/PrivacySettingPage.dart';
import 'package:http/http.dart' as http;
import 'package:splash_onboarding_test/Registeration/auth_service.dart'; 
import 'package:splash_onboarding_test/views/PreviosTestPage/PreviousTestPage.dart';

class DeleteDataPage extends StatelessWidget {
  const DeleteDataPage({super.key});
Future<String?> getToken() async {
    final String? token = await AuthService.getToken();
    if (token == null) {
      print('No token found');
    } else {
      print('Retrieved Token: $token');
    }
    return token;
  }
  Future<void> deleteData(BuildContext context) async {
  final String? token = await getToken(); // Retrieve the token
  if (token == null) {
    // Handle case where the token is missing
    return;
  }

  final response = await http.post(
    Uri.parse('https://backend-production-19d7.up.railway.app/api/deleteAllTests'),
    headers: {
      'Authorization': token,
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // Data successfully deleted
    Navigator.of(context).pop(); // Close the dialog before navigating
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Previoustestpage()), 
    );
  } else {
    // Handle error (e.g., show a message)
    print('Failed to delete data: ${response.body}');
  }
}

void _Deleteaccount(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Color(0xff537F5C).withOpacity(.88),
        elevation: 20,
        shadowColor: Colors.black.withOpacity(0.25),
        content: Container(
          height: 420,
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Image.asset('assets/deleteimage.png'), 
              SizedBox(height: 20),
              Text(
                "Are you sure you want to delete your data?",
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
                child: ElevatedButton(
                  onPressed: () {
                    deleteData(context); // Call the data deletion function
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffA71C1C).withOpacity(.88),
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
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: OutlinedButton.styleFrom(
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PriamryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(height: 100),
                Stack(children: [
                  Positioned(
                    left: 20,
                    top: 5,
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.80),
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
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: const Color(0xFF537F5C),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PrivacySettingPage(),
                          ));
                        },
                        iconSize: 25.0,
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                        splashRadius: 25.0,
                        tooltip: "Next",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Delete Your Data",
                          style: TextStyle(
                              fontFamily: "InriaSans-Bold",
                              fontSize: 28,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ]),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40, bottom: 40),
                      child: Text(
                        "Are you sure you want to delete your data? This action will remove all your previous test results you’ve stored in the app. Once deleted, this data cannot be recovered. If you’re certain, please confirm your decision by clicking 'Delete Data.'",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 270,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
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
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 44),
                          backgroundColor: const Color.fromARGB(220, 167, 28, 28),
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          _Deleteaccount(context); // Call the dialog
                        },
                        child: const Text(
                          'Delete Data',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontFamily: 'InriaSans-Bold',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const BarButton(),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
