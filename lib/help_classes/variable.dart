import 'package:flutter/widgets.dart';

class MyVariables {
  static const String pathToBackGroundBlue = 'assets/png/background_blue.png';
  static const String strName = 'Полное имя';
  static const String strEmail = 'Email';
  static const String strPassword = 'Пароль';
  static const String strConfirmPassword = 'Подтвердите ароль';
  static const String strAcquainted = 'Привет! \n Давай знакомиться';


  static double? _screenHeight;
  static double? _screenWidth;

  static void _initializeScreenSize(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
  }

  static double get screenHeight {
    if (_screenHeight == null) {
      throw Exception(
          "Screen size not initialized. Call initScreenSize first.");
    }
    return _screenHeight!;
  }

  static double get screenWidth {
    if (_screenWidth == null) {
      throw Exception(
          "Screen size not initialized. Call initScreenSize first.");
    }
    return _screenWidth!;
  }

  static void initScreenSize(BuildContext context) {
    if (_screenHeight == null || _screenWidth == null) {
      _initializeScreenSize(context);
    }
  }
}
