import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:umkm/model/dummy_models.dart';
import 'package:umkm/utils/constant.dart';

class PekerjaanFinansialScreen extends StatefulWidget {
  const PekerjaanFinansialScreen({super.key});

  @override
  State<PekerjaanFinansialScreen> createState() =>
      _PekerjaanFinansialScreenState();
}

class _PekerjaanFinansialScreenState extends State<PekerjaanFinansialScreen> {
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
                    Text("Tahap 3",
                        style: GREY_TEXT_STYLE.copyWith(
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            fontWeight: FontUI.WEIGHT_NORMAL)),
                    Text("Pekerjaan & Finansial",
                        style: BLACK_TEXT_STYLE.copyWith(
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            fontWeight: FontUI.WEIGHT_NORMAL))
                  ],
                ),
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
            "Pekerjaan (Opsional)",
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 16, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 20),
          Text(
            'Jenis Bisnis',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummyBisnis.bisnis.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Jenis Bisnis",
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
                  value: DummyBisnis.selectedValue.isEmpty
                      ? 'Bisnis A'
                      : DummyBisnis.selectedValue,
                  onChanged: (newValue) {},
                  items: DummyBisnis.bisnis.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: const TextStyle(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          const SizedBox(height: 20),
          Text(
            'Alamat Tempat Kerja',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: 'Tulis Alamat Tempat Kerja',
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
          //     const SizedBox(height: 20),
          // Text(
          //   'Nomor Handphone Kerja',
          //   style: CAPTION_TEXT_STYLE.copyWith(
          //       fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          // ),
          // const SizedBox(height: 5),
          const SizedBox(height: 20),
          Text(
            "Finansial (Opsional)",
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 16, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 20),
          Text(
            'Pendapatan Rata-Rata Bulanan',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummyPendapatan.pendapatan.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Pendapatan Rata-Rata Bulanan",
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
                  value: DummyPendapatan.selectedValue.isEmpty
                      ? '0 - 1.000.000'
                      : DummyPendapatan.selectedValue,
                  onChanged: (newValue) {},
                  items: DummyPendapatan.pendapatan.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: const TextStyle(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          const SizedBox(height: 20),
          Text(
            'Pengeluaran Rata-Rata Bulanan',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummyPengeluaran.pengeluaran.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Pengeluaran Rata-Rata Bulanan",
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
                  value: DummyPengeluaran.selectedValue.isEmpty
                      ? '0 - 1.000.000'
                      : DummyPengeluaran.selectedValue,
                  onChanged: (newValue) {},
                  items: DummyPengeluaran.pengeluaran.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: const TextStyle(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          const SizedBox(height: 20),
          Text(
            'Tujuan Pembuatan Rekening',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummyTujuanRekening.tujuanPembuatan.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Tujuan Pembuatan Rekening",
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
                  value: DummyTujuanRekening.selectedValue.isEmpty
                      ? 'Investasi'
                      : DummyTujuanRekening.selectedValue,
                  onChanged: (newValue) {},
                  items: DummyTujuanRekening.tujuanPembuatan.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: const TextStyle(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          Text(
            'Sumber Dana',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummySumberDana.sumberDana.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Sumber Dana",
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
                  value: DummySumberDana.selectedValue.isEmpty
                      ? 'Investasi'
                      : DummySumberDana.selectedValue,
                  onChanged: (newValue) {},
                  items: DummySumberDana.sumberDana.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: const TextStyle(fontSize: 14)));
                  }).toList())
              : const SizedBox()
        ],
      ),
    );
  }
}
