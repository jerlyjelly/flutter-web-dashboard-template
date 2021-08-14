import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/clients/widgets/clients_table.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key key}) : super(key: key);

  @override
  _ClientsPageState createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  String _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Add Student'),
        icon: Icon(Icons.add),
      ),
      body: Container(
        child: Column(
          children: [
            Obx(
              () => Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                      child: CustomText(
                        text: menuController.activeItem.value,
                        size: 24,
                        weight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    hint: _dropDownValue == null
                        ? CustomText(text: 'Team 1')
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
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _dropDownValue = val;
                        },
                      );
                    },
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => Center(
                          // Aligns the container to center
                          child: Container(
                            // A simplified version of dialog.
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(200),
                              ),
                              color: Colors.orange,
                            ),
                            child: Material(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Add New Team',
                                      size: 24,
                                      weight: FontWeight.bold,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: "Team Name",
                                        hintText: "Team 1",
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print('on tap tapped');
                                      },
                                      child: Container(
                                        decoration:
                                            BoxDecoration(color: active, borderRadius: BorderRadius.circular(20)),
                                        alignment: Alignment.center,
                                        width: double.maxFinite,
                                        padding: EdgeInsets.symmetric(vertical: 16),
                                        child: CustomText(
                                          text: "Add",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: active,
                    ),
                    icon: Icon(Icons.add, size: 18),
                    label: Text("Add Team"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Clientstable(),
            ),
          ],
        ),
      ),
    );
  }
}
