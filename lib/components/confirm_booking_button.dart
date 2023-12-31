import 'package:flutter/material.dart';

class ConfirmBookingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback? onSaveDetails; // Change the type to VoidCallback

  ConfirmBookingButton({required this.onPressed, this.onSaveDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 219,
      height: 48,
      decoration: ShapeDecoration(
        color: Color(0xFF0FB300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: TextButton(
        onPressed: () {
          onSaveDetails?.call(); // Call onSaveDetails if it's not null
          onPressed.call();
        },
        child: Center(
          child: Text(
            'Confirm Booking',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
