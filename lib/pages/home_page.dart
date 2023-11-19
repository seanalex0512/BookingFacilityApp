import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/components/ImageContainer.dart';
import 'package:login_page/components/navigation.dart';
import 'bookings.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false, // Removes the debug banner
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
              child: Image.asset(
                'lib/images/intilogo.png',
                width: 200,
                height: 200,
              ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Facilities',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Sports',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageContainer(
                        imagePath: 'lib/images/tennislogo.png',
                        text: 'Tennis Court',
                      ),
                      SizedBox(width: 8),
                      ImageContainer(
                        imagePath: 'lib/images/poollogo.png',
                        text: 'Pool Table',
                      ),
                      SizedBox(width: 8),
                      ImageContainer(
                        imagePath: 'lib/images/basketballlogo.png',
                        text: 'Basketball Court',
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  // Additional text or components
                  Text(
                    'Learning',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      ImageContainer(
                        imagePath: 'lib/images/discussion.png',
                        text: 'Discussion Rooms',
                      ),
                      SizedBox(width: 8),
                      ImageContainer(
                        imagePath: 'lib/images/library.png',
                        text: 'Library',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 70),

              Align(
                alignment: Alignment.bottomCenter,
                child: Navigation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


