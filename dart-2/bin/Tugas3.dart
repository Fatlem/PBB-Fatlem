void main() {
  nimNama('A11.2022.14624', 'Faathir El Tasleem', 85, 80, 90);
}

int calculate() {
  return 6 * 7;
}

void loop(int a) {
  for (var i = 0; i < a; i++) {
    print("halo");
  }
}

void bio(String nim, String nama, String alamat, String kota, int kodepos) {
  print("NIM      : $nim");
  print("nama     : $nama");
  print("Alamat   : $alamat");
  print("Kota     : $kota");
  print("Kode Pos : $kodepos");
}

void luasPersegi(double s) {
  double l = s * s;
  print('Luas Persegi dengan sisi $s adalah: $l');
}

void luaslingkaran(double r) {
  double phi = 3.14;
  double l = phi * r * r;
  print('Luas Lingkaran dengan radius $r adalah: $l');
}

void luasKubus(double s) {
  double l = 6 * s * s;
  print('Luas Kubus dengan sisi $s adalah: $l');
}

void hitungNilai(double nilaiTugas, double nilaiUas, double nilaiUts) {
  double pNilaiTugas = nilaiTugas * 0.35;
  double pNilaiUts = nilaiUts * 0.3;
  double pNilaiUas = nilaiUas * 0.35;
  double nilaiAkhir = pNilaiTugas + pNilaiUas + pNilaiUts;
  cetakNilai(pNilaiTugas, pNilaiUts, pNilaiUas, nilaiAkhir);
}

void cetakNilai(
    double pNilaiTugas, double pNilaiUts, double pNilaiUas, double nilaiAkhir) {
  print('Nilai Tugas (35%) : $pNilaiTugas');
  print('Nilai UTS (30%)   : $pNilaiUts');
  print('Nilai UAS (35%)   : $pNilaiUas');
  print('Nilai Akhir       : $nilaiAkhir');
  print('Nilai Huruf       : ' + getNilaiHuruf(nilaiAkhir));
  print('Predikat          : ' + getPredikat(getNilaiHuruf(nilaiAkhir)));
}

String getNilaiHuruf(double nilaiAkhir) {
  if (nilaiAkhir >= 85) {
    return "A";
  } else if (nilaiAkhir >= 80) {
    return "AB";
  } else if (nilaiAkhir >= 70) {
    return "B";
  } else if (nilaiAkhir >= 60) {
    return "BC";
  } else if (nilaiAkhir >= 50) {
    return "C";
  } else if (nilaiAkhir >= 40) {
    return "D";
  } else {
    return "E";
  }
}

String getPredikat(String nilaiHuruf) {
  if (nilaiHuruf == 'A') {
    return "memuaskan";
  } else if (nilaiHuruf == 'AB') {
    return "Sangat Baik";
  } else if (nilaiHuruf == 'B') {
    return "Baik";
  } else if (nilaiHuruf == 'BC') {
    return "Cukup Baik";
  } else if (nilaiHuruf == 'C') {
    return "Cukup";
  } else if (nilaiHuruf == 'D') {
    return "buruk";
  } else {
    return "Kecewa";
  }
}

void nimNama(String nim, String nama, double nilaiUts, double nilaiTugas,
    double nilaiUas) {
  print("NIM          : $nim");
  print("Nama         : $nama");
  print("Nilai Tugas  : $nilaiTugas");
  print("Nilai UTS    : $nilaiUts");
  print("Nilai UAS    : $nilaiUas");
  hitungNilai(nilaiTugas, nilaiUas, nilaiUts);
}
