import 'package:flutter/material.dart';

class BookingNavigation extends StatefulWidget {
  const BookingNavigation({Key? key}) : super(key: key);

  @override
  _BookingNavigationState createState() => _BookingNavigationState();
}

class _BookingNavigationState extends State<BookingNavigation> {
  bool isCurrentBookingSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 294,
      height: 40,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFFFFEFE)),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 294,
              height: 40,
              decoration: ShapeDecoration(
                color: Color(0xFFF1F1FA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
          ),
          Positioned(
            left: isCurrentBookingSelected ? 3.44 : 150.56,
            top: 2.86,
            child: Container(
              width: 143.56,
              height: 34.29,
              decoration: ShapeDecoration(
                color: isCurrentBookingSelected ? Color(0xFFFD3C4A) : Color(0xFFF1F1FA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
          ),
          Positioned(
            left: 3.44,
            top: -4,
            child: Container(
              width: 287.12,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isCurrentBookingSelected = true;
                        });
                      },
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.all(8),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),

                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Current Booking',
                              style: TextStyle(
                                color: isCurrentBookingSelected ? Color(0xFFFBFBFB) : Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isCurrentBookingSelected = false;
                        });
                      },
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isCurrentBookingSelected ? Color(0xFFF1F1FA) : Colors.red,
                          borderRadius: BorderRadius.circular(32),
                        ),

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'History',
                              style: TextStyle(
                                color: isCurrentBookingSelected ? Colors.black : Color(0xFFFBFBFB),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            SizedBox(height: 30),


                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
