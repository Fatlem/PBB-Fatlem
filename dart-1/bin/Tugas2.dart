import 'dart:math';

void main() {
  int pilih;

  print('Pilih Hitung Bentuk : ');
  print('1. Persegi');
  print('2. Lingkaran');
  print('3. Kubus');
  print('===================================');

  pilih = 3;

  if (pilih == 1) {
    //Persegi
    double sisi = 5;
    double luas = sisi * sisi;
    double keliling = 4 * sisi;

    print('Persegi  :');
    print('Sisi     : $sisi');
    print('Luas     : $luas');
    print('Keliling : $keliling');
  } else if (pilih == 2) {
    //Lingkaran
    double radius = 7;
    double luas = pi * radius * radius;
    double keliling = 2 * pi * radius;

    print('Lingkaran  :');
    print('Radius     : $radius');
    print('Luas       : $luas');
    print('Keliling   : $keliling');
  } else if (pilih == 3) {
    //Kubus
    double sisi = 4;
    double luaspermukaan = 6 * sisi * sisi;
    double volume = sisi * sisi * sisi;

    print('Kubus          :');
    print('Sisi           : $sisi');
    print('Luas Permukaan : $luaspermukaan');
    print('Volume         : $volume');
  } else {
    print('Hayooo!');
  }
}
