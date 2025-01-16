import 'package:flutter/material.dart';

class ColorUI {
  static const Color PRIMARY = Color(0xFFA12128);
  static const Color SECONDARY = Color(0xFFFDF0F1);
  static const Color WHITE = Color(0xFFFFFFFF);
  static const Color BLACK = Color(0xFF000000);
  static const Color GREY_BUTTON = Color(0xFFB5C0CB);
  static const Color GREY_TEXT = Color(0xFF99A6B8);
  static const Color LIGHT_GREY = Color(0xFFF3F7FB);
  static const Color DARK_GREY = Color(0xFF68788D);
  static const Color TEXT_GREY = Color(0xFF68788D);
  static const Color TEXT_CAPTION = Color(0xFF333333);
  static const Color GREY_BORDER = Color(0xFFD9DCE4);
  static const Color GREEN = Color(0xFF19C29A);
}

class FontUI {
  static const FontWeight WEIGHT_LIGHT = FontWeight.w300;
  static const FontWeight WEIGHT_SEMI_LIGHT = FontWeight.w400;
  static const FontWeight WEIGHT_NORMAL = FontWeight.w500;
  static const FontWeight WEIGHT_SEMI_BOLD = FontWeight.w600;
  static const FontWeight WEIGHT_BOLD = FontWeight.w700;
}

TextStyle PRIMARY_TEXT_STYLE = TextStyle(color: ColorUI.PRIMARY);
TextStyle WHITE_TEXT_STYLE = TextStyle(color: ColorUI.WHITE);
TextStyle BLACK_TEXT_STYLE = TextStyle(color: ColorUI.BLACK);
TextStyle GREY_TEXT_STYLE = TextStyle(color: ColorUI.TEXT_GREY);
TextStyle CAPTION_TEXT_STYLE = TextStyle(color: ColorUI.TEXT_CAPTION);
