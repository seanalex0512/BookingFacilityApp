import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_page/components/confirm_booking_button.dart';
import 'package:login_page/pages/home_page.dart';


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
              if (widget.facilityName == 'Discussion Rooms' )
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
                child: ConfirmBookingButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
