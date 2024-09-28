import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.scale,
    headerAnimationLoop: false,
    title: 'Congrats!',
    titleTextStyle: const TextStyle(fontSize: 25),
    desc: 'You have successfully reset your password, please continue to login',
    descTextStyle: const TextStyle(fontSize: 16),
    btnOkOnPress: () {},
    btnOkText: 'Login',
    btnOkColor: Colors.red,
    customHeader: const Icon(
      Icons.done,
      size: 90,
      color: Colors.green,
    ),
  ).show();
}
