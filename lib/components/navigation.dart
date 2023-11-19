import 'package:flutter/material.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/pages/bookings.dart';
import 'package:login_page/pages/profile.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 269,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Color(0x19162233),
            blurRadius: 32,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x1E162233),
            blurRadius: 12,
            offset: Offset(0, 4),
            spreadRadius: -4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavItem('Home', Icons.home, () {
            // Navigate to HomePage with fade transition
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => HomePage(),
                transitionsBuilder: (context, animation1, animation2, child) {
                  const begin = 0.0;
                  const end = 1.0;
                  const curve = Curves.easeInOutQuart;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var fadeAnimation = animation1.drive(tween);

                  return FadeTransition(opacity: fadeAnimation, child: child);
                },
              ),
            );
          }),
          buildNavItem('Bookings', Icons.event, () {
            // Navigate to BookingsPage with fade transition
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => BookingsPage(),
                transitionsBuilder: (context, animation1, animation2, child) {
                  const begin = 0.0;
                  const end = 1.0;
                  const curve = Curves.easeInOutQuart;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var fadeAnimation = animation1.drive(tween);

                  return FadeTransition(opacity: fadeAnimation, child: child);
                },
              ),
            );
          }),
          buildNavItem('Profile', Icons.person, () {
            // Navigate to ProfilePage with fade transition
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => Profile(),
                transitionsBuilder: (context, animation1, animation2, child) {
                  const begin = 0.0;
                  const end = 1.0;
                  const curve = Curves.easeInOutQuart;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var fadeAnimation = animation1.drive(tween);

                  return FadeTransition(opacity: fadeAnimation, child: child);
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget buildNavItem(String label, IconData iconData, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 24,
            color: Colors.black, // Adjust the color as needed
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF717171),
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
