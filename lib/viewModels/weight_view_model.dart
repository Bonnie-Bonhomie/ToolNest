import 'package:flutter/widgets.dart';

class WeightViewModel extends ChangeNotifier {
  String _toUnit = 'Gram';
  String _fromUnit = 'Kilogram';
  double _input = 0.00;
  double _output = 0.00;

  String get toUnit => _toUnit;

  String get fromUnit => _fromUnit;

  double get input => _input;

  double get output => _output;

  Map<String, double> units = {
    'Gram': 1,
    'Kilogram': 1000,
  };

  void setInput(input) {
    _input = double.tryParse(input) ?? 0;
    notifyListeners();
  }

  void setFromUnit(unit) {
    _fromUnit = unit;
    convertToUnit();
  }

  void setToUnit(unit) {
    _toUnit = unit;
    convertToUnit();
  }

  void convertToUnit() {
    double weightInGram = (_input * units[_fromUnit]!);

    double convert = weightInGram / units[_toUnit]!;
    _output = convert;
    notifyListeners();
  }
}
