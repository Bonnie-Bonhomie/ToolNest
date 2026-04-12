import 'package:dio/dio.dart';
import 'package:tool_nest/core/resources/datastate.dart';
import 'package:tool_nest/data/service/dio_service.dart';

class CurrencyRepo{

  final DioClients dio;
  CurrencyRepo(this.dio);

  Future<double> getExchangeRate(String from, String to) async{

      final rate = await dio.getExchangeRate(from, to);

      if(rate is DataSuccess){
        final data = rate.data;
        // print((data['rates'][to] as num).toDouble());
        return (data['rates'][to] as num).toDouble();
      }else{
        throw DioException(requestOptions: RequestOptions(path: '', ), error: 'Failed to load rate');
      }
  }

}