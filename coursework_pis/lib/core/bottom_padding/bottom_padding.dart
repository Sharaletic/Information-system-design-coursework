import 'package:flutter/material.dart';

double getBottomPadding(BuildContext context) {
  final safeBottomPadding = MediaQuery.of(context).padding.bottom;
  final bottomPadding = (safeBottomPadding + 8) * 2 + 50;
  return bottomPadding;
}
