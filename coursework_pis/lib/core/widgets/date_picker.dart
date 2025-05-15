import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../presentation/academic_load/widgets/date_picker.dart';
import 'custom_text_form_field.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.hintText,
    required this.currentDate,
    required this.dateController,
    required this.changeDat,
  });
  final String hintText;
  final DateTime currentDate;
  final TextEditingController dateController;
  final Function(DateTime) changeDat;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomTextFormField(
          readOnly: true,
          controller: dateController,
          hintText: hintText,
        ),
        Positioned.fill(
          child: MyDatePicker(
            currentDate: currentDate,
            changeDate: changeDat,
          ),
        ),
      ],
    );
  }
}
