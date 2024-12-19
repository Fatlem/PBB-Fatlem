import "package:dart_application_1/Karyawan.dart";

void main(List<String> arguments) {
  Karyawan staff1 = Karyawan("A123456", "Paijo"); // object
  Karyawan staff2 = Karyawan("B234567", "Dinda", thnMasuk: 2020);
  staff1.presensi(DateTime.parse("2024-10-01 08:30:07"));
  staff2.presensi(DateTime.parse("2024-10-01 08:01:03"));
  print(staff1.deskripsi());
  print(staff2.deskripsi());

  List<Karyawan> dataStaf = [];
  dataStaf.add(Karyawan("A123456", "Paijo"));
  dataStaf.add(Karyawan("B123456", "Nina"));
  dataStaf.add(Karyawan("C123456", "Bocil"));
  for (int x = 0; x < dataStaf.length; x++) print(dataStaf[x].deskripsi());
}
