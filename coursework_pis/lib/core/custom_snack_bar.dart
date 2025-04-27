import 'package:coursework_pis/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(context, message, AppColors.primaryColor);
  }

  static void showInfo(BuildContext context, String message) {
    _showSnackBar(context, message, AppColors.primaryColor);
  }

  static void showError(BuildContext context, String message) {
    _showSnackBar(context, message, AppColors.primaryColor);
  }

  static void _showSnackBar(BuildContext context, String message, Color color) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.whiteColor),
            ),
            backgroundColor: color,
          ),
        );
      },
    );
  }
}
