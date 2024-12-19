class Mahasiswa {
  String _nim;
  String _nama;
  int _nilaiTugas;
  int _nilaiUts;
  int _nilaiUas;

  Mahasiswa(
      this._nim, this._nama, this._nilaiTugas, this._nilaiUts, this._nilaiUas);

  double get pNilaiTugas => _nilaiTugas * 0.35;
  double get pNilaiUts => _nilaiUts * 0.3;
  double get pNilaiUas => _nilaiUas * 0.35;
  double get nilaiAkhir => pNilaiTugas + pNilaiUts + pNilaiUas;

  String getNilaiHuruf(double nilaiAkhir) {
    if (nilaiAkhir > 85) return 'A';
    if (nilaiAkhir > 80) return 'AB';
    if (nilaiAkhir > 75) return 'B';
    if (nilaiAkhir > 60) return 'BC';
    if (nilaiAkhir > 50) return 'C';
    if (nilaiAkhir > 40) return 'D';
    return 'E';
  }

  String getPredikat(String nilaiHuruf) {
    switch (nilaiHuruf) {
      case 'A':
        return 'Memuaskan';
      case 'AB':
        return 'Sangat Baik';
      case 'B':
        return 'Baik';
      case 'BC':
        return 'Kurang Baik';
      case 'C':
        return 'Cukup';
      case 'D':
        return 'Dapat';
      default:
        return 'E';
    }
  }

  void cetakNilai() {
    print('NIM: $_nim');
    print('Nama: $_nama');
    print('Nilai Tugas: $_nilaiTugas');
    print('Nilai UTS: $_nilaiUts');
    print('Nilai UAS: $_nilaiUas');
    print('Nilai Akhir: ${nilaiAkhir}');
    String huruf = getNilaiHuruf(nilaiAkhir);
    print('Huruf: $huruf');
    print('Predikat: ${getPredikat(huruf)}');
  }
}
