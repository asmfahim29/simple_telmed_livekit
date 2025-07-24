import 'package:flutter/material.dart';

class Dimensions {
  static late double _screenHeight;
  static late double _screenWidth;
  static late double _textScaleFactor;

  static const double _mockupHeight = 917;
  static const double _mockupWidth = 412;

  static late double _heightRatio;
  static late double _widthRatio;
  static late double _fontRatio;

  static bool _initialized = false;

  static void init(BuildContext context) {
    if (_initialized) return;

    final mediaQuery = MediaQuery.of(context);
    _screenHeight = mediaQuery.size.height;
    _screenWidth = mediaQuery.size.width;
    _textScaleFactor = MediaQuery.of(context).textScaler.scale(1.0);

    _heightRatio = _screenHeight / _mockupHeight;
    _widthRatio = _screenWidth / _mockupWidth;
    _fontRatio = _widthRatio * _textScaleFactor;

    _initialized = true;
  }

  static double height(double value) => value * _heightRatio;
  static double width(double value) => value * _widthRatio;
  static double font(double value) => value * _fontRatio;
  static double border(double value) => value * _widthRatio;
  static double radius(double value) => value * _widthRatio;
  static double icon(double value) => value * _widthRatio;

  static EdgeInsets padding({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: width(left),
        right: width(right),
        top: height(top),
        bottom: height(bottom),
      );

  static EdgeInsets symmetricPadding({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      EdgeInsets.symmetric(
        horizontal: width(horizontal),
        vertical: height(vertical),
      );

  static EdgeInsets allPadding(double padding) => EdgeInsets.symmetric(
    horizontal: width(padding),
    vertical: height(padding),
  );
}
