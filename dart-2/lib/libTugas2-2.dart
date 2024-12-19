class Persegi {
  int p = 0, l = 0;
  int luas = 0;

  // constructor
  Persegi(int p, int l) {
    this.p = p;
    this.l = l;
  }

  int get nilai_P {
    return p;
  }

  int get nilai_l {
    return l;
  }

  void set nilai_l(int l) {
    this.l = l;
  }

  void set nilai_P(int p) {
    this.p = p;
  }

  int getLuas() {
    return p * l;
  }

  int getKeliling() {
    return 2 * p + l;
  }
}

// segitiga
class Segitiga {
  int a = 0, t = 0;
  int luas = 0;
  int keliling = 0;

  // constructor
  Segitiga(int a, int t) {
    this.a = a;
    this.t = t;
  }

  int get nilai_A {
    return a;
  }

  int get nilai_T {
    return t;
  }

  void set nilai_T(int l) {
    this.t = t;
  }

  void set nilai_A(int p) {
    this.a = a;
  }

  double getLuas() {
    return a * t / 2;
  }

  int getKeliling() {
    return 3 * a;
  }
}

// Lingkaran (Circle)
class Lingkaran {
  double r = 0;

  // constructor
  Lingkaran(double r) {
    this.r = r;
  }

  double get nilai_R {
    return r;
  }

  void set nilai_R(double r) {
    this.r = r;
  }

  double getLuas() {
    return 3.14 * r * r; // πr²
  }

  double getKeliling() {
    return 2 * 3.14 * r; // 2πr
  }
}

// Kubus (Cube)
class Kubus {
  int sisi = 0;

  // constructor
  Kubus(int sisi) {
    this.sisi = sisi;
  }

  int get nilai_Sisi {
    return sisi;
  }

  void set nilai_Sisi(int sisi) {
    this.sisi = sisi;
  }

  int getLuasPermukaan() {
    return 6 * sisi * sisi; // 6 * sisi²
  }

  int getVolume() {
    return sisi * sisi * sisi; // sisi³
  }
}
