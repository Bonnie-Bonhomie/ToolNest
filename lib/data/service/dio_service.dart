import 'package:dio/dio.dart';
import 'package:tool_nest/core/resources/datastate.dart';


class DioClients{

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.exchangerate-api.com/v4/',
      receiveTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15)
    )
  );

  Future<DataState> getExchangeRate(String from, String to) async{
    try{
      final rate = await dio.get('latest/$from', );

      if(rate.statusCode == 200){
        final data = rate.data;
        return DataSuccess(data);
      }else{
        return DataFailed(DioException(requestOptions: RequestOptions(), error: 'Failed to load rate'));
      }
    }on DioException catch (e){
     return DataFailed(DioException(requestOptions: RequestOptions(), error: '${e.message}'));
    }
  }


}