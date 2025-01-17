import 'package:flutter/material.dart';
import 'package:umkm/utils/constant.dart';

Widget makeDismiss(BuildContext context, {required Widget child}) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.pop(context),
    child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: child),
  );
}

List<Widget> notchBottomSheet() {
  return [
    const SizedBox(height: 12.0),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 8),
          width: 50,
          height: 5,
          decoration: const BoxDecoration(
            color: ColorUI.GREY_BORDER,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ],
    ),
    const SizedBox(height: 30.0),
  ];
}
