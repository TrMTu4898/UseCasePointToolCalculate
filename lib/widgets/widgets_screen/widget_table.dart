import 'package:flutter/material.dart';

class WidgetTable extends StatelessWidget {
  final List<List<String>> data;
  final List<String> header;

  const WidgetTable({Key? key, required this.data, required this.header});

  @override
  Widget build(BuildContext context) {
    double radiusCircular = 10.0;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radiusCircular),
        // Rounded corners
      ),
      child: Column(

        children: [
          buildHeaderRow(),
          buildDataRow(),
        ],
      ),
    );
  }

  Widget buildHeaderRow() {
    double radiusCircular = 10.0;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF50C2C9), // Background color of the header row
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusCircular),
          topRight: Radius.circular(radiusCircular),
          bottomRight: Radius.circular(radiusCircular),
          bottomLeft: Radius.circular(radiusCircular),
        ),
      ),
      child: Row(
        children: header.asMap().entries.map((entry) {
          int index = entry.key;
          String columnName = entry.value;
          double? columnWidth = index == 2 ? 25 : null; // Set width for column 2

          return Expanded(
            flex: index == 2 ? 0 : 1, // Allow column 2 to take its fixed width, let others expand
            child: Container(
              alignment: Alignment.center,
              width: columnWidth,
              padding: const EdgeInsets.only(left: 0, right: 0,top:15,bottom: 10),
              child: Text(
                columnName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildDataRow() {
    return Padding(
      padding: const EdgeInsets.all(
      0
      ),
      child: Column(
        children: data.map((rowData) {
          int rowIndex = data.indexOf(rowData);
          bool isDividerVisible = rowIndex == 2;

          return Row(
            children: rowData.asMap().entries.map((entry) {
              int index = entry.key;
              String cellData = entry.value;
              double? columnWidth = index == 2 ? 50.0 : null; // Set width for column 2

              return Expanded(
                flex: index == 2 ? 0 : 1, // Allow column 2 to take its fixed width, let others expand
                child: Container(
                  alignment: Alignment.center,
                  width: columnWidth,
                  padding: const EdgeInsets.only(left: 5, right: 5 , top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    border: isDividerVisible ? const Border(bottom: BorderSide(color: Color(0xFFD9D9D9))) : null,
                  ),
                  child: Text(
                    cellData,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
