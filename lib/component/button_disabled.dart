import 'package:flutter/material.dart';
import 'package:umkm/utils/constant.dart';

class DisabledButton extends StatelessWidget {
  const DisabledButton(
      {super.key, required this.text, required this.onPressed, this.margin});

  final String text;
  final Function() onPressed;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ColorUI.DARK_GREY,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            text,
            style: WHITE_TEXT_STYLE.copyWith(
              fontSize: 16,
              fontWeight: FontUI.WEIGHT_NORMAL,
              letterSpacing: 1.15,
            ),
          )),
    );
  }
}
