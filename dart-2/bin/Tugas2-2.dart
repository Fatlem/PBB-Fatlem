import '../lib/libTugas2-2.dart';

void main() {
  // Persegi
  print("====|| Persegi ||====");
  Persegi p = new Persegi(2, 30);
  int luasPersegi = p.getLuas();
  int kelilingPersegi = p.getKeliling();

  print('Luas Persegi: $luasPersegi');
  print('Keliling Persegi: $kelilingPersegi');

  // Segitiga
  print("====|| Segitiga ||====");
  Segitiga s = new Segitiga(2, 10);
  double luasSegitiga = s.getLuas();
  int kelilingSegitiga = s.getKeliling();

  print('Luas Segitiga: $luasSegitiga');
  print('Keliling Segitiga: $kelilingSegitiga');

  // Lingkaran
  print("====|| Lingkaran ||====");
  Lingkaran l = new Lingkaran(7);
  double luasLingkaran = l.getLuas();
  double kelilingLingkaran = l.getKeliling();

  print('Luas Lingkaran: $luasLingkaran');
  print('Keliling Lingkaran: $kelilingLingkaran');

  // Kubus
  print("====|| Kubus ||====");
  Kubus k = new Kubus(4);
  int luasPermukaanKubus = k.getLuasPermukaan();
  int volumeKubus = k.getVolume();

  print('Luas Permukaan Kubus: $luasPermukaanKubus');
  print('Volume Kubus: $volumeKubus');
}
