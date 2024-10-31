import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void mikuSnackBar(
  BuildContext context, {
  required String title,
  required String message,
  required ContentType contentType,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final mikuBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(mikuBar);
}
