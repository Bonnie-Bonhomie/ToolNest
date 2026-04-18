import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tool_nest/dependency/currency_dpdc.dart';
import 'package:tool_nest/viewModels/length_view_model.dart';
import 'package:tool_nest/viewModels/task_view_model.dart';
import 'package:tool_nest/viewModels/temp_view_model.dart';
import 'package:tool_nest/viewModels/weight_view_model.dart';

class AppDependencies {
  static final List<SingleChildWidget> providers = [
    ...provider,
    ...CurrencyDependencies.provider,
  ];
}

final List<ChangeNotifierProvider> provider = [
  // Converter Providers
  ChangeNotifierProvider<TempViewModel>(create: (context) => TempViewModel()),
  ChangeNotifierProvider<LengthViewModel>(create: (context) => LengthViewModel(),),
  ChangeNotifierProvider<WeightViewModel>(create: (context) => WeightViewModel(),),
  //Task Providers
  ChangeNotifierProvider<TaskViewModel>(create: (context) => TaskViewModel()),
];
