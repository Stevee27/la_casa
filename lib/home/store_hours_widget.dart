import 'package:flutter/material.dart';
import 'package:la_casa/models/StoreHours.dart';

class StoreHoursWidget extends StatelessWidget {
  const StoreHoursWidget({Key? key, required this.storeHours}) : super(key: key);

  final List<StoreHours> storeHours;

  @override
  Widget build(BuildContext context) {
    final tableRows = <TableRow>[];
    storeHours.asMap().forEach((index, day) => {
          tableRows.add(TableRow(key: ValueKey(day.order), children: [
            Container(
                padding: const EdgeInsets.all(2.0),
                color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[50],
                child: Text(day.dayOfWeek!,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))),
            Container(
                padding: const EdgeInsets.all(2.0),
                color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[50],
                child: Text(day.from!,
                    textAlign: TextAlign.center,
                    style: day.from == 'Closed'
                        ? const TextStyle(
                            color: Colors.red, fontSize: 15, fontWeight: FontWeight.w700)
                        : const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))),
            Container(
                padding: const EdgeInsets.all(2.0),
                color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[50],
                child: Text(day.to!,
                    textAlign: TextAlign.center,
                    style: day.to == 'Closed'
                        ? const TextStyle(
                            color: Colors.red, fontSize: 15, fontWeight: FontWeight.w700)
                        : const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))),
          ]))
        });
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(100),
            1: FixedColumnWidth(100),
            2: FixedColumnWidth(100),
          },
          children: tableRows,
          // border: TableBorder.all(color: Color.fromRGBO(200, 200, 200, 1)),
          border: TableBorder.all(color: Colors.grey.shade500),
        ));
  }
}
