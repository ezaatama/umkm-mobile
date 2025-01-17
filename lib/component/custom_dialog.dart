import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:umkm/component/button_disabled.dart';
import 'package:umkm/component/button_outlined.dart';
import 'package:umkm/component/button_primary.dart';
import 'package:umkm/component/custom_textfield.dart';
import 'package:umkm/utils/constant.dart';

showDialogLatLang(BuildContext context) {
  showDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      barrierColor: ColorUI.BLACK.withOpacity(0.5),
      builder: (context) {
        return const CustomDialogLatLang();
      });
}

class CustomDialogLatLang extends StatelessWidget {
  const CustomDialogLatLang({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Dialog(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.fromLTRB(24, 20, 20, 20),
                decoration: BoxDecoration(
                    color: ColorUI.WHITE,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                        "Anda punya titik koordinat latitude & longitude lokasi tempat usaha Anda?",
                        textAlign: TextAlign.justify,
                        style: BLACK_TEXT_STYLE.copyWith(
                            fontSize: 14,
                            fontWeight: FontUI.WEIGHT_SEMI_BOLD,
                            color: ColorUI.BLACK)),
                    const SizedBox(height: 5),
                    Text(
                        "Contoh titik koordinat latitude & longitude seperti ini: 6.1754, 106.8272",
                        textAlign: TextAlign.left,
                        style: BLACK_TEXT_STYLE.copyWith(
                            fontSize: 12,
                            fontWeight: FontUI.WEIGHT_NORMAL,
                            color: ColorUI.GREY_TEXT)),
                    const SizedBox(height: 32),
                    Text(
                      'Latitude',
                      style: CAPTION_TEXT_STYLE.copyWith(
                          fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      onChanged: (String? newValue) {},
                      validator: (value) {
                        return null;
                      },
                      hintText: "Masukkan Latitude",
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Longitude',
                      style: CAPTION_TEXT_STYLE.copyWith(
                          fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      onChanged: (String? newValue) {},
                      validator: (value) {
                        return null;
                      },
                      hintText: "Masukkan Longitude",
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            OutlineButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: 'Batal'),
                          ],
                        )),
                        const SizedBox(width: 10),
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            DisabledButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: 'Periksa',
                            ),
                          ],
                        ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

showDialogPrevious(BuildContext context) {
  showDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      barrierColor: ColorUI.BLACK.withOpacity(0.5),
      builder: (context) {
        return const CustomDialogConfirmPrevious();
      });
}

class CustomDialogConfirmPrevious extends StatelessWidget {
  const CustomDialogConfirmPrevious({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Dialog(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.fromLTRB(24, 20, 20, 20),
                decoration: BoxDecoration(
                    color: ColorUI.WHITE,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Anda yakin kembali ke halaman sebelumnya?",
                        textAlign: TextAlign.center,
                        style: BLACK_TEXT_STYLE.copyWith(
                            fontSize: 14,
                            fontWeight: FontUI.WEIGHT_SEMI_BOLD,
                            color: ColorUI.BLACK)),
                    const SizedBox(height: 5),
                    Text(
                        "Jangan khawatir, data yang telah Anda masukkan akan tersimpan otomatis",
                        textAlign: TextAlign.center,
                        style: BLACK_TEXT_STYLE.copyWith(
                            fontSize: 12,
                            fontWeight: FontUI.WEIGHT_NORMAL,
                            color: ColorUI.GREY_TEXT)),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            OutlineButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: 'Tetap di Sini'),
                          ],
                        )),
                        const SizedBox(width: 10),
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            PrimaryButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              text: 'Ya, Kembali',
                            ),
                          ],
                        ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
