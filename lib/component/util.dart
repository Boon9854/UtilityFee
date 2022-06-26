import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import 'animations.dart';
import 'on_loading_dialog.dart';


class Util {
  final currencyFormat = NumberFormat("#,##0.00", "en_US");
  final currencyFormatWithoutDecimal = NumberFormat("#,##0", "en_US");

  static Future<void> onLoading(text, context, {Widget imageWidget = const SizedBox()}) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return OnLoadingDialog(
          text: text,
          imageWidget: Image.asset(
            "images/general/undraw_traveling.png",
            width: Constant.screenWidth * 0.7,
          ),
        );
      },
    );
  }

  static void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static void callToast(text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  String convertToMoneyFormat(String number) {
    NumberFormat format = currencyFormat;
    var result = format.format(number);

    return result;
  }

  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static Future switchPage(BuildContext context, Widget pageName, {String stopPoint = ""}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        settings: stopPoint == "" ? null : RouteSettings(name: stopPoint),
        builder: (context) => pageName,
      ),
    );
  }

  static Future switchPageReplacement(BuildContext context, Widget pageName, {String stopPoint = ""}) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        settings: stopPoint == "" ? null : RouteSettings(name: stopPoint),
        builder: (context) => pageName,
      ),
    );
  }

  static Future switchPageAnimation(BuildContext context, Widget pageName, {String stopPoint = "", int direction = 1}) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        settings: stopPoint == "" ? null : RouteSettings(name: stopPoint),
        pageBuilder: (context, animation, secondaryAnimation) => pageName,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          if (direction == 1) {
            return Animations.fromLeft(animation, secondaryAnimation, child);
          }
          if (direction == 2) {
            return Animations.fromTop(animation, secondaryAnimation, child);
          }
          return Animations.fromLeft(animation, secondaryAnimation, child);
        },
      ),
    );
  }

  Future switchPageReplacementAnimation(BuildContext context, Widget pageName,
      {String stopPoint = ""}) {
    return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        settings: stopPoint == "" ? null : RouteSettings(name: stopPoint),
        pageBuilder: (context, animation, secondaryAnimation) => pageName,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.fromLeft(animation, secondaryAnimation, child);
        },
      ),
    );
  }
}
