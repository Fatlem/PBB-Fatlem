class Karyawan {
  String npp; // not nullable
  String nama;
  String? alamat; // nullable
  int thnMasuk;
  int _gaji = 2900000;
  // konstruktor
  Karyawan(this.npp, this.nama, {this.thnMasuk = 2015});
  void presensi(DateTime jamMasuk) {
    if (jamMasuk.hour > 8) {
      print("$nama datang terlambat");
    } else {
      print("$nama datang tepat waktu");
    }
  }

  String deskripsi() {
    String teks = """=================================   
          NPP: $npp   
          Nama: $nama   
          Gaji: $_gaji;     """;
    return teks;
  }
}
