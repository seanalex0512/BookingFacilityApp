import 'package:flutter/material.dart';
import '../components/navigation.dart';

class Bookings extends StatelessWidget {
  const Bookings({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookingsPage(),
      debugShowCheckedModeBanner: false, // Removes the debug banner
    );
  }
}

class BookingsPage extends StatelessWidget {
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
                  // Your booking-related content
                  Text(
                    'Your Bookings',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  // Sample booking-related content

                ],
              ),
              SizedBox(height: 443),

              Align(
                alignment: Alignment.bottomCenter,
                child: Navigation(),
              ), // Rest of your code...
            ],
          ),
        ),
      ),
    );
  }
}
