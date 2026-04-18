import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:tool_nest/config/app_storage_keys.dart';
import 'package:tool_nest/data/models/task_model.dart';
import 'package:tool_nest/dependency/app_dependencies.dart';
import 'package:tool_nest/utils/dismiss_keyboard.dart';
import 'app.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //Initialized Hive for the local Storage
  await Hive.initFlutter();
//Registering adapter
  Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<TaskModel>(AppKey.taskBox);

  runApp(MultiProvider(providers: AppDependencies.providers,
      child: DismissKeyboard(child: const MyApp())));
}



