import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 450,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
        ],
      ),
    );
  }
}
