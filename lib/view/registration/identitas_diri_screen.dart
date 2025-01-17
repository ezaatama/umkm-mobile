import 'package:camera/camera.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:umkm/component/button_disabled.dart';
import 'package:umkm/component/camera_ktp.dart';
import 'package:umkm/component/camera_selfie.dart';
import 'package:umkm/component/custom_calendar.dart';
import 'package:umkm/component/custom_dialog.dart';
import 'package:umkm/component/custom_textfield.dart';
import 'package:umkm/component/jenis_kelamin.dart';
import 'package:umkm/model/dummy_models.dart';
import 'package:umkm/utils/constant.dart';
import 'package:umkm/utils/extension.dart';

class IdentitasDiriScreen extends StatefulWidget {
  const IdentitasDiriScreen({super.key});

  @override
  State<IdentitasDiriScreen> createState() => _IdentitasDiriScreenState();
}

class _IdentitasDiriScreenState extends State<IdentitasDiriScreen> {
  bool _isExpanded = false;
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
                    Text("Tahap 1",
                        style: GREY_TEXT_STYLE.copyWith(
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            fontWeight: FontUI.WEIGHT_NORMAL)),
                    Text("Identitas Diri",
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
          //KTP
          GestureDetector(
            onTap: () async {
              await availableCameras().then(
                (value) {
                  if (value.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Tidak terdeteksi Kamera")));
                    return;
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CameraKTP(camera: value[0])));
                },
              ).catchError((e) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Terdapat kesalahan: $e")));
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .25,
              decoration: BoxDecoration(
                  color: ColorUI.DARK_GREY.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'NIK',
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
              onChanged: (String? newValue) {},
              validator: (value) {
                return null;
              },
              hintText: "Masukkan NIK"),
          const SizedBox(height: 20),
          Text(
            'Nama Lengkap/Pemilik Outlet',
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
            hintText: "Masukkan Nama Lengkap/Pemilik Outlet",
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Tempat Lahir',
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
                    hintText: "Masukkan Tempat Lahir",
                  ),
                ],
              )),
              const SizedBox(width: 10),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Tanggal Lahir',
                    style: CAPTION_TEXT_STYLE.copyWith(
                        fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
                  ),
                  const SizedBox(height: 5),
                  CustomCalendar(
                      readOnly: true,
                      hintText: "dd/mm/yyyy",
                      hintStyle: GREY_TEXT_STYLE.copyWith(fontSize: 14),
                      onTap: () async {
                        sheetRange();
                      })
                ],
              ))
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Jenis Kelamin',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: JenisKelamin(
                    item: jkStatus[0],
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
                child: JenisKelamin(
                    item: jkStatus[1],
                    value: 2,
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
            'Alamat Sesuai E-KTP',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: 'Tulis Alamat KTP',
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
          Text(
            'Agama',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummyAgama.agama.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Agama",
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
                  value: DummyAgama.selectedValue.isEmpty
                      ? 'Islam'
                      : DummyAgama.selectedValue,
                  onChanged: (newValue) {},
                  items: DummyAgama.agama.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: const TextStyle(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          const SizedBox(height: 20),
          Text(
            'Status Perkawinan',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          DummyPerkawinan.statusKawin.isNotEmpty
              ? DropdownButtonFormField2<String>(
                  hint: Text(
                    "Pilih Status Perkawinan",
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
                  value: DummyPerkawinan.selectedValue.isEmpty
                      ? 'Lajang'
                      : DummyPerkawinan.selectedValue,
                  onChanged: (newValue) {},
                  items: DummyPerkawinan.statusKawin.map((e) {
                    return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: const TextStyle(fontSize: 14)));
                  }).toList())
              : const SizedBox(),
          const SizedBox(height: 20),
          Text(
            'Nomor Handphone Usaha/Pemilik Outlet',
            style: CAPTION_TEXT_STYLE.copyWith(
                fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
          ),
          const SizedBox(height: 5),
          TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  hintText: '8123456789',
                  contentPadding: const EdgeInsets.only(left: 0, top: 12),
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(left: 12.0, right: 8.0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: ColorUI.LIGHT_GREY,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "+62",
                      style: GREY_TEXT_STYLE.copyWith(
                        fontWeight: FontUI.WEIGHT_NORMAL,
                      ),
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
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
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded; // Toggle status
              });
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Data Pasangan",
                      style: CAPTION_TEXT_STYLE.copyWith(
                          fontSize: 16, fontWeight: FontUI.WEIGHT_SEMI_BOLD)),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0.0, // Rotasi 180 derajat
                    duration: Duration(milliseconds: 300),
                    child: Icon(
                      Icons.expand_more, // Ikon panah ke bawah
                      color: Colors.grey,
                    ),
                  ),
                ]),
          ),
          if (_isExpanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                _dataFotoPasangan(() async {
                  await availableCameras().then(
                    (value) {
                      if (value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Tidak terdeteksi Kamera")));
                        return;
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CameraKTP(camera: value[0])));
                    },
                  ).catchError((e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Terdapat kesalahan: $e")));
                  });
                }, "Ambil Foto E-KTP Pasangan",
                    "Mohon Ambil Foto E-KTP Pasangan Anda"),
                const SizedBox(height: 5),
                _dataFotoPasangan(() async {
                  await availableCameras().then(
                    (value) {
                      if (value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Tidak terdeteksi Kamera")));
                        return;
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CameraSelfie(camera: value[1])));
                    },
                  ).catchError((e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Terdapat kesalahan: $e")));
                  });
                }, "Ambil Foto Selfie Pasangan",
                    "Mohon Ambil Selfie Pasangan Anda"),
                const SizedBox(height: 20),
                Text(
                  'NIK',
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
                    onChanged: (String? newValue) {},
                    validator: (value) {
                      return null;
                    },
                    hintText: "Masukkan NIK"),
                const SizedBox(height: 20),
                Text(
                  'Nama Lengkap',
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
                  hintText: "Masukkan Nama Lengkap",
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Tempat Lahir',
                          style: CAPTION_TEXT_STYLE.copyWith(
                              fontSize: 14,
                              fontWeight: FontUI.WEIGHT_SEMI_BOLD),
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          textInputAction: TextInputAction.next,
                          onChanged: (String? newValue) {},
                          validator: (value) {
                            return null;
                          },
                          hintText: "Masukkan Tempat Lahir",
                        ),
                      ],
                    )),
                    const SizedBox(width: 10),
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Tanggal Lahir',
                          style: CAPTION_TEXT_STYLE.copyWith(
                              fontSize: 14,
                              fontWeight: FontUI.WEIGHT_SEMI_BOLD),
                        ),
                        const SizedBox(height: 5),
                        CustomCalendar(
                            readOnly: true,
                            hintText: "dd/mm/yyyy",
                            hintStyle: GREY_TEXT_STYLE.copyWith(fontSize: 14),
                            onTap: () async {
                              sheetRange();
                            })
                      ],
                    ))
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Jenis Kelamin',
                  style: CAPTION_TEXT_STYLE.copyWith(
                      fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: JenisKelamin(
                          item: jkStatus[0],
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
                      child: JenisKelamin(
                          item: jkStatus[1],
                          value: 2,
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
                  'Alamat Pasangan Sesuai E-KTP',
                  style: CAPTION_TEXT_STYLE.copyWith(
                      fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
                ),
                const SizedBox(height: 5),
                TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                        hintText: 'Tulis Alamat Pasangan Sesuai KTP',
                        contentPadding: const EdgeInsets.only(left: 0, top: 12),
                        prefix:
                            const Padding(padding: EdgeInsets.only(left: 12.0)),
                        hintStyle: GREY_TEXT_STYLE.copyWith(
                            fontWeight: FontUI.WEIGHT_LIGHT),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: ColorUI.PRIMARY)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: ColorUI.GREY_BORDER)),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: ColorUI.PRIMARY),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: ColorUI.GREY_BORDER))),
                    validator: (value) {
                      return null;
                    }),
                const SizedBox(height: 20),
                Text(
                  'Agama',
                  style: CAPTION_TEXT_STYLE.copyWith(
                      fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
                ),
                const SizedBox(height: 5),
                DummyAgama.agama.isNotEmpty
                    ? DropdownButtonFormField2<String>(
                        hint: Text(
                          "Pilih Agama",
                          style: GREY_TEXT_STYLE.copyWith(fontSize: 14),
                        ),
                        isExpanded: true,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.only(left: 0, top: 20),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: ColorUI.GREY_BORDER),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: ColorUI.PRIMARY),
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
                        value: DummyAgama.selectedValue.isEmpty
                            ? 'Islam'
                            : DummyAgama.selectedValue,
                        onChanged: (newValue) {},
                        items: DummyAgama.agama.map((e) {
                          return DropdownMenuItem<String>(
                              value: e,
                              child: Text(e,
                                  style: const TextStyle(fontSize: 14)));
                        }).toList())
                    : const SizedBox(),
                const SizedBox(height: 20),
                Text(
                  'NPWP Pasangan',
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
                    onChanged: (String? newValue) {},
                    validator: (value) {
                      return null;
                    },
                    hintText: "Masukkan NPWP"),
                const SizedBox(height: 20),
                Text(
                  'Nomor Handphone Pasangan',
                  style: CAPTION_TEXT_STYLE.copyWith(
                      fontSize: 14, fontWeight: FontUI.WEIGHT_SEMI_BOLD),
                ),
                const SizedBox(height: 5),
                TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        hintText: '8123456789',
                        contentPadding: const EdgeInsets.only(left: 0, top: 12),
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(left: 12.0, right: 8.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: ColorUI.LIGHT_GREY,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            "+62",
                            style: GREY_TEXT_STYLE.copyWith(
                              fontWeight: FontUI.WEIGHT_NORMAL,
                            ),
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                        hintStyle: GREY_TEXT_STYLE.copyWith(
                            fontWeight: FontUI.WEIGHT_LIGHT),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: ColorUI.PRIMARY)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: ColorUI.GREY_BORDER)),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: ColorUI.PRIMARY),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: ColorUI.GREY_BORDER))),
                    validator: (value) {
                      return null;
                    }),
                const SizedBox(height: 20),
                _dataFotoPasangan(() {}, "Ambil Foto Kartu Keluarga (Opsional)",
                    "Mohon Ambil Foto Kartu Keluarga Anda"),
                const SizedBox(height: 20),
                DisabledButton(
                    text: "Lanjut ke Informasi Lainnya", onPressed: () {})
              ],
            )
        ],
      ),
    );
  }

  Widget _dataFotoPasangan(Function() onTap, String title, String description) {
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

  void sheetRange() {
    showModalBottomSheet(
        barrierColor: ColorUI.BLACK.withOpacity(0.2),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return makeDismiss(
            context,
            child: StatefulBuilder(builder: (context, setStater) {
              return DraggableScrollableSheet(
                  initialChildSize: 0.6,
                  minChildSize: 0.6,
                  maxChildSize: 1.0,
                  builder: (context, controller) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                          color: ColorUI.WHITE,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          )),
                      child: Stack(
                        children: [
                          ...notchBottomSheet(),
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: SfDateRangePicker(
                              view: DateRangePickerView.month,
                              selectionMode:
                                  DateRangePickerSelectionMode.single,
                              showActionButtons: true,
                              backgroundColor: Colors.transparent,
                              selectionColor: ColorUI.PRIMARY,
                              todayHighlightColor: ColorUI.PRIMARY,
                              headerStyle: const DateRangePickerHeaderStyle(
                                  backgroundColor: Colors.transparent),
                              onSubmit: (val) {
                                setStater(() {});
                                Navigator.pop(context);
                              },
                              onCancel: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  });
            }),
          );
        }).then((value) {
      setState(() {});
    });
  }
}
