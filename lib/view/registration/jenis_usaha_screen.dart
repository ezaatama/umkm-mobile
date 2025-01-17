import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umkm/component/button_disabled.dart';
import 'package:umkm/component/custom_dialog.dart';
import 'package:umkm/component/custom_textfield.dart';
import 'package:umkm/component/jangka_waktu.dart';
import 'package:umkm/model/dummy_models.dart';
import 'package:umkm/utils/constant.dart';

class JenisUsahaScreen extends StatefulWidget {
  const JenisUsahaScreen({super.key});

  @override
  State<JenisUsahaScreen> createState() => _JenisUsahaScreenState();
}

class _JenisUsahaScreenState extends State<JenisUsahaScreen> {
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
                title: Column(
                  children: [
                    Text("Tahap 4",
                        style: GREY_TEXT_STYLE.copyWith(
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            fontWeight: FontUI.WEIGHT_NORMAL)),
                    Text("Jenis Usaha",
                        style: BLACK_TEXT_STYLE.copyWith(
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            fontWeight: FontUI.WEIGHT_NORMAL))
                  ],
                ),
                leading: IconButton(
                    onPressed: () {
                      showDialogPrevious(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    color: ColorUI.BLACK),
              ),
              body:
                  SafeArea(child: LayoutBuilder(builder: (context, constraint) {
                return RefreshIndicator(
                  onRefresh: () async {},
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [Expanded(child: _bodyContent())]),
                      ),
                    ),
                  ),
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
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [Expanded(child: _bodyContent())]),
                ),
              ),
            ),
          );
        })),
      ),
    );
  }

  Widget _bodyContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Informasi Usaha",
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 16, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 20),
          Text(
            'Kriteria Jenis Usaha (Opsional)',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummyKriteria.kriteria.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Kriteria",
                    style: GREY_TEXT_STYLE.copyWith(fontSize: 14),
                  ),
                  isExpanded: true,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(left: 0, top: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.GREY_BORDER),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.PRIMARY),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: ColorUI.PRIMARY),
                        borderRadius: BorderRadius.circular(4.0)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorUI.GREY_BORDER),
                        borderRadius: BorderRadius.circular(4.0)),
                    filled: true,
                    fillColor: ColorUI.WHITE,
                  ),
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  validator: (value) {
                    return null;
                  },
                  onSaved: (value) {},
                  value: DummyKriteria.selectedValue.isEmpty
                      ? 'Kriteria 1'
                      : DummyKriteria.selectedValue,
                  onChanged: (newValue) {},
                  items: DummyKriteria.kriteria.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: const TextStyle(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          const SizedBox(height: 20),
          Text(
            'Pilih Jenis QR',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummyQR.qr.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih QR",
                    style: GREY_TEXT_STYLE.copyWith(fontSize: 14),
                  ),
                  isExpanded: true,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(left: 0, top: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.GREY_BORDER),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.PRIMARY),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: ColorUI.PRIMARY),
                        borderRadius: BorderRadius.circular(4.0)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorUI.GREY_BORDER),
                        borderRadius: BorderRadius.circular(4.0)),
                    filled: true,
                    fillColor: ColorUI.WHITE,
                  ),
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  validator: (value) {
                    return null;
                  },
                  onSaved: (value) {},
                  value: DummyQR.selectedValue.isEmpty
                      ? 'QR Sticker'
                      : DummyQR.selectedValue,
                  onChanged: (newValue) {},
                  items: DummyQR.qr.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: const TextStyle(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          const SizedBox(height: 20),
          Text(
            "Nama Usaha",
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            onSaved: (value) {},
            onChanged: (String? newValue) {},
            hintText: "Masukkan Nama Usaha",
          ),
          const SizedBox(height: 20),
          Text(
            "Nomor Telepon Usaha (Opsional)",
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onSaved: (value) {},
            onChanged: (String? newValue) {},
            hintText: "08123456789",
          ),
          //INFORMASI TEMPAT USAHA
          const SizedBox(height: 25),
          Text(
            "Informasi Tempat Usaha",
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 16, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 20),
          Text(
            'Alamat Tempat Usaha',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: 'Tulis Alamat Tempat Usaha',
                  contentPadding: const EdgeInsets.only(left: 0, top: 12),
                  prefix: const Padding(padding: EdgeInsets.only(left: 12.0)),
                  hintStyle:
                      GREY_TEXT_STYLE.copyWith(fontWeight: FontUI.WEIGHT_LIGHT),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: ColorUI.PRIMARY)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: ColorUI.GREY_BORDER)),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ColorUI.PRIMARY),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: ColorUI.GREY_BORDER))),
              validator: (value) {
                return null;
              }),
          const SizedBox(height: 20),
          //PROVINSI
          //KOTA
          //KECAMATAN
          //KELURAHAN
          const SizedBox(height: 20),
          Text(
            "Kode POS",
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onSaved: (value) {},
            onChanged: (String? newValue) {},
            hintText: "Masukkan Kode POS",
          ),
          const SizedBox(height: 20),
          Text(
            "Lokasi Tempat Usaha",
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          _lokasiTempat(() {
            showDialogLatLang(context);
          }, "Masukkan Latitude dan Longitude"),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .10,
                margin: const EdgeInsets.only(right: 5),
                child: Divider(
                  thickness: 2,
                  color: ColorUI.LIGHT_GREY,
                ),
              ),
              Text(
                "atau",
                style: GREY_TEXT_STYLE.copyWith(
                    fontSize: 12, fontWeight: FontUI.WEIGHT_NORMAL),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .10,
                margin: const EdgeInsets.only(left: 5),
                child: Divider(
                  thickness: 2,
                  color: ColorUI.LIGHT_GREY,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          _lokasiTempat(() {}, "Tentukan Titik di Peta"),
          const SizedBox(height: 20),
          _fotoLokasi(() {}, "Ambil Foto Lokasi Usaha (Opsional)",
              "Mohon Ambil Foto Lokasi Usaha"),

          //PERBANKAN
          const SizedBox(height: 25),
          Text(
            "Informasi Perbankan",
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 16, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 20),
          Text(
            'Produk',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummyProduk.produk.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Produk",
                    style: GREY_TEXT_STYLE.copyWith(fontSize: 14),
                  ),
                  isExpanded: true,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(left: 0, top: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.GREY_BORDER),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.PRIMARY),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: ColorUI.PRIMARY),
                        borderRadius: BorderRadius.circular(4.0)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorUI.GREY_BORDER),
                        borderRadius: BorderRadius.circular(4.0)),
                    filled: true,
                    fillColor: ColorUI.LIGHT_GREY,
                  ),
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  validator: (value) {
                    return null;
                  },
                  onSaved: (value) {},
                  value: DummyProduk.selectedValue.isEmpty
                      ? 'Mikro'
                      : DummyProduk.selectedValue,
                  onChanged: (newValue) {},
                  items: DummyProduk.produk.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e,
                            style: GREY_TEXT_STYLE.copyWith(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          const SizedBox(height: 20),
          Text(
            'Sub-Produk',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummySubProduk.subProduk.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Sub Produk",
                    style: GREY_TEXT_STYLE.copyWith(fontSize: 14),
                  ),
                  isExpanded: true,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(left: 0, top: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.GREY_BORDER),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.PRIMARY),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: ColorUI.PRIMARY),
                        borderRadius: BorderRadius.circular(4.0)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorUI.GREY_BORDER),
                        borderRadius: BorderRadius.circular(4.0)),
                    filled: true,
                    fillColor: ColorUI.LIGHT_GREY,
                  ),
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  validator: (value) {
                    return null;
                  },
                  onSaved: (value) {},
                  value: DummySubProduk.selectedValue.isEmpty
                      ? 'KUR'
                      : DummySubProduk.selectedValue,
                  onChanged: (newValue) {},
                  items: DummySubProduk.subProduk.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e,
                            style: GREY_TEXT_STYLE.copyWith(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          const SizedBox(height: 20),
          Text(
            'Cabang Bank DKI',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummyCabang.cabang.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Cabang",
                    style: GREY_TEXT_STYLE.copyWith(fontSize: 14),
                  ),
                  isExpanded: true,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(left: 0, top: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.GREY_BORDER),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.PRIMARY),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: ColorUI.PRIMARY),
                        borderRadius: BorderRadius.circular(4.0)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorUI.GREY_BORDER),
                        borderRadius: BorderRadius.circular(4.0)),
                    filled: true,
                    fillColor: ColorUI.LIGHT_GREY,
                  ),
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  validator: (value) {
                    return null;
                  },
                  onSaved: (value) {},
                  value: DummyCabang.selectedValue.isEmpty
                      ? 'KCP WALIKOTA JAKARTA PUSAT'
                      : DummyCabang.selectedValue,
                  onChanged: (newValue) {},
                  items: DummyCabang.cabang.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e,
                            style: GREY_TEXT_STYLE.copyWith(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          const SizedBox(height: 20),
          Text(
            'Jangka Waktu',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: JangkaWaktu(
                    item: jwStatus[0],
                    value: 1,
                    groupValue: jkValue,
                    onChanged: (int? value) {
                      setState(() {
                        jkValue = value!;
                      });
                      print(value);
                    }),
              ),
              Flexible(
                child: JangkaWaktu(
                    item: jwStatus[1],
                    value: 2,
                    groupValue: jkValue,
                    onChanged: (int? value) {
                      setState(() {
                        jkValue = value!;
                      });
                      print(value);
                    }),
              ),
              Flexible(
                child: JangkaWaktu(
                    item: jwStatus[2],
                    value: 3,
                    groupValue: jkValue,
                    onChanged: (int? value) {
                      setState(() {
                        jkValue = value!;
                      });
                      print(value);
                    }),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Plafon',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummyPlafon.plafon.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Plafon",
                    style: GREY_TEXT_STYLE.copyWith(fontSize: 14),
                  ),
                  isExpanded: true,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(left: 0, top: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.GREY_BORDER),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: ColorUI.PRIMARY),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: ColorUI.PRIMARY),
                        borderRadius: BorderRadius.circular(4.0)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorUI.GREY_BORDER),
                        borderRadius: BorderRadius.circular(4.0)),
                    filled: true,
                    fillColor: ColorUI.WHITE,
                  ),
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  validator: (value) {
                    return null;
                  },
                  onSaved: (value) {},
                  value: DummyPlafon.selectedValue.isEmpty
                      ? 'Plafon A'
                      : DummyPlafon.selectedValue,
                  onChanged: (newValue) {},
                  items: DummyPlafon.plafon.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e,
                            style: GREY_TEXT_STYLE.copyWith(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          const SizedBox(height: 20),
          Text(
            'Profil Singkat Usaha',
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
            hintText: "Masukkan Profil Usaha",
          ),
          const SizedBox(height: 20),
          Text(
            'Nomor Perizinan Mendirikan Usaha',
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
            hintText: "Masukkan Nomor Perizinan",
          ),

          const SizedBox(height: 20),
          DisabledButton(text: "Selesai", onPressed: () {})
        ],
      ),
    );
  }

  Widget _lokasiTempat(Function() onTap, String text) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 74, vertical: 18),
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: ColorUI.GREY_BORDER),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(text,
                style: PRIMARY_TEXT_STYLE.copyWith(
                    fontSize: 12, fontWeight: FontUI.WEIGHT_SEMI_BOLD))),
      ),
    );
  }

  Widget _fotoLokasi(Function() onTap, String title, String description) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: BoxDecoration(
            color: ColorUI.SECONDARY, borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: BLACK_TEXT_STYLE.copyWith(
                        fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD)),
                const SizedBox(height: 5),
                Text(description,
                    style: GREY_TEXT_STYLE.copyWith(
                        fontSize: 10, fontWeight: FontUI.WEIGHT_NORMAL)),
              ],
            )),
            SvgPicture.asset("assets/images/ic_camera.svg", fit: BoxFit.cover)
          ],
        ),
      ),
    );
  }
}
