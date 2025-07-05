import 'package:flutter/material.dart';

void buildBar(BuildContext context, String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), closeIconColor: color ?? Colors.red),
  );
}
