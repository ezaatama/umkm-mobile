import 'package:flutter/material.dart';
import 'package:umkm/model/dummy_models.dart';
import 'package:umkm/utils/constant.dart';

class JangkaWaktu extends StatefulWidget {
  const JangkaWaktu(
      {Key? key,
      required this.value,
      required this.groupValue,
      this.onChanged,
      this.item})
      : super(key: key);
  final int value;
  final int groupValue;
  final void Function(int?)? onChanged;
  final DummyJangkaWaktu? item;

  @override
  State<JangkaWaktu> createState() => _JangkaWaktuState();
}

class _JangkaWaktuState extends State<JangkaWaktu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool selected = widget.value != widget.groupValue;
        if (selected) {
          widget.onChanged!(widget.value);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        child: Container(
          width: MediaQuery.of(context).size.width * .50,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            color: widget.value == widget.groupValue
                ? ColorUI.LIGHT_GREY
                : ColorUI.LIGHT_GREY.withOpacity(0.4),
            border: Border.all(
                width: 1.0,
                color: widget.value == widget.groupValue
                    ? ColorUI.LIGHT_GREY
                    : ColorUI.LIGHT_GREY),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.item!.text,
                  style: GREY_TEXT_STYLE.copyWith(
                      fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD))
            ],
          ),
        ),
      ),
    );
  }
}
