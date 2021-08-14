import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/clients/widgets/clients_table.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Center(
                  // Aligns the container to center
                  child: Container(
                    // A simplified version of dialog.
                    width: ResponsiveWidget.isSmallScreen(context)
                        ? MediaQuery.of(context).size.width * 0.9
                        : MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(200),
                      ),
                      color: Colors.orange,
                    ),
                    child: Material(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Add New Student',
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                              DropdownButton(
                                hint: _dropDownValue == null
                                    ? CustomText(text: 'Choose Team')
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
                              //!
                              // TextField(
                              //   decoration: InputDecoration(
                              //     labelText: "Student Name",
                              //     // hintText: "",
                              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              //   ),
                              // ),
                              TypeAheadField(
                                textFieldConfiguration: TextFieldConfiguration(
                                    autofocus: false,
                                    // style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.italic),
                                    decoration: InputDecoration(border: OutlineInputBorder())),
                                suggestionsCallback: (pattern) async {
                                  //@William just an example call
                                  return await StateService.getSuggestions(pattern);
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    leading: Icon(Icons.add),
                                    title: Text(suggestion),
                                  );
                                },
                                onSuggestionSelected: (suggestion) {
                                  print('suggestion tapped');
                                },
                              ),
                              DataTable2(
                                columnSpacing: 12,
                                horizontalMargin: 12,
                                minWidth: 600,
                                columns: [
                                  DataColumn2(
                                    label: Text("Name"),
                                    size: ColumnSize.L,
                                  ),
                                  DataColumn(
                                    label: Text(''),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  3,
                                  (index) => DataRow(
                                    cells: [
                                      DataCell(CustomText(text: "\$student name")),
                                      DataCell(
                                        Container(
                                          decoration: BoxDecoration(
                                            color: light,
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                              color: Colors.red,
                                              width: .5,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                          child: CustomText(
                                            text: "REMOVE",
                                            color: Colors.red.withOpacity(.7),
                                            weight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    print('on tap tapped');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(color: active, borderRadius: BorderRadius.circular(20)),
                                    alignment: Alignment.center,
                                    width: double.maxFinite,
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: CustomText(
                                      text: "Add",
                                      color: Colors.white,
                                    ),
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
            ),
          );
        },
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
                        ? CustomText(text: 'Choose Team')
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

class StateService {
  static final List<String> states = [
    'Jerry Lee',
    'William Park',
    'Beam Alonzo',
    'Angelina Brown',
    'Ben Siraj',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(states);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
