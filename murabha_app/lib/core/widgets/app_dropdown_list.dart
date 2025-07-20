import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUniversalDropdownList extends StatefulWidget {
  @override
  _AppUniversalDropdownListState createState() =>
      _AppUniversalDropdownListState();
}

class _AppUniversalDropdownListState extends State<AppUniversalDropdownList> {
  String? selectedValue;

  final List<String> items = ['Toyota', 'Honda', 'Hyundai', 'Kia', 'BMW'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),

      child: DropdownButton<String>(
        isDense: true,
        isExpanded: true,
        alignment: Alignment.centerLeft,
        hint: Text("Choose your Account"),
        value: selectedValue,
        icon: Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: TextStyle(color: Colors.black, fontSize: 16),
        // underline: Container(height: 2, color: Colors.blueAccent),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
  }
}
