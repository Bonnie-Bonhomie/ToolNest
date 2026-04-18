import 'package:flutter/material.dart';
import 'package:tool_nest/config/AppRoutes/route_name.dart';
import 'package:tool_nest/views/Tasks/add_tasks.dart';
import 'package:tool_nest/views/Tasks/my_task_view.dart';
import 'package:tool_nest/views/converters/currency_converter_view.dart';
import 'package:tool_nest/views/converters/length_converter.dart';
import 'package:tool_nest/views/converters/temp_converter_view.dart';
import 'package:tool_nest/views/converters/weight_converter_view.dart';
import 'package:tool_nest/views/home_view.dart';

class AppRoutes{
  static Map<String, WidgetBuilder> routes ={
    Routes.home: (context) => HomeView(),
    Routes.temp: (context) => TempConverterView(),
    Routes.currency: (context) => CurrencyConverterView(),
    Routes.length: (context) => LengthConverterView(),
    Routes.weight: (context) => WeightConverterView(),

    Routes.task: (context) => MyTasksView(),
    Routes.addTask: (context) => AddTaskView(),
  };
}