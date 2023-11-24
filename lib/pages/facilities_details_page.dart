import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_page/components/confirm_booking_button.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SportDetailsPage extends StatefulWidget {
  final String facilityName;

  SportDetailsPage({required this.facilityName});

  @override
  _SportDetailsPageState createState() => _SportDetailsPageState();
}

class _SportDetailsPageState extends State<SportDetailsPage> {
  String? dropdownTimeValue;
  String? dropdownRoomValue;
  DateTime? selectedDate;
  bool hasBooking = false;

  @override
  void initState() {
    super.initState();
    // Check for existing bookings when the page is initialized
    _checkExistingBooking();
  }

  Future<void> _checkExistingBooking() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Use a unique key for each facility, combining facility name, time, and date
    String bookingKey = '${widget.facilityName}_${dropdownTimeValue ?? 'defaultTime'}_${selectedDate?.toString() ?? 'defaultDate'}';

    // Check if the facility has already been booked
    bool isBooked = prefs.getBool(bookingKey) == true;

    setState(() {
      hasBooking = isBooked;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    if (widget.facilityName != 'Discussion Rooms' && widget.facilityName != 'Library') {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)), // One year ahead
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }
  }

  Future<void> _confirmBooking() async {
    // Validate the selected data before booking
    if (widget.facilityName != 'Discussion Rooms' && dropdownTimeValue != null && selectedDate != null) {
      // Save booking details using SharedPreferences
      await _saveBookingDetails();

      // Display booking details
      _showBookingDetailsDialog();
    } else {
      // Display an error or prompt the user to fill in all required fields
      print('Incomplete booking information');
    }
  }

  Future<void> _saveBookingDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Use a unique key for each facility, combining facility name, time, and date
    String bookingKey = '${widget.facilityName}_${dropdownTimeValue ?? 'defaultTime'}_${selectedDate.toString()}';

    // Check if the facility has already been booked
    if (prefs.getBool(bookingKey) == true) {
      print('This facility has already been booked.');
    } else {
      // Save booking details
      prefs.setBool(bookingKey, true);
      print('Booking details saved successfully.');
    }
  }

  Future<void> _showBookingDetailsDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Facility: ${widget.facilityName}'),
              Text('Time: ${dropdownTimeValue}'),
              Text('Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}'),
              // Add more details if needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context); // Navigate back to the home page
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'lib/images/intilogo.png',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.facilityName,
                style: TextStyle(
                  color: Color(0xFF231F20),
                  fontSize: 25,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(height: 20),
              if (widget.facilityName == 'Discussion Rooms')
                DropdownButtonFormField<String>(
                  hint: const Text('Select a Room'),
                  value: dropdownRoomValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownRoomValue = newValue;
                    });
                  },
                  items: <String>['Room 1', 'Room 2', 'Room 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 16),
              // Always show the time dropdown for 'Discussion Rooms'
              DropdownButtonFormField<String>(
                hint: const Text('Select a Time'),
                value: dropdownTimeValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownTimeValue = newValue;
                  });
                },
                items: <String>['10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM', '2:00 PM']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              if (widget.facilityName != 'Discussion Rooms')
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(selectedDate == null
                      ? 'Select a Date'
                      : DateFormat('yyyy-MM-dd').format(selectedDate!)),
                ),
              SizedBox(height: 20),
              Center(
                child: hasBooking
                    ? Column(
                  children: [
                    Text('You have already made a booking for this facility.'),
                    // Display additional booking details here
                  ],
                )
                    : ConfirmBookingButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back, adjust as needed
                  },
                  onSaveDetails: _confirmBooking, // Pass the _confirmBooking function here
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
