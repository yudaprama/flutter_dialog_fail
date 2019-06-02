library dialog_fail;

import 'dart:async';

import 'package:flutter/material.dart';

void snackBar(_scaffoldKey, label) {
  _scaffoldKey.currentState.showSnackBar(
    SnackBar(
      content: Text(label),
      backgroundColor: Colors.red,
    ),
  );
}

dialogFail(BuildContext context, String content) {
  Future.delayed(const Duration(seconds: 1), () {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Gagal'),
          content: Text(content),
          actions: <Widget> [
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  });
}

unDismissDialog(BuildContext context, String content, VoidCallback onPressed) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () {},
        child: new AlertDialog(
          title: Text(content),
          actions: <Widget>[
            FlatButton(
              onPressed: onPressed,
              child: new Text('OK'),
            ),
          ],
        ),
      );
    },
  );
}