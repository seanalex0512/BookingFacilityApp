import 'package:flutter/material.dart';

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
    return Container(
      width: 120,
      height: 140,
      decoration: ShapeDecoration(
        color: Color(0x59D9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
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