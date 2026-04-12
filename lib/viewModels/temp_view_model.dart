import 'package:flutter/material.dart';


class TempViewModel extends ChangeNotifier{

  List<String> units =[
    'Kelvin', 'Celsius', 'Fahrenheit'
  ];

  double _input = 0.00;
  String _fromUnit = 'Celsius';
  String _toUnit = 'Kelvin';
  double _output = 0.00;
  String selectedUnit = 'Kelvin';

  double get input => _input;
  double get output => _output;
  String get fromUnit => _fromUnit;
  String get toUnit => _toUnit;
  //Kelvin and Celsius conversion
  void setInput (input){
    _input = double.tryParse(input) ?? 0;
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
    double tempInC;
    //Convert to celsius
    if(_fromUnit == 'Celsius'){
      tempInC = _input;
    }else if(fromUnit == 'Fahrenheit'){
      tempInC = ((_input -32) * 5)/9;

    }else{
      tempInC = _input - 273.15;
    }
    //Convert to Select Unit
    if(_toUnit == 'Celsius'){
      _output = tempInC;
      print(_output);
    }else if(toUnit == 'Fahrenheit'){
      _output =(tempInC * 9/5) +32;
    }else{
      _output = tempInC + 273.15;
    }

    notifyListeners();
  }

}
