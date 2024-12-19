class MountainBike {
  int speed = 0;
  int gear = 0;
  int height = 0;
  // method
  void changeGear(int newValue) {
    gear = gear + newValue;
    print(" \nGear: $gear");
  }

  void speedUp(int increment) {
    speed = speed + increment;
    print(" \nSpeed: $speed");
  }

  void setHeight(int newValue) {
    height = height + newValue;
    print("\nheight: $height");
  }
}
