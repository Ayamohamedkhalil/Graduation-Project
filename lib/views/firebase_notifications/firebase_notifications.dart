import 'package:firebase_messaging/firebase_messaging.dart';

class firebasenotifications {
  //create instance of RBM
  final _firebasemessaging = FirebaseMessaging.instance;
  //inintialize  notofications for the app or device
  Future<void> initnotifications() async {
    
    await _firebasemessaging.requestPermission();
    String? token = await _firebasemessaging.getToken();
    print("token:$token");
  }
  //handle message when received
  /*void handlMmessage(RemoteMessage?message){
   if()
  }*/
  //handle mesggage if app is terminated 
  /*Future handleBackgroundNotifications(){
    FirebaseMessaging.instance.getInitialMessage()
  }*/
}
