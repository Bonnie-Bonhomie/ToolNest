import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tool_nest/data/repositories/currency_repo.dart';
import 'package:tool_nest/data/service/dio_service.dart';
import 'package:tool_nest/viewModels/currency_view_model.dart';

class CurrencyDependencies{

  static final List<SingleChildWidget> provider = [
    Provider<DioClients>(create: (context) => DioClients()),
    Provider<CurrencyRepo>(create: (context) => CurrencyRepo(context.read<DioClients>())),
    ChangeNotifierProvider(create: (context) => CurrencyViewModel(context.read<CurrencyRepo>()))
  ];
}