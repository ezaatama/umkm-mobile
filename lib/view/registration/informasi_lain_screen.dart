import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:umkm/component/button_disabled.dart';
import 'package:umkm/component/custom_textfield.dart';
import 'package:umkm/model/dummy_models.dart';
import 'package:umkm/utils/constant.dart';

class InformasiLainScreen extends StatefulWidget {
  const InformasiLainScreen({super.key});

  @override
  State<InformasiLainScreen> createState() => _InformasiLainScreenState();
}

class _InformasiLainScreenState extends State<InformasiLainScreen> {
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
                    Text("Tahap 2",
                        style: GREY_TEXT_STYLE.copyWith(
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            fontWeight: FontUI.WEIGHT_NORMAL)),
                    Text("Informasi Lainnya",
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
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Email Anda",
                style: CAPTION_TEXT_STYLE.copyWith(
                    fontSize: 16, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
              ),
              const SizedBox(height: 5),
              CustomTextField(
                onSaved: (value) {},
                onChanged: (String? newValue) {},
                hintText: "nama@email.com",
              ),
              const SizedBox(height: 20),
              Text(
                "Status Pendidikan",
                style: CAPTION_TEXT_STYLE.copyWith(
                    fontSize: 16, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
              ),
              const SizedBox(height: 5),
              DummyPendidikan.pendidikan.isNotEmpty
                  ? DropdownButtonFormField2<String>(
                      hint: Text(
                        "Pilih Status Pendidikan",
                        style: GREY_TEXT_STYLE.copyWith(fontSize: 14),
                      ),
                      isExpanded: true,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.only(left: 0, top: 20),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorUI.GREY_BORDER),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: ColorUI.PRIMARY),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: ColorUI.PRIMARY),
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
                      value: DummyPendidikan.selectedValue.isEmpty
                          ? 'SD'
                          : DummyPendidikan.selectedValue,
                      onChanged: (newValue) {},
                      items: DummyPendidikan.pendidikan.map((e) {
                        return DropdownMenuItem<String>(
                            value: e,
                            child:
                                Text(e, style: const TextStyle(fontSize: 14)));
                      }).toList())
                  : const SizedBox(),
              const SizedBox(height: 20),
              Text(
                "NPWP (Wajib Diisi)",
                style: CAPTION_TEXT_STYLE.copyWith(
                    fontSize: 16, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
              ),
              const SizedBox(height: 5),
              CustomTextField(
                onSaved: (value) {},
                onChanged: (String? newValue) {},
                hintText: "Masukkan NPWP",
              ),
              const SizedBox(height: 20),
              Text(
                "Nama Gadis Ibu Kandung",
                style: CAPTION_TEXT_STYLE.copyWith(
                    fontSize: 16, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
              ),
              const SizedBox(height: 5),
              CustomTextField(
                onSaved: (value) {},
                onChanged: (String? newValue) {},
                hintText: "Masukkan Nama Gadis Ibu Kandung",
              ),
            ],
          )),
          DisabledButton(
              text: "Lanjut ke Pekerjaan & Finansial", onPressed: () {})
        ],
      ),
    );
  }
}
