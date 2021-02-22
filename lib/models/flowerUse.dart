import 'package:lilyora/models/flower.dart';

class FlowerUse{
  Flower flower;
  String _useDecoration;
  String _useCosmetic;
  String _useEdibility;
  String _useMedicinal;
  String _useEnvironmental;

  FlowerUse();

  String get useDecoration => _useDecoration;

  set useDecoration(String value) {
    _useDecoration = value;
  }

  String get useCosmetic => _useCosmetic;

  set useCosmetic(String value) {
    _useCosmetic = value;
  }

  String get useEnvironmental => _useEnvironmental;

  set useEnvironmental(String value) {
    _useEnvironmental = value;
  }

  String get useMedicinal => _useMedicinal;

  set useMedicinal(String value) {
    _useMedicinal = value;
  }

  String get useEdibility => _useEdibility;

  set useEdibility(String value) {
    _useEdibility = value;
  }
}