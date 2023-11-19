import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_page/components/navigation.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    // Navigate back to the previous screen or to the login screen, as needed
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'lib/images/intilogo.png', // Adjust the path based on your project structure
              width: 200,
              height: 200,
            ),
          ),

          Text(
            'Account',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Add spacing between logo and account info


          SizedBox(height: 20), // Add spacing between logo and account info
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Logged In As: " + user.email!,
              style: TextStyle(fontSize: 20),
            ),
          ),

          SizedBox(height: 20), // Add spacing between account info and Facilities text

          // Continue with the rest of your Facilities content...
          ElevatedButton(
            onPressed: () => signUserOut(context),
            child: Text("Sign Out"),
          ),
        ],
      ),
      bottomNavigationBar: Navigation(),
    );
  }
}
