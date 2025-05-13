import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomSnackBar {
  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(context, message, AppColors.snackBarGreen, 'Успешно');
  }

  static void showInfo(BuildContext context, String message) {
    _showSnackBar(context, message, AppColors.snackBarBlue, 'Сообщение');
  }

  static void showError(BuildContext context, String message) {
    _showSnackBar(context, message, AppColors.snackBarRed, 'Ошибка');
  }

  static void _showSnackBar(
      BuildContext context, String message, Color color, String title) {
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      title: title,
      message: message,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(15.0),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: color,
    ).show(context);
  }
}
