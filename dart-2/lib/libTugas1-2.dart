class Mahasiswa {
  String _nim = "";
  String _nama = "";
  double _IPK = 0.0;

  Mahasiswa() {
    print("~~ Data Mahasiswa ~~");
  }

  void view() {
    print("NIM: $_nim");
    print("Nama: $_nama");
    print("IPK: $_IPK");
  }

  // Setter and getter
  set nim(String nim) {
    _nim = nim;
  }

  String get nim {
    return _nim;
  }

  set nama(String nama) {
    _nama = nama;
  }

  String get nama {
    return _nama;
  }

  set ipk(double ipk) {
    _IPK = ipk;
  }

  double get ipk {
    return _IPK;
  }
}
