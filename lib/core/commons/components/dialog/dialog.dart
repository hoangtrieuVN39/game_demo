// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:app/core/commons.dart';
import 'package:app/core/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showPlatformDialog({
  required BuildContext context,
  String? title,
  required AppNavigation navigation,
  String? message,
  Function? confirmation,
  bool isComfirm = false,
}) {
  return showDialog(
      context: context,
      builder: (context) => Platform.isIOS
          ? _buildForIOS(
              context, title, message, isComfirm, confirmation, navigation)
          : _buildForAndroid(
              context, title, message, isComfirm, confirmation, navigation));
}

CupertinoAlertDialog _buildForIOS(
    BuildContext context,
    String? title,
    String? message,
    bool isComfirm,
    Function? confirmation,
    AppNavigation navigation) {
  return CupertinoAlertDialog(
    title: title != null ? Text(title) : null,
    content: message != null
        ? Padding(
            padding: const EdgeInsets.all(12),
            child: Text(message),
          )
        : Container(
            color: Colors.white,
          ),
    actions: [
      if (isComfirm)
        CupertinoDialogAction(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Theme.of(context).colorScheme.mainAppBarCustom,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            navigation.pop();
          },
        ),
      CupertinoDialogAction(
        onPressed: () {
          if (confirmation != null) {
            confirmation();
          }
          navigation.pop();
        },
        child: Text(
          'OK',
          style: TextStyle(
            color: Theme.of(context).colorScheme.mainAppBarCustom,
            fontSize: 17,
          ),
        ),
      ),
    ],
  );
}

AlertDialog _buildForAndroid(
    BuildContext context,
    String? title,
    String? message,
    bool isComfirm,
    Function? confirmation,
    AppNavigation navigation) {
  return AlertDialog(
    title: title != null ? Text(title) : null,
    content: Padding(
      padding: const EdgeInsets.all(12),
      child: Text(message ?? ''),
    ),
    actions: [
      if (isComfirm)
        ElevatedButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Theme.of(context).colorScheme.mainAppBarCustom,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            navigation.pop();
          },
        ),
      ElevatedButton(
        child: Text(
          'OK',
          style: TextStyle(
            color: Theme.of(context).colorScheme.mainAppBarCustom,
            fontSize: 17,
          ),
        ),
        onPressed: () {
          if (confirmation != null) {
            confirmation();
          }
          navigation.pop();
        },
      ),
    ],
  );
}
