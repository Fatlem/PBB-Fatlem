import 'package:intl/intl.dart';

// konstanta
const UMR = 2900000;

enum TipeJabatan { kabag, manajer, direktur }

var formater = NumberFormat("#,000");
var dateFormater = DateFormat('yyyy-MM-dd');

abstract class Staff {
  String npp;
  String nama;
  String? alamat; // nullable
  int thnMasuk;
  int _gaji = UMR;

  // constructor with formal initialization
  Staff(this.npp, this.nama, {this.thnMasuk = 2015});

  // abstract getter
  int get tunjangan;

  // setter
  set gaji(int gaji) {
    if (gaji < UMR) {
      _gaji = UMR;
      print('Gaji tidak boleh di bawah UMR');
    } else if (((2023 - thnMasuk) < 5) && (gaji != UMR)) {
      _gaji = UMR;
      print('Gaji pegawai baru harus sesuai UMR');
    } else {
      _gaji = gaji;
    }
  }

  // getter
  int get gaji {
    return _gaji + tunjangan;
  }

  // abstract function
  String deskripsi();
  void absenMasuk(DateTime jamMasuk);
}

class Karyawan extends Staff {
  // konstruktor
  Karyawan(super.npp, super.nama, {super.thnMasuk = 2015});
  void absenMasuk(DateTime jamMasuk) {
    if (jamMasuk.hour > 8) {
      print('$nama pada ${dateFormater.format(jamMasuk)} datang Terlambat');
    } else {
      print('$nama pada ${dateFormater.format(jamMasuk)} datang Tepat waktu');
    }
  }

  // arrow function
  int get tunjangan => ((2023 - thnMasuk) < 5) ? 1000000 : 2000000;
  String deskripsi() {
    String teks = '''========================================
    NPP: $npp
    Nama: $nama
    Gaji: ${formater.format(gaji)}
    ''';
    if (alamat != null) {
      teks += "Alamat: $alamat";
    }
    return teks;
  }
}

class Pejabat extends Staff {
  TipeJabatan jabatan;

  Pejabat(super.npp, super.nama, this.jabatan, {super.thnMasuk = 2015});
  void absenMasuk(DateTime jamMasuk) {
    if (jamMasuk.hour > 9) {
      print('$nama pada ${dateFormater.format(jamMasuk)} datang Terlambat');
    } else {
      print('$nama pada ${dateFormater.format(jamMasuk)} datang Tepat waktu');
    }
  }

  String deskripsi() {
    String teks = '''========================================
    NPP: $npp
    Nama: $nama
    Jabatan: ${jabatan.name}
    Gaji: ${formater.format(gaji)}
    ''';
    if (alamat != null) {
      teks += "Alamat: $alamat";
    }
    return teks;
  }

  int get tunjangan {
    switch (jabatan) {
      case TipeJabatan.kabag:
        return 10000000;
      case TipeJabatan.manajer:
        return 15000000;
      case TipeJabatan.direktur:
        return 20000000;
      default:
        return 0;
    }
  }
}
