import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/404/error.dart';
import 'package:flutter_web_dashboard/pages/drivers/widgets/drivers_table.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class AssignPage extends StatefulWidget {
  const AssignPage({Key key}) : super(key: key);

  @override
  _AssignPageState createState() => _AssignPageState();
}

class _AssignPageState extends State<AssignPage> {
  String _selectedTime;
  DateTime selectedDate = DateTime.now();
  String _dropDownValue;
  bool _dateTapped = false;

  Future<void> _show() async {
    final TimeOfDay result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 12, minute: 00),
    );
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                hint: _dropDownValue == null
                    ? CustomText(
                        text: 'Choose Team',
                        size: 30,
                      )
                    : CustomText(
                        text: _dropDownValue,
                        size: 30,
                      ),
                isExpanded: false,
                underline: SizedBox(),
                iconSize: 30.0,
                items: [
                  'Team 1',
                  'Team 2',
                  'Team 3',
                ].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: CustomText(
                        text: val,
                        size: 30,
                      ),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(() {
                    _dropDownValue = val;
                  });
                },
              ),
              Divider(
                height: 1,
              ),
              SizedBox(
                height: 10,
              ),
              !ResponsiveWidget.isSmallScreen(context)
                  ? Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                _selectedTime == null ? "Choose Time" : "$_selectedTime",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: active,
                                ),
                                onPressed: _show,
                                child: Text(
                                  'Select Due Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                !_dateTapped ? 'Choose Date' : "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: active,
                                ),
                                onPressed: () {
                                  _selectDate(context);
                                  setState(() {
                                    _dateTapped = true;
                                  });
                                },
                                child: Text(
                                  'Select Due Date',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                _selectedTime == null ? "Choose Time" : "$_selectedTime",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: active,
                                ),
                                onPressed: _show,
                                child: Text(
                                  'Select Due Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                !_dateTapped ? 'Choose Date' : "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: active,
                                ),
                                onPressed: () {
                                  _selectDate(context);
                                  setState(() {
                                    _dateTapped = true;
                                  });
                                },
                                child: Text(
                                  'Select Due Date',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
