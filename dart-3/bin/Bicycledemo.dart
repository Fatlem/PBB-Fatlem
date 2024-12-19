import 'package:dart_application_1/Bicycle.dart';

class MountainBike extends Bicycle {
  int seatHeight = 0;
  void setHeight(int newValue) {
    seatHeight = newValue;
    print('Seat Height: $seatHeight');
  }
}
