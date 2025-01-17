import 'package:flutter/material.dart';
import 'package:umkm/model/dummy_models.dart';
import 'package:umkm/utils/constant.dart';

class JenisKelamin extends StatefulWidget {
  const JenisKelamin(
      {Key? key,
      required this.value,
      required this.groupValue,
      this.onChanged,
      this.item})
      : super(key: key);
  final int value;
  final int groupValue;
  final void Function(int?)? onChanged;
  final DummyJenisKelamin? item;

  @override
  State<JenisKelamin> createState() => _JenisKelaminState();
}

class _JenisKelaminState extends State<JenisKelamin> {
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
                ? ColorUI.SECONDARY
                : Colors.transparent,
            border: Border.all(
                width: 1.0,
                color: widget.value == widget.groupValue
                    ? ColorUI.PRIMARY
                    : ColorUI.GREY_BORDER),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .040,
                    height: MediaQuery.of(context).size.height * .020,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      color: widget.value == widget.groupValue
                          ? ColorUI.PRIMARY.withOpacity(0.20)
                          : Colors.transparent,
                      border: Border.all(
                          width: 1.0,
                          color: widget.value == widget.groupValue
                              ? ColorUI.PRIMARY
                              : ColorUI.GREY_BORDER),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .020,
                    height: MediaQuery.of(context).size.height * .010,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      color: widget.value == widget.groupValue
                          ? ColorUI.PRIMARY
                          : Colors.transparent,
                      border: Border.all(
                          width: 1.0,
                          color: widget.value == widget.groupValue
                              ? ColorUI.PRIMARY
                              : ColorUI.GREY_BORDER),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
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
