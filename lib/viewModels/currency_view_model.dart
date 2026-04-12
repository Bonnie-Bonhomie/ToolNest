import 'package:flutter/cupertino.dart';
import 'package:tool_nest/data/models/currency_model.dart';
import 'package:tool_nest/data/repositories/currency_repo.dart';

class CurrencyViewModel extends ChangeNotifier {

  final CurrencyRepo service;

  CurrencyViewModel(this.service);

  String _toUnit = 'USD';
  String _fromUnit = 'NGN';
  double _input = 0.00;
  double _output = 0.00;
  String _error = '';
  bool _loading = false;

  String get toUnit => _toUnit;
  String get fromUnit => _fromUnit;
  double get input => _input;
  double get output => _output;
  String get error => _error;
  bool get loading => _loading;

  List<CurrencyModel> countries =[
    CurrencyModel(name: 'Nigeria', abbrev: 'NGN', unit: '₦'),
    CurrencyModel(name: 'US Dollar', abbrev: 'USD', unit: '\$'),
    CurrencyModel(name: 'Australian Dollar', abbrev: 'AUD', unit: '\$'),
    CurrencyModel(name: 'Argentine Peso', abbrev: 'ARS', unit: '\$'),
    CurrencyModel(name: 'Euro', abbrev: 'EUR', unit: '€'),
  ];

  void setInput(input) {
    _input = double.tryParse(input) ?? 0;
    notifyListeners();
  }

  void setFromUnit(unit) {
    _fromUnit = unit;
    _error ='';
    notifyListeners();
    convertToUnit();
    // print(_fromUnit);
  }

  void setToUnit(unit) {
    _toUnit = unit;
    _error ='';
    notifyListeners();
    convertToUnit();
  }

  Future<void> convertToUnit() async {
    _loading = true;
    try{
      final rate = await service.getExchangeRate(_fromUnit, _toUnit);
      _output = _input * rate;
      print(_output);
    }catch(e){
      _error = 'Unable to load exchange rate. Try again later';
      print(_error);
    }

    _loading = false;
    notifyListeners();
  }
}
