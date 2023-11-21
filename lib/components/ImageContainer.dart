import 'package:flutter/material.dart';
import 'package:login_page/pages/facilities_details_page.dart';

class ImageContainer extends StatefulWidget {
  final String imagePath;
  final String text;

  ImageContainer({required this.imagePath, required this.text});

  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to FacilityDetailsPage when clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SportDetailsPage(
                facilityName: widget.text,
            ),
          ),
        );
      },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.imagePath,
              width: 80,
              height: 80,
            ),
            SizedBox(height: 8),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF717171),
              ),
            ),
          ],
        ),
    );
  }
}