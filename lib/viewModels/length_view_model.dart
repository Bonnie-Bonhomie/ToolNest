import 'package:flutter/material.dart';

class LengthViewModel extends ChangeNotifier{

  String _toUnit = 'Meter';
  String _fromUnit = 'Centimeter';
  double _input = 0.00;
  double _output = 0.00;

  String get toUnit => _toUnit;
  String get fromUnit => _fromUnit;
  double get input => _input;
  double get output => _output;

  Map<String, double> units = {
    'Millimeter': 0.001,
    'Centimeter': 0.01,
    'Decimeter': 0.1,
    'Meter' : 1,
    'Kilometer': 1000,

  };

  void setInput (input){
    _input = double.tryParse(input) ?? 0;
    // _input = _input +.00;
    notifyListeners();
  }
  void setFromUnit(unit){
    _fromUnit = unit;
    convertToUnit();
  }
  void setToUnit(unit){
    _toUnit = unit;
    convertToUnit();
  }

  void convertToUnit(){
    double lengthInMeter = (_input * units[_fromUnit]!);

    double convert = lengthInMeter / units[_toUnit]!;
    _output = convert;
    notifyListeners();
  }

}