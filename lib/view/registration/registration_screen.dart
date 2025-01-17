import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umkm/component/button_primary.dart';
import 'package:umkm/component/card_regist.dart';
import 'package:umkm/utils/constant.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        List<ConnectivityResult> connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return Stack(
          fit: StackFit.expand,
          children: [
            Scaffold(
              backgroundColor: ColorUI.WHITE,
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    color: ColorUI.BLACK),
              ),
              body:
                  SafeArea(child: LayoutBuilder(builder: (context, constraint) {
                return RefreshIndicator(
                  onRefresh: () async {},
                  child: SingleChildScrollView(child: _bodyContent()),
                );
              })),
            ),
            Positioned(
              height: 24.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: connected
                  ? const SizedBox()
                  : Container(
                      color: const Color(0xFFEE4400),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("You're offline",
                                style: WHITE_TEXT_STYLE.copyWith(
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontUI.WEIGHT_SEMI_BOLD)),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
      child: Scaffold(
        backgroundColor: ColorUI.WHITE,
        body: SafeArea(child: LayoutBuilder(builder: (context, constraint) {
          return RefreshIndicator(
            onRefresh: () async {},
            child: SingleChildScrollView(child: _bodyContent()),
          );
        })),
      ),
    );
  }

  Widget _bodyContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
              text: TextSpan(
                  text: 'Ayo lengkapi Formulir Registrasi dan nikmati ',
                  style: TextStyle(
                      color: ColorUI.BLACK,
                      fontSize: 20,
                      fontWeight: FontUI.WEIGHT_BOLD),
                  children: <TextSpan>[
                TextSpan(
                  text: 'cicilan 3% per tahun',
                  style: TextStyle(color: ColorUI.PRIMARY, fontSize: 20),
                )
              ])),
          const SizedBox(height: 24),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset("assets/images/ic_identitas.svg",
                          fit: BoxFit.cover),
                      Container(
                        width: 2, // Lebar divider
                        height: MediaQuery.of(context).size.height *
                            .080, // Tinggi divider
                        color: ColorUI.GREY_TEXT, // Warna divider
                      ),
                    ],
                  ),
                  Flexible(
                      child: CardRegist(
                          onTap: () {
                            Navigator.pushNamed(context, '/identitas-diri');
                          },
                          tahap: "Tahap 1",
                          title: "Identitas Diri"))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset("assets/images/ic_identitas.svg",
                          fit: BoxFit.cover),
                      Container(
                        width: 2, // Lebar divider
                        height: MediaQuery.of(context).size.height *
                            .080, // Tinggi divider
                        color: ColorUI.GREY_TEXT, // Warna divider
                      ),
                    ],
                  ),
                  Flexible(
                      child: CardRegist(
                          onTap: () {
                            Navigator.pushNamed(context, '/informasi-lain');
                          },
                          tahap: "Tahap 2",
                          title: "Informasi Lainnya"))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset("assets/images/ic_pekerjaan.svg",
                          fit: BoxFit.cover),
                      Container(
                        width: 2, // Lebar divider
                        height: MediaQuery.of(context).size.height *
                            .080, // Tinggi divider
                        color: ColorUI.GREY_TEXT, // Warna divider
                      ),
                    ],
                  ),
                  Flexible(
                      child: CardRegist(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/pekerjaan-finansial');
                          },
                          tahap: "Tahap 3",
                          title: "Pekerjaan & Finansial"))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset("assets/images/ic_jenisusaha.svg",
                          fit: BoxFit.cover),
                    ],
                  ),
                  Flexible(
                      child: CardRegist(
                          onTap: () {
                            Navigator.pushNamed(context, '/jenis-usaha');
                          },
                          tahap: "Tahap 4",
                          title: "Jenis Usaha"))
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          PrimaryButton(text: "Mulai Pengisian Formulir", onPressed: () {})
        ],
      ),
    );
  }
}
