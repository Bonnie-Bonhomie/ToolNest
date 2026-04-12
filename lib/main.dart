import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tool_nest/dependency/app_dependencies.dart';
import 'package:tool_nest/utils/dismiss_keyboard.dart';
import 'app.dart';

void main() {
  runApp(MultiProvider(providers: AppDependencies.providers, child: DismissKeyboard(child: const MyApp())));
}



