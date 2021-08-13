import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

/// Example without datasource
class Clientstable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [BoxShadow(offset: Offset(0, 6), color: lightGrey.withOpacity(.1), blurRadius: 12)],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 30),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: [
            DataColumn2(
              label: Text("Name"),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('Assignment Completion'),
            ),
            DataColumn(
              label: Text('Health Check Rating'),
            ),
            DataColumn(
              label: Text(''),
            ),
          ],
          rows: List<DataRow>.generate(
              15,
              (index) => DataRow(cells: [
                    DataCell(CustomText(text: "William Lee")),
                    DataCell(CustomText(text: "80%")),
                    DataCell(CustomText(text: "4.5")),
                    DataCell(Container(
                        decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red, width: .5),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: CustomText(
                          text: "Remove",
                          color: Colors.red.withOpacity(0.7),
                          weight: FontWeight.bold,
                        ))),
                  ]))),
    );
  }
}
