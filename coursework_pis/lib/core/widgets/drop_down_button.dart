import 'package:coursework_pis/core/utils/app_strings.dart';
import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class DropDownButton<T> extends StatelessWidget {
  const DropDownButton({
    super.key,
    required this.items,
    required this.dropDownValue,
    required this.onChanged,
    required this.hintText,
  });
  final List<DropdownMenuItem<T>> items;
  final T? dropDownValue;
  final Function(T?) onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<T>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: AppColors.errorColor,
              width: 2.0,
            ),
          ),
        ),
        hint: Text(
          hintText,
          style: TextTheme.of(context).bodyLarge,
        ),
        items: items,
        validator: (value) => value == null ? AppStrings.required : null,
        value: dropDownValue,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 20,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 20, right: 20),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down, size: 25),
          iconEnabledColor: AppColors.primaryColor,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: const EdgeInsets.only(left: 20, right: 20),
          maxHeight: 200,
          width: MediaQuery.of(context).size.width * 0.92,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.whiteColor,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
