class DummyAgama {
  static String selectedValue = '';

  static List<String> agama = [
    "Islam",
    "Kristen",
    "Katolik",
    "Konghucu",
  ];
}

class DummyPerkawinan {
  static String selectedValue = '';

  static List<String> statusKawin = [
    "Lajang",
    "Menikah",
    "Duda",
    "Janda",
  ];
}

class DummyPendidikan {
  static String selectedValue = '';

  static List<String> pendidikan = [
    "SD",
    "SMP",
    "SMA/K",
    "D3",
    "S1",
    "S2",
    "S3"
  ];
}

class DummyBisnis {
  static String selectedValue = '';

  static List<String> bisnis = [
    "Bisnis A",
    "Bisnis B",
    "Bisnis C",
    "Bisnis D",
  ];
}

class DummyPendapatan {
  static String selectedValue = '';

  static List<String> pendapatan = [
    "0 - 1.000.000",
    "1.000.000 - 5.000.000",
    "5.000.000 - 10.000.000",
  ];
}

class DummyPengeluaran {
  static String selectedValue = '';

  static List<String> pengeluaran = [
    "0 - 1.000.000",
    "1.000.000 - 5.000.000",
    "5.000.000 - 10.000.000",
  ];
}

class DummyTujuanRekening {
  static String selectedValue = '';

  static List<String> tujuanPembuatan = [
    "Investasi",
    "Masa Depan",
    "Jaminan Hari Tua",
  ];
}

class DummySumberDana {
  static String selectedValue = '';

  static List<String> sumberDana = [
    "Dana Pribadi",
    "Dana Orang Tua",
    "Investasi",
  ];
}

class DummyJenisKelamin {
  bool isSelected;
  String text;

  DummyJenisKelamin({this.isSelected = false, required this.text});
}

int jkValue = 1;

final List<DummyJenisKelamin> jkStatus = [
  DummyJenisKelamin(text: "Laki-Laki"),
  DummyJenisKelamin(text: "Perempuan"),
];

class DummyKriteria {
  static String selectedValue = '';

  static List<String> kriteria = [
    "Kriteria 1",
    "Kriteria 2",
    "Kriteria 3",
  ];
}

class DummyQR {
  static String selectedValue = '';

  static List<String> qr = [
    "QR Sticker",
    "QR Manual",
  ];
}

class DummyProduk {
  static String selectedValue = '';

  static List<String> produk = [
    "Mikro",
    "Makro",
  ];
}

class DummySubProduk {
  static String selectedValue = '';

  static List<String> subProduk = [
    "KUR",
    "KIR",
  ];
}

class DummyCabang {
  static String selectedValue = '';

  static List<String> cabang = [
    "KCP WALIKOTA JAKARTA PUSAT",
    "KCP WALIKOTA JAKARTA TIMUR",
    "KCP WALIKOTA JAKARTA SELATAN",
  ];
}

class DummyPlafon {
  static String selectedValue = '';

  static List<String> plafon = [
    "Plafon A",
    "Plafon B",
    "Plafon C",
  ];
}

class DummyJangkaWaktu {
  bool isSelected;
  String text;

  DummyJangkaWaktu({this.isSelected = false, required this.text});
}

int jwValue = 1;

final List<DummyJangkaWaktu> jwStatus = [
  DummyJangkaWaktu(text: "12 Bulan"),
  DummyJangkaWaktu(text: "24 Bulan"),
  DummyJangkaWaktu(text: "36 Bulan"),
];
