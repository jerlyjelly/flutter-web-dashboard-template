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
  String _dropDownValueWorkout;
  bool _dateTapped = false;

  List<String> _workouts = List.generate(4, (index) => "Workout ${index.toString()}");

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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                        ],
                      ),
                    ),
              Divider(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      DropdownButton(
                        hint: _dropDownValueWorkout == null
                            ? CustomText(
                                text: 'Choose Exercise',
                                size: 25,
                              )
                            : CustomText(
                                text: _dropDownValueWorkout,
                                size: 25,
                              ),
                        isExpanded: true,
                        // underline: SizedBox(),
                        iconSize: 30.0,
                        items: [
                          'Push Up',
                          'Sit Up',
                          'Yoink',
                        ].map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: CustomText(
                                text: val,
                                size: 25,
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(() {
                            _dropDownValueWorkout = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Goal Reps",
                                hintText: "10 reps",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Break Time",
                                hintText: "20 secs",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            print('fugg dd');
                          },
                          child: Container(
                            decoration: BoxDecoration(color: active, borderRadius: BorderRadius.circular(20)),
                            alignment: Alignment.center,
                            width: 200,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: CustomText(
                              text: "Add to Assignment",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ReorderableListView.builder(
                        itemCount: _workouts.length,
                        itemBuilder: (context, index) {
                          final String productName = _workouts[index];
                          return Card(
                            key: ValueKey(productName),
                            color: light,
                            elevation: 1,
                            margin: const EdgeInsets.all(3),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(5),
                              title: CustomText(
                                text: "$productName, break time: 20 sec",
                                weight: FontWeight.bold,
                              ),
                              // leading: Icon(Icons.drag_handle),
                              // trailing: Icon(Icons.drag_handle),
                              onTap: () {/* Do something else */},
                            ),
                          );
                        },
                        // The reorder function
                        onReorder: (oldIndex, newIndex) {
                          setState(() {
                            if (newIndex > oldIndex) {
                              newIndex = newIndex - 1;
                            }
                            final element = _workouts.removeAt(oldIndex);
                            _workouts.insert(newIndex, element);
                          });
                        }),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('fugg dd');
                },
                child: Container(
                  decoration: BoxDecoration(color: active, borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: CustomText(
                    text: "Assign",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
