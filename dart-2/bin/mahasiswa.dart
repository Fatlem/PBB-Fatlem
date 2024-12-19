void main() {
  Mahasiswa mhs = new Mahasiswa();
  mhs.nim = 'A11.2022.14666';
  mhs.nama = 'Fuwawa';
  mhs.IPK = 3.8;

  mhs.view();
}

class Mahasiswa {
  String _nim = "";
  String _nama = "";
  double _ipk = 0.0;

  Mahasiswa() {
    print('~~ Data Mahasiswa ~~');
  }

  set nim(String value) {
    _nim = value;
  }

  String get nim => _nim;
  set nama(String value) {
    _nama = value;
  }

  String get nama => _nama;
  set IPK(double value) {
    _ipk = value >= 0 ? value : 0;
  }

  double get IPK => _ipk;

  void view() {
    print('Nim  : $nim');
    print('Nama : $nama');
    print('IPK  : ${IPK.toStringAsFixed(2)}');
  }
}
