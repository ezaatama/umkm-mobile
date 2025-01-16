import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:umkm/utils/constant.dart';

class CardRegist extends StatelessWidget {
  const CardRegist(
      {super.key,
      required this.title,
      required this.tahap,
      required this.onTap});

  final String tahap;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorUI.WHITE,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: ColorUI.GREY_TEXT.withOpacity(0.5),
              offset: const Offset(
                4.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tahap,
                      style: GREY_TEXT_STYLE.copyWith(
                          fontWeight: FontUI.WEIGHT_NORMAL)),
                  const SizedBox(height: 4),
                  Text(title,
                      style: BLACK_TEXT_STYLE.copyWith(
                          fontWeight: FontUI.WEIGHT_NORMAL)),
                  const SizedBox(height: 12),
                  LinearPercentIndicator(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: MainAxisAlignment.spaceBetween,
                    lineHeight: 12,
                    percent: 60 / 100,
                    animation: true,
                    trailing: Text('60%',
                        style: BLACK_TEXT_STYLE.copyWith(
                            fontSize: 18, fontWeight: FontUI.WEIGHT_SEMI_BOLD)),
                    progressColor: ColorUI.GREEN,
                    barRadius: const Radius.circular(15),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                    color: ColorUI.DARK_GREY),
              ],
            )
          ],
        ),
      ),
    );
  }
}
