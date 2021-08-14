import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('yeet'),
        ],
      ),
    );
  }
}
