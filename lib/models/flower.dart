class Flower{
  String _flowerName;
  String _flowerScientificName;
  int _numOfPetals;

  Flower();

  String get flowerName => _flowerName;

  set flowerName(String value) {
    _flowerName = value;
  }

  String get flowerScientificName => _flowerScientificName;

  int get numOfPetals => _numOfPetals;

  set numOfPetals(int value) {
    _numOfPetals = value;
  }

  set flowerScientificName(String value) {
    _flowerScientificName = value;
  }
}