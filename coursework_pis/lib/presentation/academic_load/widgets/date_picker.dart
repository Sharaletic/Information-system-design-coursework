import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker({
    super.key,
    required this.currentDate,
    required this.changeDate,
  });

  final DateTime currentDate;
  final Function(DateTime date) changeDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime now = DateTime.now();
        final selectedDate = await DatePicker.showSimpleDatePicker(
          context,
          firstDate: DateTime(now.year - 30),
          lastDate: now,
          dateFormat: "dd-MMMM-yyyy",
          locale: DateTimePickerLocale.ru,
          looping: true,
        );

        if (selectedDate != null) {
          changeDate(selectedDate);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
