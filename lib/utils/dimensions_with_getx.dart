import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  //height = 800
  //width = 360
  static final double _screenHeight = Get.height;
  static final double _screenWidth = Get.width;

  // Base design size from Figma
  static const double _mockupHeight = 917;
  static const double _mockupWidth = 412;

  // Scale factor
  static final double _heightRatio = _screenHeight / _mockupHeight;
  static final double _widthRatio = _screenWidth / _mockupWidth;

  static final double _fontRatio = _widthRatio * Get.textScaleFactor;
  //static double fontRatio = (widthRatio + heightRatio) / 2;

  //padding ratio
  static double padding70 = 70 * _heightRatio;
  static double padding10 = 10 * _heightRatio;
  static double padding15 = 15 * _heightRatio;
  static double padding20 = 20 * _heightRatio;

  //margin static double padding15 = screenHeight/58.2;
  static double margin15 = 15 * _heightRatio;

  //height ratio
  static double height5 = 5 * _heightRatio;
  static double height10 = 10 * _heightRatio;
  static double height15 = 15 * _heightRatio;
  static double height20 = 20 * _heightRatio;
  static double height30 = 30 * _heightRatio;
  static double height35 = 35 * _heightRatio;
  static double height40 = 40 * _heightRatio;
  static double height45 = 45 * _heightRatio;
  static double height50 = 50 * _heightRatio;
  static double height60 = 60 * _heightRatio;
  static double height70 = 70 * _heightRatio;
  static double height80 = 80 * _heightRatio;
  static double height100 = 100 * _heightRatio;
  static double height135 = 135 * _heightRatio;
  static double height150 = 150 * _heightRatio;
  static double height165 = 165 * _heightRatio;
  static double height275 = 275 * _heightRatio;
  static double height300 = 300 * _heightRatio;
  static double heightScreenHalf = 0.5 * _heightRatio;

  //width ratio
  static double width10 = 10 * _widthRatio;
  static double width15 = 15 * _widthRatio;
  static double width20 = 20 * _widthRatio;
  static double width35 = 35 * _widthRatio;
  static double width50 = 50 * _widthRatio;
  static double width100 = 100 * _widthRatio;
  static double width135 = 135 * _widthRatio;
  static double width145 = 145 * _widthRatio;
  static double width180 = 180 * _widthRatio;
  static double width200 = 200 * _widthRatio;
  static double width225 = 225 * _widthRatio;
  static double widthScreenHalf = 0.5 * _widthRatio;

  //font ratio
  static double font10 = 10 * _fontRatio;
  static double font12 = 12 * _fontRatio;
  static double font14 = 14 * _fontRatio;
  static double font15 = 15 * _fontRatio;
  static double font16 = 16 * _fontRatio;
  static double font20 = 20 * _fontRatio;
  static double font22 = 22 * _fontRatio;
  static double font24 = 24 * _fontRatio;
  static double font30 = 30 * _fontRatio;

  //radius ratio
  static double radius4 = 4 * _heightRatio;
  static double radius6 = 6 * _heightRatio;
  static double radius12 = 12 * _heightRatio;
  static double radius20 = 20 * _heightRatio;

  //icon ratio
  static double iconSize12 = 12 * _heightRatio;
  static double iconSize15 = 15 * _heightRatio;
  static double iconSize20 = 20 * _heightRatio;
  static double iconSize25 = 25 * _heightRatio;
  static double iconSize30 = 30 * _heightRatio;


  /// Use for vertical values like height, vertical padding/margin
  static double height(double value) => value * _heightRatio;

  /// Use for horizontal values like width, horizontal padding/margin
  static double width(double value) => value * _widthRatio;

  /// Use for font sizes
  static double font(double value) => value * _fontRatio;

  static double border(double value) => value * _widthRatio;

  /// Use for border radius
  static double radius(double value) => value * _widthRatio;

  /// Use for icon sizes
  static double icon(double value) => value * _widthRatio;

  /// Optional: Padding or margin abstraction if you want
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

  static EdgeInsets symetricPadding({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      EdgeInsets.symmetric(
        horizontal: width(horizontal),
        vertical: height(vertical),
      );

  static EdgeInsets allPadding(double padding) =>
      EdgeInsets.symmetric(
        horizontal: width(padding),
        vertical: height(padding),
      );
}
